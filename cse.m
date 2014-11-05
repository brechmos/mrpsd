%
%  CSE
%
%    Example file for creating a simple CSE PSD.
%
%

%
%  $Id: cse.m,v 1.3 2000/03/06 14:39:11 craig Exp $
%
[a] = psd_setup({'RF', 'G_x', 'G_y', 'G_z'});

rf = a(1);
gx = a(2);
gy = a(3);
gz = a(4);

esp = 20; 	% ms
t=10;

%--------------------------------------------------
%
%  90 degree slice select
%

rf_sinc(rf, 5, 5, 0.5);
grad_rewind(gz, t, 5, 0.5, 5/2, -0.5);

%--------------------------------------------------
%
%  Crusher
%
grad(gx, t+5, 2, 1.0);

%--------------------------------------------------
%
%  Phase encode.
%
phase_multi(gy, t+5, 3, 0.6);

%repeatopen(t+esp/2, 6);

t = t+esp;

for echo=1:4

	%--------------------------------------------------
	%
	%  Crusher
	%
	grad(gz, t-2-2-1, 2, (-1)^(echo+1)*round((5-echo)/2)/2);

	%--------------------------------------------------
	%
	%  180 degree slice select
	%
	
	rf_sinc(rf, t, 3, 0.8);

	%--------------------------------------------------
	%
	%  Crusher
	%
	grad(gz, t+5, 2, (-1)^(echo+1)*round((5-echo)/2)/2);

	%--------------------------------------------------
	%
	%  Readout
	%
	grad_crushed(gx, t+esp, 8, 0.2, 2, 1.0);

	t = t + 2*esp;

end

%repeatclose(t, 6, 'N');

%--------------------------------------------------
%
%  Phase Killer.
%
grad_phase(gy, t+esp+8, 4, 1.0);

h=text(190, 2.6, '...'); 
set(h, 'fontsize', 24);
set(h, 'fontweight', 'bold');

%title('2-D Multi-Echo Spin-Echo');
