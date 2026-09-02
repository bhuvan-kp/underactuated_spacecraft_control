function varargout = has_graphmodel(varargin)
    %HAS_GRAPHMODEL [INTERNAL] 
    %
    %  bool = HAS_GRAPHMODEL(char name)
    %
    %Check if a graph-model format plugin is available.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/graph_model.hpp#L77
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/graph_model.cpp#L77-L77
    %
    %
    %
  [varargout{1:nargout}] = casadiMEX(908, varargin{:});
end
