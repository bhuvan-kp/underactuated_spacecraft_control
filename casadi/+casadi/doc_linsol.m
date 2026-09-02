function varargout = doc_linsol(varargin)
    %DOC_LINSOL [INTERNAL] 
    %
    %  char = DOC_LINSOL(char name)
    %
    %Get the documentation string for a plugin.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/linsol.hpp#L237
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/linsol.cpp#L237-L239
    %
    %
    %
  [varargout{1:nargout}] = casadiMEX(956, varargin{:});
end
