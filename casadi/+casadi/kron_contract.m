function varargout = kron_contract(varargin)
    %KRON_CONTRACT [INTERNAL] 
    %
    %  MX = KRON_CONTRACT(MX m, MX x, bool inner)
    %
    %Kronecker contraction.
    %
    %inner = true: Y[i, j] = sum over (r, s) of M[i*mB+r, j*nB+s] * X[r, s]  
    %inner = false: Y[r, s] = sum over (i, j) of X[i, j] * M[i*mB+r, j*nB+s]
    %
    %Closes the AD algebra of kron under arbitrary-order differentiation.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_2ho
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.hpp#L1121
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.hpp#L1121-L1123
    %
    %
  [varargout{1:nargout}] = casadiMEX(747, varargin{:});
end
