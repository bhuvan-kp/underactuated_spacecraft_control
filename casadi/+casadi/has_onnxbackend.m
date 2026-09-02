function varargout = has_onnxbackend(varargin)
    %HAS_ONNXBACKEND [INTERNAL] 
    %
    %  bool = HAS_ONNXBACKEND(char solver)
    %
    %Check if a given ONNX runtime backend is available.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_2j8
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/onnx_function.hpp#L31
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/onnx_function.cpp#L31-L33
    %
    %
    %
  [varargout{1:nargout}] = casadiMEX(904, varargin{:});
end
