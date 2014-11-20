%
% grad_phase(channel, start, width, amp)
%
% channel = gradient channel ('x', 'y', or 'z')
% start = starting time of gradient (in ms)
% width = width of gradient (in ms)
% amp = amplitude of gradient (0.0 < pulse_amp < 1.0)
%

%
%  $Id: grad_phase.m,v 1.3 2000/03/06 14:39:11 craig Exp $
%
function [h] = grad_phase(channel, start, width, amp)

scaled_amp = 0.5 * amp;

x=(-width/2:0.005:width/2);
hold on;
h=plot(x+start+width/2, scaled_amp*sinc(x/width*2)+channel);

