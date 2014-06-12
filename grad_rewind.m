%
% grad_rewind(channel, start, width, amp, rewind_width, rewind_amp)
%
% channel = 'x', 'y', 'z'
% start = starting time of gradient (in ms)
% width = width of gradient (in ms)
% amp = amplitude of gradient (0.0 < amp < 1.0)
% rewind_width = width of rewinder gradient (in ms)
% rewind_amp = amplitude of rewinder gradient (0.0 < amp < 1.0)
%

%
%  $Id: grad_rewind.m,v 1.2 2000/03/06 14:39:11 craig Exp $
%
function [h] = grad_rewind(channel, start, width, amp, rewind_width, rewind_amp)

global rise_time;

%--------------------------------------------------
%
%  If we are not going to do bridged gradients then set
%  the starting and ending amplitudes to 0.
%

if nargin ~= 6
	error('grad_rewind:  Wrong number of parameters passed in.');
end

%%%% Main Gradient
grad(channel, start, width, amp);

%%%% Rewinder
grad(channel, start+width, rewind_width, rewind_amp);

h = 0;
