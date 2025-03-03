with builtins;

let 
	numAtPos = pos : str: builtins.fromJSON (builtins.substring pos 1 str);
	fact = n: if n == 0 then 1 else n*fact(n - 1);
	factOfDigits = str : pos : if pos == (stringLength str) then 0 else (factOfDigits str (pos + 1)) + (fact (numAtPos pos str));
	isFactorialDigit = num : 
		let 
			str = (toString num); 
		in
			if num == (factOfDigits str 0) then true else false;

	sumFactDigits = max: curr : val : (if (curr == max) then val else (sumFactDigits max (curr + 1) (if (isFactorialDigit curr) then (curr + val) else val)));

	batch = curr : val : if (curr > (fact 9)) then val else (sumFactDigits (curr + 4000) curr val)  + (batch (curr + 4000) val);
in 
	batch 3 0

