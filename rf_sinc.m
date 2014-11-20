%
% rf_sinc(channel, start, width, amp, num_lobes)
%
% channel = 'rf'
% start = starting time of gradient (in ms)
% width = width of gradient (in ms)
% amp = amplitude of gradient (0.0 < amp < 1.0)
% num_lobes = number of lobes in the sinc (def = 3)
%

%
%  $Id: rf_sinc.m,v 1.3 2000/03/06 14:39:11 craig Exp $
%
function [h] = rf_sinc(channel, start, width, amp, num_lobes)

if nargin == 4
	num_lobes = 3;
end

scaled_amp = 0.5 * amp;

x=(-width/2:0.01:width/2);
hold on;
h=plot(x+start+width/2, scaled_amp*sinc(x/width*2*(floor(num_lobes/2)+1))+channel);

