%
% repeatopen(start, width)
%
% start = starting time of repeat bracket (in ms)
% width = length of the bottom part of the bracket (in ms, def=10)
%
%

%
%  $Id: repeatopen.m,v 1.3 2000/03/06 14:39:11 craig Exp $
%
function [lt, ll, lb] = repeatopen(start, width)

if nargin == 1
	width = 10;
end

global num_axes;

lt = line([ start start+width], [0.05 0.05], 'LineStyle', ':');
ll = line([ start start], [0.05 num_axes+1], 'LineStyle', ':');
lb = line([ start start+width], [num_axes+1 num_axes+1], 'LineStyle', ':');
