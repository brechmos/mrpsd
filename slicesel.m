%
% slicesel(start, width, pulse_amp, grad_amp, crusher_width, crusher_amp)
%
% start = starting time of gradient (in ms)
% width = width of gradient (in ms)
% pulse_amp = amplitude of pulse (0.0 < pulse_amp < 1.0)
% grad_amp = amplitude of gradient (0.0 < grad_amp < 1.0)
% crusher_amp = amplitude of crusher gradient (0.0 < crusher_amp < 1.0)
%

%
%  $Id: slicesel.m,v 1.3 2000/03/06 14:39:11 craig Exp $
%
function [h] = slicesel(rf, gz, start, width, pulse_amp, grad_amp, crusher_width, crusher_amp)

if nargin == 6
	[ht] = grad(gz, start, width, grad_amp);
	[ht] = grad_rewind(gz, start, width, grad_amp, width/2, -grad_amp);
else
	[ht] = grad_crushed(gz, start, width, grad_amp, crusher_width, crusher_amp);
end

ht2=rf_sinc(rf, start, width, pulse_amp);

if( nargout > 0 )
	h=[ht ht2];
end
