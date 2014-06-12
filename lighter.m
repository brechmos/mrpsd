%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   lighter(h)
%	Used to lighten some gradient or pulse in the
%	sequence.
%	h = handles to lighten as passed back from gradient or pulse
%

%
%  $Id: lighter.m,v 1.2 2000/03/06 14:39:11 craig Exp $
%
function [] = lighter(h)

for index=1:length(h)
	set(h(index), 'color', [.7 .7 .7]);
end
