function varargout = onnxbackend_doc(varargin)
    %ONNXBACKEND_DOC [INTERNAL] 
    %
    %  char = ONNXBACKEND_DOC(char solver)
    %
    %Get documentation for an ONNX runtime backend.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_2jb
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/onnx_function.hpp#L45
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/onnx_function.cpp#L45-L47
    %
    %
    %
  [varargout{1:nargout}] = casadiMEX(907, varargin{:});
end
