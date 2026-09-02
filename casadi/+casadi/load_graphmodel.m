function varargout = load_graphmodel(varargin)
    %LOAD_GRAPHMODEL [INTERNAL] 
    %
    %  LOAD_GRAPHMODEL(char name)
    %
    %Explicitly load a graph-model format plugin.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/graph_model.hpp#L78
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/graph_model.cpp#L78-L78
    %
    %
    %
  [varargout{1:nargout}] = casadiMEX(909, varargin{:});
end
