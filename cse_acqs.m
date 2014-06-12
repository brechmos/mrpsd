%
%  CPMG_ACQS
%
%    Example file to show how to add the data acquisitions to the 
%    plot.
%

%
%  $Id: cse_acqs.m,v 1.2 2000/03/06 14:39:11 craig Exp $
%

psd_setup;

set(gca, 'ylim', [-0.2 1]);

set(rft, 'units', 'data', 'position', [-10 0.8]);
set(gxt, 'units', 'data', 'position', [-10 0.6]);
set(gyt, 'units', 'data', 'position', [-10 0.4]);
set(gzt, 'units', 'data', 'position', [-10 0.2]);
acqt=text(-14,0.0,'ACQ');
acql=line([0 9000], [0 0]);

esp = 20; 	% ms
t=10;

%--------------------------------------------------
%
%  90 degree slice select
%

rf_sinc(t, 5, 5, 0.5);
grad_rewind('z', t, 5, 0.5, 5/2, -0.5);

%--------------------------------------------------
%
%  Crusher
%
grad('x', t+5, 2, 1.0);

%--------------------------------------------------
%
%  Phase encode.
%
phase_multi('y', t+5, 3, 0.6);

t = t+esp;

for echo=1:4

	%--------------------------------------------------
	%
	%  Crusher
	%
	grad('z', t-2-2-1, 2, (-1)^(echo+1)*round((5-echo)/2)/2);

	%--------------------------------------------------
	%
	%  180 degree slice select
	%
	
	rf_sinc('rf', t, 3, 0.8);

	%--------------------------------------------------
	%
	%  Crusher
	%
	grad('z', t+5, 2, (-1)^(echo+1)*round((5-echo)/2)/2);

	%--------------------------------------------------
	%
	%  Readout
	%
	grad_crushed('x', t+esp, 8, 0.2, 2, 1.0);
   hacq = rf_sinc('x', t+esp, 5, 0.5);  % Data Acquisition
   set(hacq, 'ydata', get(hacq, 'ydata')-0.8);

	t = t + 2*esp;

end

%--------------------------------------------------
%
%  Phase Killer.
%
phase('y', t+esp+8, 4, 1.0);

h=text(190, 0.5, '...'); 
set(h, 'fontsize', 24);
set(h, 'fontweight', 'bold');

title('2-D Multi-Echo Spin-Echo');
