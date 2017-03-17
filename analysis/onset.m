% onset detection
function O = onset(x)
	x_max = max(x);
	nu = 0.999;
	b = [1-nu];
	a = [1 -nu];
	env = filter(b, a, abs(x));


	O = env/x_max;
end