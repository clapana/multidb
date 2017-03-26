% onset detection con enrgia dall'envelope follower
function O = onset4(x)

	onsets = zeros(size(x));
	x_max = max(x);
	nu = 0.9995;
	b = [1-nu];
	a = [1 -nu];
	env = filter(b, a, abs(x));
	env = env/x_max;

	win = 400;
	dim = floor(size(x, 1)/win);

	found = 0;
	threshold = 1;
	
	for i = 2 : dim
			value = sum(env(win*(i-1):win*i - 1).^2) - sum(env(1 + win*(i-2):win*(i-1) -1).^2);

		%rectification
		if (value > threshold && found == 0)
			onsets(1 + (i-2)*win) = 1;
			found = 1;
		endif
		if (value <= threshold && found == 1)
			found = 0;
		endif
	end

	O = onsets;
end