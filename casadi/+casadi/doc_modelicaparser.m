function varargout = doc_modelicaparser(varargin)
    %DOC_MODELICAPARSER [INTERNAL] 
    %
    %  char = DOC_MODELICAPARSER(char name)
    %
    %Get solver specific documentation.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/modelica_parser.hpp#L68
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/modelica_parser.cpp#L68-L70
    %
    %
    %
  [varargout{1:nargout}] = casadiMEX(984, varargin{:});
end
