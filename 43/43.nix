with builtins;
let
	lib = import <nixpkgs/lib>;
	mod = n1 : n2 : (n1 - ((floor (n1 / n2)) * n2));
	toInt = n : fromJSON (lib.concatStrings (genList (x : toString (elemAt n x)) (length n)));
	subStringAsInt = arr : s : l :  (toInt (if ((elemAt arr s) == 0)  then (lib.sublist (s + 1) (l - 1) arr) else (lib.sublist s l arr)));
	sortRange = s : e : arr : ((lib.sublist 0 s arr) ++ (lib.sort (a : b : a > b) (lib.sublist s e arr)) ++ (lib.sublist e (length arr) arr)) ;

	swap = x : y : arr : 
	let
		elem1 = elemAt arr x;
		elem2 = elemAt arr y;
	in
		genList (i : if i == x then elem2 else ( if i == y then elem1 else elemAt arr i)) (length arr);

	isSubstringDivisible = n : 
		let 
			arr = (map (x : fromJSON x) (lib.stringToCharacters (toJSON n)));
		in
			if 
			(mod (subStringAsInt arr 1 3) 2) == 0 &&
			(mod (subStringAsInt arr 2 3) 3) == 0 &&
			(mod (subStringAsInt arr 3 3) 5) == 0 &&
			(mod (subStringAsInt arr 4 3) 7) == 0 &&
			(mod (subStringAsInt arr 5 3) 11) == 0 &&
			(mod (subStringAsInt arr 6 3) 13) == 0 &&
			(mod (subStringAsInt arr 7 3) 17) == 0
			then true 
			else false;

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
			
			newArr = if firstCharPos == -1 then -1 else (sortRange (firstCharPos + 1) (length arr) ( swap firstCharPos secondCharPos arr));
			newVal = if newArr != -1 then (if  (elemAt newArr 0 ) == 0 then toInt(lib.sublist 1 (length newArr) newArr) else toInt(newArr)) else -1;
			
			in
				 newVal; 

	countRange = n : curr : end : count : if n == (-1) then [count (-1)] else (if curr == end then [count n]
		else
			countRange (nextNum n) (curr + 1) end (if isSubstringDivisible n then (count + n) else count)); 

	countAll = curr : count :
		let 
			res = (countRange curr 0 1000 0);
			done = ((elemAt res 1) == -1);
			newCount = (count + (elemAt res 0));
		in 
			if done then newCount
				else (countAll (elemAt res 1) newCount);

in	 
	countAll 9876543210 0

