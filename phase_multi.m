%
% phase_multi(channel, start, width, amp)
%
% channel = gradient channel ('x', 'y', or 'z')
% start = starting time of gradient (in ms)
% width = width of gradient (in ms)
% amp = amplitude of gradient (0.0 < pulse_amp < 1.0)
%

%
%  $Id: phase_multi.m,v 1.3 2000/03/06 14:39:11 craig Exp $
%
function [h] = phase_multi(channel, start, width, amp)

scaled_amp = 0.5 * amp;

x=(-width/2:0.01:width/2);
hold on;
h(1)=plot(x+start+width/2, 1.0*scaled_amp*sinc(x/width*2)+channel); hold on;
h(2)=plot(x+start+width/2, 0.67*scaled_amp*sinc(x/width*2)+channel); hold on;
h(3)=plot(x+start+width/2, 0.33*scaled_amp*sinc(x/width*2)+channel); hold on;
h(4)=plot(x+start+width/2, -0.33*scaled_amp*sinc(x/width*2)+channel); hold on;
h(5)=plot(x+start+width/2, -0.67*scaled_amp*sinc(x/width*2)+channel); hold on;
h(6)=plot(x+start+width/2, -1.0*scaled_amp*sinc(x/width*2)+channel); hold on;
