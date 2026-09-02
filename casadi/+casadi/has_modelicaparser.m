function varargout = has_modelicaparser(varargin)
    %HAS_MODELICAPARSER [INTERNAL] 
    %
    %  bool = HAS_MODELICAPARSER(char name)
    %
    %Check if a particular plugin is available.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/modelica_parser.hpp#L60
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/modelica_parser.cpp#L60-L62
    %
    %
    %
  [varargout{1:nargout}] = casadiMEX(982, varargin{:});
end
