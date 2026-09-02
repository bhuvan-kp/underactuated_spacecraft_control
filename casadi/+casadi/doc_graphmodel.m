function varargout = doc_graphmodel(varargin)
    %DOC_GRAPHMODEL [INTERNAL] 
    %
    %  char = DOC_GRAPHMODEL(char name)
    %
    %Get format-specific documentation.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/graph_model.hpp#L79
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/graph_model.cpp#L79-L79
    %
    %
    %
  [varargout{1:nargout}] = casadiMEX(910, varargin{:});
end
