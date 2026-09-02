function varargout = temporary_file(varargin)
    %TEMPORARY_FILE [INTERNAL] 
    %
    %  char = TEMPORARY_FILE(char prefix, char suffix, char directory)
    %
    %
  [varargout{1:nargout}] = casadiMEX(40, varargin{:});
end
