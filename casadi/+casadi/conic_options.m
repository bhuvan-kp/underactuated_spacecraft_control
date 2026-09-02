function varargout = conic_options(varargin)
    %CONIC_OPTIONS [INTERNAL] 
    %
    %  {char} = CONIC_OPTIONS(char name)
    %
    %Get all options for a plugin.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1ek
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/conic.hpp#L579
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/conic.cpp#L579-L581
    %
    %
    %
  [varargout{1:nargout}] = casadiMEX(885, varargin{:});
end
