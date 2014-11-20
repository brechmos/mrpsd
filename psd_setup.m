%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%  MR Pulse Sequence Diagrammer (PSD)
%
%

%
%  $Id: psd_setup.m,v 1.3 2000/03/06 14:39:11 craig Exp $
%

function [an, al] = psd_setup(axes_labels);

% I hate global variables, but this is probably the best way of doing this.
global rise_time;
global num_axes;

%
%  Number of axes...
%
num_axes = length(axes_labels);

rise_time=.6;	% Rise time for the gradients from 0 to full (in ms)

figure(1),clf;
set(1, 'inverthard', 'off');
%set(1, 'paperorient', 'landscape');
%set(1, 'color', [1 1 1]);
%set(1, 'defaultlinecolor', [0 0 0]);
%set(1, 'defaulttextcolor', [0 0 0]);
set(1, 'defaultlinelinewidth', 1.1);
set(1, 'defaultaxeslinewidth', 1.1);
set(1, 'defaulttextfontweight', 'bold');
set(1, 'defaultaxesfontweight', 'bold');
set(1, 'defaulttextfontsize', 15);
set(1, 'defaultaxesfontsize', 15);
%set(1, 'defaultaxescolororder', [0 0 0]);
%set(gca, 'xcolor', [0 0 0]);
set(1,'defaultlineLineSmoothing','on');

for ii=1:num_axes

	an(num_axes - ii + 1) = ii;

	%
	%  Draw the line.
	%
	line([-10 9000], [ii ii]);

	%
	%  Put the text.
	%
	text(-0.01, (num_axes-ii+1) / (num_axes+1), axes_labels{ii}, ...
				'units', 'normalized', 'horizontalalign', 'right');
end
axis([0 200 0 num_axes+1]);
set(gca, 'ytick', []);

xlabel('Time (ms)');
