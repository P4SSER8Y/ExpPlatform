function [varargout] = ImportFromBiometricsTextFile(filename, varargin)
%	ImportFromBiometricsTextFile    load Biometrics data file
%       Usage:
%           [FirstOutput, SecondOutput, ...] = ...
%               Misc.ImportFromBiometricsTextFile(filename, FirstRange, SecondRange, ...)
%
%       Arguments:
%           filename [Required]: the data file. if not found, it will search './data/' folder
%           ranges [Optional]: provide the sliced range
%
%       Examples:
%           [raw_x, raw_y] = Misc.ImportFromBiometricsTextFile('./file/name', 1:2, 3);
%           [all] = Misc.ImportFromBiometricsTextFile('./file/name');
%           [all] = Misc.ImportFromBiometricsTextFile('./file/name', []);
%           [raw_x, raw_y, all] = Misc.ImportFromBiometricsTextFile('./file/name', 1, 2, []);
%
%       Update:
%           2018-01-07: init
%

    if (nargin < 1)
        error('Please provile file name');
    end
    if ~exist(filename, 'file')
        filename = ['./data/', filename];
    end
    raw = importdata(filename);
    if isempty(varargin)
        varargout{1} = raw.data;
    else
        varargout = cell(nargin - 1, 1);
        for i = 1:(nargin - 1)
            if isempty(varargin{i})
                varargout{i} = raw.data;
            else
                varargout{i} = raw.data(:, varargin{i});
            end
        end
    end
end