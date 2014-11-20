%
%  EPI
%
%    An example file for showing how to create a simple EPI PSD.
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

grad(gx, t, 2, -1.0);
grad_phase(gy, t, 2, -1.0);

t = 12;
for ii=1:8
	grad(gx, t, 5, -(2*(mod(ii,2)==0)-1)*0.5);
	t = t + 5;

	grad_phase(gy, t, 1, 4*(1/32));
	t = t + 1;

end
set(gca, 'xlim', [0 80]);
%title('2-D Fast Spin-Echo');
