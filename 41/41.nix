with builtins;
let
	lib = import <nixpkgs/lib>;
	mod = n1 : n2 : (n1 - ((floor (n1 / n2)) * n2));
	isPrime = n : curr : if (curr * curr) > n then true else (if (mod n curr) == 0 then false else (seq curr (isPrime n (curr + 1))));
	sortRange = s : e : arr : ((lib.sublist 0 s arr) ++ (lib.sort (a : b : a > b) (lib.sublist s e arr)) ++ (lib.sublist e (length arr) arr)) ;

	swap = x : y : arr : 
	let
		elem1 = elemAt arr x;
		elem2 = elemAt arr y;
	in 
		genList (i : if i == x then elem2 else ( if i == y then elem1 else elemAt arr i)) (length arr);

	toInt = n : fromJSON (lib.concatStrings (genList (x : toString (elemAt n x)) (length n)));

	nextNum = n : 
		let 
			arr = (map (x : fromJSON x) (lib.stringToCharacters (toJSON n)));

			findFirstChar = pos : if pos == -1  then -1 else 
				(
					if (elemAt arr pos) > (elemAt arr (pos + 1)) then pos
					else (findFirstChar (pos - 1)));

			firstCharPos = (findFirstChar ((length arr) - 2));
			firstChar = if firstCharPos == -1 then -1 else (elemAt arr firstCharPos);

			findSecondChar = min : minPos : pos : if pos == (length arr) then minPos else
					(let 
						curr = elemAt arr pos;
					in
						if curr < firstChar && curr > min then findSecondChar curr (pos) (pos + 1) else findSecondChar min minPos (pos + 1));

			secondCharPos = (if firstChar == -1 then -1 else findSecondChar (elemAt arr (firstCharPos + 1)) (firstCharPos + 1) firstCharPos);

		in
			if firstCharPos == -1 then -1 else toInt (sortRange (firstCharPos + 1) (length arr) ( swap firstCharPos secondCharPos arr));

	returnIfPrimeRange = n : curr : max : if curr == max || n == -1 then [(-1) (-1)] else ( if (isPrime n 2) then [(1) (n)] else returnIfPrimeRange (nextNum n) (curr + 1) max);

	startNum = "987654321";
	pandigitalPrime = curr : digits :
		let 
			realCurr = if curr != -1 then curr else (fromJSON(substring (digits) (9 - digits) startNum)) ;

			res = (returnIfPrimeRange realCurr 0 1000);
			ok = ((elemAt res 0) == 1);
			next = ((elemAt res 1) == -1) && ((elemAt res 0) == -1) ;
		in 
			if ok then (elemAt res 1)
				else (if next then (pandigitalPrime (-1) (digits + 1) ) else pandigitalPrime  (elemAt res 1) 0);

in	 
	 (pandigitalPrime (-1) 0)
