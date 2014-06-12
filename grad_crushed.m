%
% grad_crushed(channel, start, width, amp, crusher_width, crusher_amp)
%
% channel = 'x', 'y', 'z'
% start = starting time of gradient (in ms)
% width = width of gradient (in ms)
% amp = amplitude of gradient (0.0 < amp < 1.0)
% crusher_width = width of the crusher (in ms)
% crusher_amp = amplitude of the crusher (0.0 < crusher_amp < 1.0)
%
%

%
%  $Id: grad_crushed.m,v 1.3 2000/03/06 14:39:11 craig Exp $
%
function [h] = grad_crushed(channel, start, width, amp, crusher_width, crusher_amp)

global rise_time;

%--------------------------------------------------
%
%  Check for the right number of parameters.
%

if nargin ~= 6
	error('grad:  Wrong number of parameters passed in.');
end

%--------------------------------------------------
%
%  Plot it all out.
%

%%%% Left Crusher
h1 = grad(channel, start, crusher_width, crusher_amp, 0, amp);

%%%% Gradient 
h2 = grad(channel, start+crusher_width, width-2*crusher_width, amp, amp, amp); 

%%%% Right Crusher
h3 = grad(channel, start+crusher_width+width-2*crusher_width, crusher_width, crusher_amp, amp, 0); 

if( nargout > 0 )
	h = [ h1; h2; h3 ];
end
