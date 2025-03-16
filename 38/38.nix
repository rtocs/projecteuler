with builtins;
let 
	containsAllDigits = str : let
		nums = match "([0-9])([0-9])([0-9])([0-9])([0-9])([0-9])([0-9])([0-9])([0-9])" str;
	in
		if nums == null then false else(
			if elem "1" nums &&
				elem "2" nums &&
				elem "3" nums &&
				elem "4" nums &&
				elem "5" nums &&
				elem "6" nums &&
				elem "7" nums &&
				elem "8" nums &&
				elem "9" nums then true 
			else false
		);

	makePandigitalNum = str : num : curr : if 
		(curr > 9 || stringLength str > 9 ) then 
		( if containsAllDigits str then (fromJSON str) else (-1)) 
	else 
		( if containsAllDigits str  then (fromJSON str)
		else makePandigitalNum (str + toString ( num * curr ) ) num (curr + 1));




	# nix does not have tail call elimination nix
	biggestPandigitalNumInRange =  curr : end : maxVal : if curr > end then maxVal else (
		let 
			pan = (makePandigitalNum (toString curr) curr 2);
		in 
			if pan > maxVal then (biggestPandigitalNumInRange (curr + 1) end pan) else (biggestPandigitalNumInRange (curr + 1) end maxVal));


	batchSize = 1000;
	batch = currVal : currMax : if currVal > 99999 then currMax else batch (currVal + batchSize ) (biggestPandigitalNumInRange currVal (currVal + batchSize) currMax);
in
	batch 1 1



