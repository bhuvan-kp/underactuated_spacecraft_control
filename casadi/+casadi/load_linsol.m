function varargout = load_linsol(varargin)
    %LOAD_LINSOL [INTERNAL] 
    %
    %  LOAD_LINSOL(char name)
    %
    %Explicitly load a plugin dynamically.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/linsol.hpp#L233
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/linsol.cpp#L233-L235
    %
    %
    %
  [varargout{1:nargout}] = casadiMEX(955, varargin{:});
end
