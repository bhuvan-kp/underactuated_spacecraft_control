function varargout = graph_substitute(varargin)
    %GRAPH_SUBSTITUTE Substitute multiple expressions in graph.
    %
    %  MX = GRAPH_SUBSTITUTE(MX ex, {MX} v, {MX} vdef)
    %  {MX} = GRAPH_SUBSTITUTE({MX} ex, {MX} v, {MX} vdef)
    %
    %
    %Substitute variable var with expression expr in multiple expressions, 
    %
    %preserving nodes
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_ra
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.hpp#L863
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.hpp#L863-L867
    %
    %
  [varargout{1:nargout}] = casadiMEX(1001, varargin{:});
end
