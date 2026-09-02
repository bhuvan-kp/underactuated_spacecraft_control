function varargout = nlpsol_options(varargin)
    %NLPSOL_OPTIONS [INTERNAL] 
    %
    %  {char} = NLPSOL_OPTIONS(char name)
    %
    %Get all options for a plugin.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1t5
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/nlpsol.hpp#L919
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/nlpsol.cpp#L919-L921
    %
    %
    %
  [varargout{1:nargout}] = casadiMEX(898, varargin{:});
end
