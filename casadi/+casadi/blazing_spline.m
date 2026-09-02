function varargout = blazing_spline(varargin)
    %BLAZING_SPLINE [INTERNAL] 
    %
    %  Function = BLAZING_SPLINE(char name, {[double]} knots, struct opts)
    %  Function = BLAZING_SPLINE(char name, [int] knot_dims, struct opts)
    %
    %Construct a parametric-knots blazing_spline.
    %
    %Like blazing_spline, but the knot values are provided as a symbolic 
    %input 
    %at evaluation time instead of being fixed at construction time. 
    %Only knot 
    %vector  sizes (per dimension) are needed at construction.
    %
    %The resulting  Function has inputs (x, C, knots) where knots is the stacked 
    %knot vector. 
    %Supports the same precompute_coeff and precompute_grid options
    % as the 
    %fixed-knots variant.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_2g0
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/blazing_spline.hpp#L181
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/blazing_spline.cpp#L181-L207
    %
    %
    %
    %.......
    %
    %::
    %
    %  BLAZING_SPLINE(char name, {[double]} knots, struct opts)
    %
    %
    %
    %[INTERNAL] 
    %Construct a specialized parametric BSpline.
    %
    %Specialized in these ways:
    %order 3 is assumed
    %
    %up to dimension 5 supported
    %
    %a single scalar output (m=1)
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_2b9
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/blazing_spline.hpp#L175
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/blazing_spline.cpp#L175-L179
    %
    %
    %
    %.............
    %
    %
    %.......
    %
    %::
    %
    %  BLAZING_SPLINE(char name, [int] knot_dims, struct opts)
    %
    %
    %
    %[INTERNAL] 
    %Construct a parametric-knots blazing_spline.
    %
    %Like blazing_spline, but the knot values are provided as a symbolic 
    %input 
    %at evaluation time instead of being fixed at construction time. 
    %Only knot 
    %vector  sizes (per dimension) are needed at construction.
    %
    %The resulting  Function has inputs (x, C, knots) where knots is the stacked 
    %knot vector. 
    %Supports the same precompute_coeff and precompute_grid options
    % as the 
    %fixed-knots variant.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_2g0
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/blazing_spline.hpp#L181
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/blazing_spline.cpp#L181-L207
    %
    %
    %
    %.............
    %
    %
  [varargout{1:nargout}] = casadiMEX(975, varargin{:});
end
