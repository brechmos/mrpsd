%
% rf_extern(channel, start, width, amp, filename, offset, N, datatype)
%
%   This will read in an external rf file.  It will read in N "datatype"
%   starting from "offset".
%
% channel = 'rf'
% start = starting time of gradient (in ms)
% width = width of gradient (in ms)
% amp = amplitude of gradient (0.0 < amp < 1.0)
% filename = extern filename (.rho file)
% offset = offset in file to start reading data
% N = number of "datatype"'s to read
% datatype = type of data ("short", "uint16", "float" etc)
%

%
%  $Id: rf_extern.m,v 1.3 2000/03/06 14:39:11 craig Exp $
%
function [h,rf0] = rf_extern(channel, start, width, amp, ...
                             filename, offset, N, datatype)

fp=fopen(filename, 'r', 'b');
fseek(fp, offset, 'bof');
rf0 = fread(fp,N,datatype);
rf0 = rf0 ./ max(rf0);
fclose(fp);

scaled_amp = 0.5 * amp;

x=(0:1/length(rf0):1-1/length(rf0))' * width;
hold on;
h=plot(x+start, channel+scaled_amp*rf0);

