%
%  FSE
%
%    An example file for showing how to create a simple FSE PSD.
%

%
%  $Id: fse.m,v 1.3 2000/03/06 14:39:11 craig Exp $
%
a = psd_setup({'RF', 'G_x', 'G_y', 'G_z'});

rf = a(1);
gx = a(2);
gy = a(3);
gz = a(4);

phase_amp=[-0.8 -0.4 0.4 0.8];

esp = 20; 	% ms
t=10;

%--------------------------------------------------
%
%  90 degree slice select
%

slicesel(rf, gz, 5, 3.0, 0.6, 0.3);

%--------------------------------------------------
%
%  Crusher
%
grad(gx, t+5, 2, 1.0);

repeatopen(t+esp/2);

t = t+esp;

for echo=1:4

	%--------------------------------------------------
	%
	%  180 degree slice select
	%
	slicesel(rf, gz, t, 5.0, 0.6, 0.3, 1.2, 1);

	%--------------------------------------------------
	%
	%  Phase encode.
	%
	phase(gy, t+esp-2, 2, phase_amp(echo));

	%--------------------------------------------------
	%
	%  Readout
	%
	grad_crushed(gx, t+esp, 8, 0.2, 2, 1.0);

	%--------------------------------------------------
	%
	%  Phase rewind.
	%
	phase(gy, t+esp+8, 2, -phase_amp(echo));

	t = t + 2*esp;

end

repeatclose(t, 8, 'n');

%title('2-D Fast Spin-Echo');
