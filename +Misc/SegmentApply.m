function [ ret ] = SegmentApply(in, width, fun)
%Misc.SegmentApply segment all the data along the DIM-1 and process them
%   Usage:
%       y = Misc.SegmentApply(x, width, @fun);
%
%   Arguments:
%       x: the input signals
%       width: width of segment
%       fun: function 
%
%   Examples:
%       y = Misc.SegmentApply(x, 50, @mean);
%       y = Misc.SegmentApply(x, 50, @(x)(sum(x)));
%
%   History:
%       2018-01-07: init
%

    % expand to appropriate size
    if (mod(size(in, 1), width) ~= 0)
        M = ceil(size(in, 1) / width) * width;
        in(M, 1) = 0;
    else
        M = size(in, 1);
    end
    
    % segment and process
    t = mat2cell(in, ones(1, M / width) * width, ones(1, size(in, 2)));
    ret = cellfun(fun, t);
end
