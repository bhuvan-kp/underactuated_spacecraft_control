function varargout = onnxbackend_solvers(varargin)
    %ONNXBACKEND_SOLVERS [INTERNAL] 
    %
    %  {char} = ONNXBACKEND_SOLVERS()
    %
    %List available ONNX runtime backends.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_2ja
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/onnx_function.hpp#L39
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/onnx_function.cpp#L39-L43
    %
    %
    %
  [varargout{1:nargout}] = casadiMEX(906, varargin{:});
end
