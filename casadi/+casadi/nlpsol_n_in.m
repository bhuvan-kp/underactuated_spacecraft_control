function varargout = nlpsol_n_in(varargin)
    %NLPSOL_N_IN [INTERNAL] 
    %
    %  int = NLPSOL_N_IN()
    %
    %Number of NLP solver inputs.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1t2
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/nlpsol.hpp#L338
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/nlpsol.cpp#L338-L340
    %
    %
    %
  [varargout{1:nargout}] = casadiMEX(895, varargin{:});
end
