function varargout = to_slice2(varargin)
    %TO_SLICE2 [INTERNAL] 
    %
    %  std::pair< casadi::Slice,casadi::Slice > = TO_SLICE2([int] v)
    %
    %Construct nested slices from an index vector (requires 
    %is_slice2(v) to
    % be true)
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/slice.hpp#L254
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/slice.cpp#L254-L287
    %
    %
    %
  [varargout{1:nargout}] = casadiMEX(218, varargin{:});
end
