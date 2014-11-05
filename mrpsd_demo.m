%
%  FSE
%
%    An example file for showing how to create a simple FSE PSD.
%

%
%  $Id: demo.m,v 1.3 2000/03/06 14:39:11 craig Exp $
%

clc
disp('Setup the inital axes etc...');
a = psd_setup({'RF', 'G_x', 'G_y', 'G_z'});

rf = a(1);
gx = a(2);
gy = a(3);
gz = a(4);

pause;

clc
disp('Setup the grad_phase amplitudes...');

phase_amp=[-0.8 -0.4 0.4 0.8]
pause;

clc
disp('Define some variables...');

esp = 20 	% ms
t=10

pause

%--------------------------------------------------
%
%  90 degree slice select
%
clc
disp('Add the initial slice select...');

set(gca, 'xlim', [0, 40]);
slicesel(rf, gz, 5, 3.0, 0.6, 0.3);

pause;

%--------------------------------------------------
%
%  Crusher
%
clc
disp('Add the gradient crusher...');

grad(gx, t+5, 2, 1.0);

pause;

clc
disp('Add the opening repeat bar...');
repeatopen(t+esp/2);

pause;

t = t+esp;

for echo=1:4

	clc
	disp('Now for the next echo');

	t+2*esp
	set(gca, 'xlim', [0, t+2*esp]);

	pause

	%--------------------------------------------------
	%
	%  180 degree slice select
	%
	clc
	disp('Add the slice select gradient/rf pulse...');

	slicesel(rf, gz, t, 5.0, 0.6, 0.3, 1.2, 1);

	pause

	%--------------------------------------------------
	%
	%  Phase encode.
	%
	clc
	disp('Add the stepped grad_phase encode...');

	grad_phase(gy, t+esp-2, 2, phase_amp(echo));

	pause

	%--------------------------------------------------
	%
	%  Readout
	%
	clc
	disp('Add the readout...');

	grad_crushed(gx, t+esp, 8, 0.2, 2, 1.0);

	pause

	%--------------------------------------------------
	%
	%  Phase rewind.
	%
	clc
	disp('Add the rewinder...');

	grad_phase(gy, t+esp+8, 2, -phase_amp(echo));

	pause

	t = t + 2*esp;

end

repeatclose(t, 8, 'n');

title('2-D Fast Spin-Echo');
