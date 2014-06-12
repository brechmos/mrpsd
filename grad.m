%
% grad(channel, start, width, amp, start_amp, end_amp)
%
% channel = 'x', 'y', 'z'
% start = starting time of gradient (in ms)
% width = width of gradient (in ms)
% amp = amplitude of gradient (0.0 < amp < 1.0)
% start_amp = start amplitude of attack (0.0 < start_amp < 1.0, def: amp)
% end_amp = end amplitude of the decay (0.0 < end_amp < 1.0, def: amp)
%
%

%
%  $Id: grad.m,v 1.3 2000/03/06 14:39:11 craig Exp $
%
function [h] = grad(channel, start, width, amp, start_amp, end_amp)

global rise_time;

%--------------------------------------------------
%
%  If we are not going to do bridged gradients then set
%  the starting and ending amplitudes to 0.
%

if nargin == 4
	start_amp = 0;
	end_amp = 0;
else
	if nargin ~= 6
		error('grad:  Wrong number of parameters passed in.');
	end
end


y = channel;

%--------------------------------------------------
%
%  Scale the amplitude.
%

scaled_amp = 0.5 * amp;
scaled_start_amp = 0.5 * start_amp;
scaled_end_amp = 0.5 * end_amp;

%--------------------------------------------------
%
%  Plot it all out.
%

%%%% Attack.
b = start;
e = start + abs(amp-start_amp) * rise_time;
ll = line([b e], [y+scaled_start_amp y+scaled_amp]);

%%%% Flat.
b = start + abs(amp-start_amp) * rise_time;
e = b + width - abs(amp-end_amp) * rise_time - abs(amp-start_amp) * rise_time;
lt = line([b e], [y+scaled_amp y+scaled_amp]);

%%%% Decay.
b = e;
e = b + abs(amp-end_amp) * rise_time;
lr = line([b e], [y+scaled_amp y+scaled_end_amp]);

if( nargout > 0 )
	h=[ll lt lr];
end
