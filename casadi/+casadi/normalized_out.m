function varargout = normalized_out(varargin)
    %NORMALIZED_OUT [INTERNAL] 
    %
    %  std::ostream & = NORMALIZED_OUT(double val)
    %
    %
  [varargout{1:nargout}] = casadiMEX(44, varargin{:});
end
