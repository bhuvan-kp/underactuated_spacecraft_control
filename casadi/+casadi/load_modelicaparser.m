function varargout = load_modelicaparser(varargin)
    %LOAD_MODELICAPARSER [INTERNAL] 
    %
    %  LOAD_MODELICAPARSER(char name)
    %
    %Explicitly load a plugin dynamically.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/modelica_parser.hpp#L64
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/modelica_parser.cpp#L64-L66
    %
    %
    %
  [varargout{1:nargout}] = casadiMEX(983, varargin{:});
end
