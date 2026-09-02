function varargout = blockcat(varargin)
    %BLOCKCAT Construct a matrix from 4 blocks.
    %
    %  DM = BLOCKCAT({{DM}} v)
    %  SX = BLOCKCAT({{SX}} v)
    %  MX = BLOCKCAT({{MX}} v)
    %
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_3m
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/sparsity_interface.hpp#L235
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/sparsity_interface.hpp#L235-L237
    %
    %
    %
  [varargout{1:nargout}] = casadiMEX(999, varargin{:});
end
