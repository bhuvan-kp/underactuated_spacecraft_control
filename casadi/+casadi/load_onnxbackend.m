function varargout = load_onnxbackend(varargin)
    %LOAD_ONNXBACKEND [INTERNAL] 
    %
    %  LOAD_ONNXBACKEND(char solver)
    %
    %Load an ONNX runtime backend.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_2j9
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/onnx_function.hpp#L35
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/onnx_function.cpp#L35-L37
    %
    %
    %
  [varargout{1:nargout}] = casadiMEX(905, varargin{:});
end
