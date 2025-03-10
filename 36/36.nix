with builtins;
let 
	mostSignificantBit = num : currVal : if (currVal * 2) <= num then mostSignificantBit num (currVal * 2) else currVal;
	numAsBinaryString = num : mostSignificantBitVal : str : 
		if mostSignificantBitVal == 1 then (if num == 1 then str + "1" else str + "0") else 
			( if num >= mostSignificantBitVal then numAsBinaryString (num - mostSignificantBitVal) (mostSignificantBitVal / 2) (str + "1") 
				else numAsBinaryString (num ) (mostSignificantBitVal / 2) (str + "0"));

	revString = str : let
		len = stringLength  str;
		rev = pos : ret : if pos == -1 then ret else rev (pos - 1) (ret + (substring pos 1 str));
	in 
		rev len "";

	isPali = num : let
		numBinaryString = (numAsBinaryString num (mostSignificantBit num 1) "");
		numAsString = (toJSON num);
	in
		(((revString numAsString) == numAsString) && ((revString numBinaryString)  == numBinaryString));


	sumPalindromesRange = start : end :
		let 

			sumRange = curr : val : if (curr >= end || curr >= 1000000)   then val else (sumRange (curr + 1) (val + (if (isPali curr) then curr else 0)));
		in
			sumRange start 0;

	batch = curr : val : if (curr > 1000000) then val else ((batch (curr + 3000 ) (val + (sumPalindromesRange curr (3000 + curr)))));

in
	batch 0 0




