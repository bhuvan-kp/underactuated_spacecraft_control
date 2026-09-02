function varargout = has_blas(varargin)
    %HAS_BLAS [INTERNAL] 
    %
    %  bool = HAS_BLAS(char name)
    %
    %
  [varargout{1:nargout}] = casadiMEX(1245, varargin{:});
end
