%
% rf_hard(channel, start, width, amp)
%
% channel = 'x', 'y', 'z'
% start = starting time of gradient (in ms)
% width = width of gradient (in ms)
% amp = amplitude of gradient (0.0 < amp < 1.0)
%

%
%  $Id: rf_hard.m,v 1.3 2000/03/06 14:39:11 craig Exp $
%
function [h] = rf_hard(channel, start, width, amp, annotate)

%--------------------------------------------------
%
%  Scale the amplitude.
%

scaled_amp = 0.5 * amp;

%--------------------------------------------------
%
%  Plot it all out.
%

ll = line([start start], [channel channel+scaled_amp]);
lt = line([start start+width], [channel+scaled_amp channel+scaled_amp]);
lr = line([start+width start+width], [channel+scaled_amp channel]);
h=[ll lt lr];
