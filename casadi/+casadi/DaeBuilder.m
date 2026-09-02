classdef  DaeBuilder < casadi.SharedObject & casadi.PrintableCommon & SwigRef
    %DAEBUILDER [INTERNAL] 
    %
    %
    %A symbolic representation of a differential-algebraic equations 
    %model.
    %
    %Variables:
    %==========
    %
    %
    %
    %
    %
    %::
    %
    %  t:      independent variable (usually time)
    %  c:      constants
    %  p:      parameters
    %  d:      dependent parameters (time independent)
    %  u:      controls
    %  w:      dependent variables  (time dependent)
    %  x:      differential states
    %  z:      algebraic variables
    %  q:      quadrature states
    %  y:      outputs
    %  
    %
    %
    %
    %Equations:
    %==========
    %
    %
    %
    %
    %
    %::
    %
    %  differential equations: \\dot{x} ==  ode(...)
    %  algebraic equations:          0 ==  alg(...)
    %  quadrature equations:   \\dot{q} == quad(...)
    %  dependent parameters:         d == ddef(d_prev,p)
    %  dependent variables:          w == wdef(w_prev,x,z,u,p,t)
    %  output equations:             y == ydef(...)
    %  initial equations:     init_lhs == init_rhs(...)
    %  events:      when when_cond < 0: when_lhs := when_rhs
    %  
    %
    %
    %
    %Joel Andersson
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_5c
    %
    %C++ includes: dae_builder.hpp
    %
    %
  methods
    function this = swig_this(self)
      this = casadiMEX(3, self);
    end
    function varargout = type_name(self,varargin)
    %TYPE_NAME [INTERNAL] 
    %
    %  char = TYPE_NAME(self)
    %
    %Readable name of the class.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L74
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L74-L74
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1113, self, varargin{:});
    end
    function varargout = name(self,varargin)
    %NAME [INTERNAL] 
    %
    %  char = NAME(self)
    %
    %Name of instance.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_5d
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L86
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L59-L61
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1114, self, varargin{:});
    end
    function varargout = time(self,varargin)
    %TIME [INTERNAL] 
    %
    %  MX = TIME(self)
    %
    %Expression for independent variable (usually time)
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_2by
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L93
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L63-L71
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1115, self, varargin{:});
    end
    function varargout = t_new(self,varargin)
    %T_NEW [INTERNAL] 
    %
    %  {char} = T_NEW(self)
    %
    %Independent variable (usually time)
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_2bz
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L98
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L98-L98
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1116, self, varargin{:});
    end
    function varargout = x(self,varargin)
    %X [INTERNAL] 
    %
    %  {char} = X(self)
    %
    %Differential states.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_5f
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L103
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L103-L103
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1117, self, varargin{:});
    end
    function varargout = y(self,varargin)
    %Y [INTERNAL] 
    %
    %  {char} = Y(self)
    %
    %Outputs.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_2fu
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L108
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L108-L108
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1118, self, varargin{:});
    end
    function varargout = z(self,varargin)
    %Z [INTERNAL] 
    %
    %  {char} = Z(self)
    %
    %Algebraic variables.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_2fv
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L113
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L113-L113
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1119, self, varargin{:});
    end
    function varargout = q(self,varargin)
    %Q [INTERNAL] 
    %
    %  {char} = Q(self)
    %
    %Quadrature states.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_2fw
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L118
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L118-L118
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1120, self, varargin{:});
    end
    function varargout = inputs(self,varargin)
    %INPUTS [INTERNAL] 
    %
    %  {MX} = INPUTS(self, char cat)
    %
    % Input expressions for a specific category.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_2fx
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L123
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L73-L80
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1121, self, varargin{:});
    end
    function varargout = ode(self,varargin)
    %ODE [DEPRECATED] Replaced with outputs("ode")
    %
    %  {MX} = ODE(self)
    %
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L132
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L132-L132
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1122, self, varargin{:});
    end
    function varargout = alg(self,varargin)
    %ALG [DEPRECATED] Replaced with outputs("alg")
    %
    %  {MX} = ALG(self)
    %
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L135
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L135-L135
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1123, self, varargin{:});
    end
    function varargout = quad(self,varargin)
    %QUAD [DEPRECATED] Replaced with outputs("quad")
    %
    %  {MX} = QUAD(self)
    %
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L138
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L138-L138
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1124, self, varargin{:});
    end
    function varargout = zero(self,varargin)
    %ZERO [DEPRECATED] Replaced with outputs("zero")
    %
    %  {MX} = ZERO(self)
    %
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L141
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L141-L141
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1125, self, varargin{:});
    end
    function varargout = ydef(self,varargin)
    %YDEF [DEPRECATED] Replaced with outputs("y")
    %
    %  {MX} = YDEF(self)
    %
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L144
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L144-L144
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1126, self, varargin{:});
    end
    function varargout = set_y(self,varargin)
    %SET_Y [DEPRECATED] Replaced with set_all("y", name)
    %
    %  SET_Y(self, {char} name)
    %
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L147
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L147-L147
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1127, self, varargin{:});
    end
    function varargout = u(self,varargin)
    %U [INTERNAL] 
    %
    %  {char} = U(self)
    %
    %Free controls.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_5n
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L153
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L153-L153
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1128, self, varargin{:});
    end
    function varargout = p(self,varargin)
    %P [INTERNAL] 
    %
    %  {char} = P(self)
    %
    %Parameters.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_5o
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L158
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L158-L158
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1129, self, varargin{:});
    end
    function varargout = c(self,varargin)
    %C [INTERNAL] 
    %
    %  {char} = C(self)
    %
    %Named constants.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_5p
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L163
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L163-L163
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1130, self, varargin{:});
    end
    function varargout = cdef(self,varargin)
    %CDEF [INTERNAL] 
    %
    %  {MX} = CDEF(self)
    %
    %Definitions of named constants.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_5q
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L168
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L91-L98
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1131, self, varargin{:});
    end
    function varargout = d(self,varargin)
    %D [INTERNAL] 
    %
    %  {char} = D(self)
    %
    %Dependent parameters.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_5r
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L173
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L173-L173
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1132, self, varargin{:});
    end
    function varargout = ddef(self,varargin)
    %DDEF [INTERNAL] 
    %
    %  {MX} = DDEF(self)
    %
    %Definitions of dependent parameters.
    %
    %Interdependencies are allowed but must be non-cyclic.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_5s
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L180
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L100-L107
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1133, self, varargin{:});
    end
    function varargout = w(self,varargin)
    %W [INTERNAL] 
    %
    %  {char} = W(self)
    %
    %Dependent variables.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_5t
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L185
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L185-L185
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1134, self, varargin{:});
    end
    function varargout = wdef(self,varargin)
    %WDEF [INTERNAL] 
    %
    %  {MX} = WDEF(self)
    %
    %Dependent variables and corresponding definitions.
    %
    %Interdependencies are allowed but must be non-cyclic.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_5u
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L192
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L109-L116
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1135, self, varargin{:});
    end
    function varargout = init_lhs(self,varargin)
    %INIT_LHS [INTERNAL] 
    %
    %  {MX} = INIT_LHS(self)
    %
    %Initial conditions, left-hand-side.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_2b1
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L197
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L118-L120
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1136, self, varargin{:});
    end
    function varargout = init_rhs(self,varargin)
    %INIT_RHS [INTERNAL] 
    %
    %  {MX} = INIT_RHS(self)
    %
    %Initial conditions, right-hand-side.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_2b2
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L202
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L122-L124
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1137, self, varargin{:});
    end
    function varargout = outputs(self,varargin)
    %OUTPUTS [DEPRECATED] Renamed "y"
    %
    %  {char} = OUTPUTS(self)
    %  {MX} = OUTPUTS(self, char cat)
    %
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L206
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L206-L206
    %
    %
    %
    %.......
    %
    %::
    %
    %  OUTPUTS(self)
    %
    %
    %
    %[DEPRECATED] Renamed "y"
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L206
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L206-L206
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
    %  OUTPUTS(self, char cat)
    %
    %
    %
    %[INTERNAL] 
    % Output expressions for a specific category.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_2fy
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L128
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L82-L89
    %
    %
    %
    %.............
    %
    %
      [varargout{1:nargout}] = casadiMEX(1138, self, varargin{:});
    end
    function varargout = derivatives(self,varargin)
    %DERIVATIVES [DEPRECATED] Renamed "der"
    %
    %  {char} = DERIVATIVES(self)
    %
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L209
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L209-L209
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1139, self, varargin{:});
    end
    function varargout = initial_unknowns(self,varargin)
    %INITIAL_UNKNOWNS [INTERNAL] 
    %
    %  {char} = INITIAL_UNKNOWNS(self)
    %
    %Model structure: initial unknowns.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_63
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L215
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L135-L142
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1140, self, varargin{:});
    end
    function varargout = has_t(self,varargin)
    %HAS_T [INTERNAL] 
    %
    %  bool = HAS_T(self)
    %
    %Is there a time variable?
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_64
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L223
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L144-L151
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1141, self, varargin{:});
    end
    function varargout = nx(self,varargin)
    %NX [INTERNAL] 
    %
    %  int = NX(self)
    %
    %Differential states.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_65
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L228
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L153-L155
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1142, self, varargin{:});
    end
    function varargout = nz(self,varargin)
    %NZ [INTERNAL] 
    %
    %  int = NZ(self)
    %
    %Algebraic variables.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_66
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L233
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L157-L159
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1143, self, varargin{:});
    end
    function varargout = nq(self,varargin)
    %NQ [INTERNAL] 
    %
    %  int = NQ(self)
    %
    %Quadrature states.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_67
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L238
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L161-L163
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1144, self, varargin{:});
    end
    function varargout = nzero(self,varargin)
    %NZERO [INTERNAL] 
    %
    %  int = NZERO(self)
    %
    %Zero-crossing functions.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_2cb
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L243
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L165-L167
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1145, self, varargin{:});
    end
    function varargout = ny(self,varargin)
    %NY [INTERNAL] 
    %
    %  int = NY(self)
    %
    % Output variables.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_68
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L248
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L169-L171
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1146, self, varargin{:});
    end
    function varargout = nu(self,varargin)
    %NU [INTERNAL] 
    %
    %  int = NU(self)
    %
    %Free controls.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_69
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L253
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L173-L175
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1147, self, varargin{:});
    end
    function varargout = np(self,varargin)
    %NP [INTERNAL] 
    %
    %  int = NP(self)
    %
    %Parameters.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_6a
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L258
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L177-L179
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1148, self, varargin{:});
    end
    function varargout = nc(self,varargin)
    %NC [INTERNAL] 
    %
    %  int = NC(self)
    %
    %Named constants.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_6b
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L263
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L181-L183
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1149, self, varargin{:});
    end
    function varargout = nd(self,varargin)
    %ND [INTERNAL] 
    %
    %  int = ND(self)
    %
    %Dependent parameters.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_6c
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L268
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L185-L187
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1150, self, varargin{:});
    end
    function varargout = nw(self,varargin)
    %NW [INTERNAL] 
    %
    %  int = NW(self)
    %
    %Dependent variables.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_6d
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L273
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L189-L191
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1151, self, varargin{:});
    end
    function varargout = add(self,varargin)
    %ADD [INTERNAL] 
    %
    %  MX = ADD(self, char name, struct opts)
    %  MX = ADD(self, char name, char causality, struct opts)
    %  MX = ADD(self, char name, char causality, char variability, struct opts)
    %  ADD(self, char name, char causality, char variability, MX expr, struct opts)
    %
    %Add a new model variable, symbolic expression already available.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L297
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L370-L383
    %
    %
    %
    %.......
    %
    %::
    %
    %  ADD(self, char name, struct opts)
    %
    %
    %
    %[INTERNAL] 
    %Add a new model variable, default variability and causality.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L293
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L361-L368
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
    %  ADD(self, char name, char causality, struct opts)
    %
    %
    %
    %[INTERNAL] 
    %Add a new model variable, default variability.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L288
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L352-L359
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
    %  ADD(self, char name, char causality, char variability, struct opts)
    %
    %
    %
    %[INTERNAL] 
    %Add a new model variable.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L282
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L341-L350
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
    %  ADD(self, char name, char causality, char variability, MX expr, struct opts)
    %
    %
    %
    %[INTERNAL] 
    %Add a new model variable, symbolic expression already available.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L297
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L370-L383
    %
    %
    %
    %.............
    %
    %
      [varargout{1:nargout}] = casadiMEX(1152, self, varargin{:});
    end
    function varargout = eq(self,varargin)
    %EQ [INTERNAL] 
    %
    %  EQ(self, MX lhs, MX rhs, struct opts)
    %
    %Add a simple equation.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L304
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L385-L391
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1153, self, varargin{:});
    end
    function varargout = when(self,varargin)
    %WHEN [INTERNAL] 
    %
    %  WHEN(self, MX cond, {char} eqs, struct opts)
    %
    %Add when equations.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L307
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L393-L399
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1154, self, varargin{:});
    end
    function varargout = assign(self,varargin)
    %ASSIGN [INTERNAL] 
    %
    %  char = ASSIGN(self, char name, MX val)
    %
    %Assignment inside a when-equation or if-else equation.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L310
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L401-L408
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1155, self, varargin{:});
    end
    function varargout = reinit(self,varargin)
    %REINIT [INTERNAL] 
    %
    %  char = REINIT(self, char name, MX val)
    %
    %Reinitialize a state inside when-equations.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L313
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L410-L417
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1156, self, varargin{:});
    end
    function varargout = set_init(self,varargin)
    %SET_INIT [INTERNAL] 
    %
    %  SET_INIT(self, char name, MX init_rhs)
    %
    %Specify the initial equation for a variable.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L316
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L419-L425
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1157, self, varargin{:});
    end
    function varargout = sanity_check(self,varargin)
    %SANITY_CHECK [INTERNAL] 
    %
    %  SANITY_CHECK(self)
    %
    %Check if dimensions match.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L319
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L427-L433
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1158, self, varargin{:});
    end
    function varargout = reorder(self,varargin)
    %REORDER [INTERNAL] 
    %
    %  REORDER(self, char cat, {char} v)
    %
    %Reorder variables in a category.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L323
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L333-L339
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1159, self, varargin{:});
    end
    function varargout = set_all(self,varargin)
    %SET_ALL [INTERNAL] 
    %
    %  SET_ALL(self, char v, {char} name)
    %
    %Set all variables within a a category.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L326
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L281-L331
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1160, self, varargin{:});
    end
    function varargout = eliminate(self,varargin)
    %ELIMINATE [INTERNAL] 
    %
    %  ELIMINATE(self, char cat)
    %
    %Eliminate all dependent parameters.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L335
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L530-L536
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1161, self, varargin{:});
    end
    function varargout = sort(self,varargin)
    %SORT [INTERNAL] 
    %
    %  SORT(self, char cat)
    %
    %Sort dependent parameters.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L338
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L538-L544
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1162, self, varargin{:});
    end
    function varargout = lift(self,varargin)
    %LIFT [INTERNAL] 
    %
    %  LIFT(self, bool lift_shared, bool lift_calls)
    %
    %Lift problem formulation by extracting shared subexpressions.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L341
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L546-L552
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1163, self, varargin{:});
    end
    function varargout = prune(self,varargin)
    %PRUNE [INTERNAL] 
    %
    %  PRUNE(self, bool prune_p, bool prune_u)
    %
    %Prune unused controls.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L344
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L238-L244
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1164, self, varargin{:});
    end
    function varargout = tear(self,varargin)
    %TEAR [INTERNAL] 
    %
    %  TEAR(self)
    %
    %Identify iteration variables and residual equations using naming
    % 
    %convention.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L347
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L246-L252
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1165, self, varargin{:});
    end
    function varargout = add_fun(self,varargin)
    %ADD_FUN [INTERNAL] 
    %
    %  Function = ADD_FUN(self, Function f)
    %  Function = ADD_FUN(self, char name, Importer compiler, struct opts)
    %  Function = ADD_FUN(self, char name, {char} arg, {char} res, struct opts)
    %
    %Add an external function.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L364
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L814-L817
    %
    %
    %
    %.......
    %
    %::
    %
    %  ADD_FUN(self, Function f)
    %
    %
    %
    %[INTERNAL] 
    %Add an already existing function.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L361
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L795-L802
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
    %  ADD_FUN(self, char name, Importer compiler, struct opts)
    %
    %
    %
    %[INTERNAL] 
    %Add an external function.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L364
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L814-L817
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
    %  ADD_FUN(self, char name, {char} arg, {char} res, struct opts)
    %
    %
    %
    %[INTERNAL] 
    %Add a function from loaded expressions.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L356
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L804-L812
    %
    %
    %
    %.............
    %
    %
      [varargout{1:nargout}] = casadiMEX(1166, self, varargin{:});
    end
    function varargout = has_fun(self,varargin)
    %HAS_FUN [INTERNAL] 
    %
    %  bool = HAS_FUN(self, char name)
    %
    %Does a particular function already exist?
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L368
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L819-L826
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1167, self, varargin{:});
    end
    function varargout = fun(self,varargin)
    %FUN [INTERNAL] 
    %
    %  {Function} = FUN(self)
    %  Function = FUN(self, char name)
    %
    %Get all functions.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L374
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L858-L860
    %
    %
    %
    %.......
    %
    %::
    %
    %  FUN(self)
    %
    %
    %
    %[INTERNAL] 
    %Get all functions.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L374
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L858-L860
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
    %  FUN(self, char name)
    %
    %
    %
    %[INTERNAL] 
    %Get function by name.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L371
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L828-L835
    %
    %
    %
    %.............
    %
    %
      [varargout{1:nargout}] = casadiMEX(1168, self, varargin{:});
    end
    function varargout = gather_fun(self,varargin)
    %GATHER_FUN [INTERNAL] 
    %
    %  GATHER_FUN(self, int max_depth)
    %
    %Collect embedded functions from the expression graph.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L377
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L837-L856
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1169, self, varargin{:});
    end
    function varargout = parse_fmi(self,varargin)
    %PARSE_FMI [INTERNAL] 
    %
    %  PARSE_FMI(self, char filename)
    %
    %Import existing problem from FMI/XML
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L384
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L384-L384
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1170, self, varargin{:});
    end
    function varargout = provides_directional_derivatives(self,varargin)
    %PROVIDES_DIRECTIONAL_DERIVATIVES [INTERNAL] 
    %
    %  bool = PROVIDES_DIRECTIONAL_DERIVATIVES(self)
    %
    %Does the FMU provide support for analytic derivatives.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L387
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L201-L209
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1171, self, varargin{:});
    end
    function varargout = provides_directional_derivative(self,varargin)
    %PROVIDES_DIRECTIONAL_DERIVATIVE [INTERNAL] 
    %
    %  bool = PROVIDES_DIRECTIONAL_DERIVATIVE(self)
    %
    %Does the FMU provide support for analytic derivatives (FMI 2 
    %naming)
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L390
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L390-L390
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1172, self, varargin{:});
    end
    function varargout = load_fmi_description(self,varargin)
    %LOAD_FMI_DESCRIPTION [INTERNAL] 
    %
    %  LOAD_FMI_DESCRIPTION(self, char filename)
    %
    %Import problem description from FMI or XML.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L393
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L193-L199
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1173, self, varargin{:});
    end
    function varargout = export_fmu(self,varargin)
    %EXPORT_FMU [INTERNAL] 
    %
    %  struct = EXPORT_FMU(self, struct opts)
    %
    %Export instance into an FMU.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L396
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L211-L218
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1174, self, varargin{:});
    end
    function varargout = compile_fmu(self,varargin)
    %COMPILE_FMU [INTERNAL] 
    %
    %  struct = COMPILE_FMU(self, struct files, struct opts)
    %
    %Compile the sources produced by export_fmu.
    %
    %Parameters:
    %-----------
    %
    %files: 
    %the {local_file -> archive path} map returned by export_fmu
    %
    %opts: 
    %compile options: compiler, compiler_options, include_dirs
    %
    %the file map augmented with the amalgamation source and compiled 
    %binary
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_2iq
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L405
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L220-L227
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1175, self, varargin{:});
    end
    function varargout = pack_fmu(self,varargin)
    %PACK_FMU [INTERNAL] 
    %
    %  char = PACK_FMU(self, struct files, struct opts)
    %
    %Pack files from export_fmu / compile_fmu into a single .fmu 
    %archive.
    %
    %Parameters:
    %-----------
    %
    %files: 
    %the {local_file -> archive path} map to pack
    %
    %opts: 
    %packaging options: path (default '<name>.fmu')
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_2ir
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L413
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L229-L236
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1176, self, varargin{:});
    end
    function varargout = add_lc(self,varargin)
    %ADD_LC [INTERNAL] 
    %
    %  ADD_LC(self, char name, {char} f_out)
    %
    %Add a named linear combination of output expressions.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L416
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L755-L762
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1177, self, varargin{:});
    end
    function varargout = create(self,varargin)
    %CREATE [INTERNAL] 
    %
    %  Function = CREATE(self)
    %  Function = CREATE(self, char fname, struct opts)
    %  Function = CREATE(self, char name, {char} name_in, {char} name_out, struct opts)
    %  Function = CREATE(self, char fname, {char} name_in, {char} name_out, bool sx, bool lifted_calls)
    %
    %Create a function with standard integrator DAE signature, 
    %default 
    %naming.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_2c1
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L448
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L448-L448
    %
    %
    %
    %.......
    %
    %::
    %
    %  CREATE(self)
    %
    %
    %
    %[INTERNAL] 
    %Create a function with standard integrator DAE signature, 
    %default 
    %naming.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_2c1
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L448
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L448-L448
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
    %  CREATE(self, char fname, struct opts)
    %
    %
    %
    %[INTERNAL] 
    %Create a function with standard integrator DAE signature.
    %
    %Parameters:
    %-----------
    %
    %name: 
    %Name assigned to the resulting function object
    %
    %opts: 
    %Optional settings
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_2c0
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L443
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L786-L793
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
    %  CREATE(self, char name, {char} name_in, {char} name_out, struct opts)
    %
    %
    %
    %[INTERNAL] 
    %Construct a function object, names provided.
    %
    %Parameters:
    %-----------
    %
    %name: 
    %Name assigned to the resulting function object
    %
    %name_in: 
    %Names of all the inputs
    %
    %name_out: 
    %Names of all the outputs
    %
    %opts: 
    %Optional settings
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_6e
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L431
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L775-L784
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
    %  CREATE(self, char fname, {char} name_in, {char} name_out, bool sx, bool lifted_calls)
    %
    %
    %
    %[INTERNAL] 
    %Construct a function object, legacy syntax.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L419
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L764-L773
    %
    %
    %
    %.............
    %
    %
      [varargout{1:nargout}] = casadiMEX(1178, self, varargin{:});
    end
    function varargout = dependent_fun(self,varargin)
    %DEPENDENT_FUN [INTERNAL] 
    %
    %  Function = DEPENDENT_FUN(self, char fname, {char} s_in, {char} s_out)
    %
    %Construct a function for evaluating dependent parameters.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L451
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L871-L880
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1179, self, varargin{:});
    end
    function varargout = transition(self,varargin)
    %TRANSITION [INTERNAL] 
    %
    %  Function = TRANSITION(self)
    %  Function = TRANSITION(self, char fname)
    %  Function = TRANSITION(self, char fname, int index)
    %
    %Construct an event transition function, default naming.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L462
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L462-L462
    %
    %
    %
    %.......
    %
    %::
    %
    %  TRANSITION(self)
    %
    %
    %
    %[INTERNAL] 
    %Construct an event transition function, default naming.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L462
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L462-L462
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
    %  TRANSITION(self, char fname)
    %
    %
    %
    %[INTERNAL] 
    %Construct a function describing transition at any events.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L459
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L891-L898
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
    %  TRANSITION(self, char fname, int index)
    %
    %
    %
    %[INTERNAL] 
    %Construct a function describing transition at a specific events.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L456
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L882-L889
    %
    %
    %
    %.............
    %
    %
      [varargout{1:nargout}] = casadiMEX(1180, self, varargin{:});
    end
    function varargout = var(self,varargin)
    %VAR [INTERNAL] 
    %
    %  MX = VAR(self, char name)
    %
    %Get variable expression by name
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L466
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L435-L442
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1181, self, varargin{:});
    end
    function varargout = paren(self,varargin)
    %PAREN 
    %
    %  MX = PAREN(self, char name)
    %
    %
      [varargout{1:nargout}] = casadiMEX(1182, self, varargin{:});
    end
    function varargout = der(self,varargin)
    %DER [INTERNAL] 
    %
    %  {char} = DER(self)
    %  {char} = DER(self, {char} name)
    %  MX = DER(self, MX v)
    %  MX = DER(self, MX v)
    %
    %Differentiate an expression with respect to time
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L481
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L921-L928
    %
    %
    %
    %.......
    %
    %::
    %
    %  DER(self)
    %
    %
    %
    %[INTERNAL] 
    %Model structure: All time derivatives.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_2fz
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L473
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L126-L133
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
    %  DER(self, {char} name)
    %
    %
    %
    %[INTERNAL] 
    %Get the time derivative of model variables.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L476
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L489-L498
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
    %  DER(self, MX v)
    %
    %
    %
    %[INTERNAL] 
    %Differentiate an expression with respect to time
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L481
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L921-L928
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
    %  DER(self, MX v)
    %
    %
    %
    %[INTERNAL] 
    %Differentiate an expression with respect to time
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L480
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L912-L919
    %
    %
    %
    %.............
    %
    %
      [varargout{1:nargout}] = casadiMEX(1183, self, varargin{:});
    end
    function varargout = pre(self,varargin)
    %PRE [INTERNAL] 
    %
    %  {char} = PRE(self, {char} name)
    %  MX = PRE(self, MX v)
    %
    %Get the pre-expression given variable expression.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L488
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L474-L487
    %
    %
    %
    %.......
    %
    %::
    %
    %  PRE(self, {char} name)
    %
    %
    %
    %[INTERNAL] 
    %Get the pre-variables of model variables.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L485
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L500-L509
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
    %  PRE(self, MX v)
    %
    %
    %
    %[INTERNAL] 
    %Get the pre-expression given variable expression.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L488
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L474-L487
    %
    %
    %
    %.............
    %
    %
      [varargout{1:nargout}] = casadiMEX(1184, self, varargin{:});
    end
    function varargout = has_beq(self,varargin)
    %HAS_BEQ [INTERNAL] 
    %
    %  bool = HAS_BEQ(self, char name)
    %
    %Does a variable have a binding equation?
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L491
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L511-L518
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1185, self, varargin{:});
    end
    function varargout = beq(self,varargin)
    %BEQ [INTERNAL] 
    %
    %  MX = BEQ(self, char name)
    %
    %Get the binding equation for a variable.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L494
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L520-L528
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1186, self, varargin{:});
    end
    function varargout = value_reference(self,varargin)
    %VALUE_REFERENCE [INTERNAL] 
    %
    %  int = VALUE_REFERENCE(self, char name)
    %
    %Get/set value reference
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L498
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L554-L556
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1187, self, varargin{:});
    end
    function varargout = set_value_reference(self,varargin)
    %SET_VALUE_REFERENCE [INTERNAL] 
    %
    %  SET_VALUE_REFERENCE(self, char name, int val)
    %
    %Get/set value reference
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L499
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L558-L560
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1188, self, varargin{:});
    end
    function varargout = description(self,varargin)
    %DESCRIPTION [INTERNAL] 
    %
    %  char = DESCRIPTION(self, char name)
    %
    %Get/set description
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L504
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L562-L564
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1189, self, varargin{:});
    end
    function varargout = set_description(self,varargin)
    %SET_DESCRIPTION [INTERNAL] 
    %
    %  SET_DESCRIPTION(self, char name, char val)
    %
    %Get/set description
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L505
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L566-L568
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1190, self, varargin{:});
    end
    function varargout = type(self,varargin)
    %TYPE [INTERNAL] 
    %
    %  char = TYPE(self, char name, int fmi_version)
    %
    %Get/set the type
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L510
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L570-L579
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1191, self, varargin{:});
    end
    function varargout = set_type(self,varargin)
    %SET_TYPE [INTERNAL] 
    %
    %  SET_TYPE(self, char name, char val)
    %
    %Get/set the type
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L511
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L581-L588
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1192, self, varargin{:});
    end
    function varargout = causality(self,varargin)
    %CAUSALITY [INTERNAL] 
    %
    %  char = CAUSALITY(self, char name)
    %
    %Get the causality.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L515
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L590-L597
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1193, self, varargin{:});
    end
    function varargout = categories(self,varargin)
    %CATEGORIES [INTERNAL] 
    %
    %  {char} = CATEGORIES(self, char name)
    %
    %Which categories are possible for a variable?
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L518
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L599-L610
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1194, self, varargin{:});
    end
    function varargout = set_causality(self,varargin)
    %SET_CAUSALITY [INTERNAL] 
    %
    %  SET_CAUSALITY(self, char name, char val)
    %
    %Set the causality, if permitted.
    %
    %The following changes are permitted: For controls 'u' (variability 
    %
    %'continuous', causality 'input'), free parameters 'p' (variability 
    %
    %'tunable', causality 'parameter') and fixed parameters 'c' 
    %(variability 
    %'fixed', causality 'parameter'), causality can only be 
    %changed indirectly, 
    %by updating the variability Add or remove an 
    %output 'y' by setting the 
    %causality to 'output' or 'local', 
    %respectively
    %
    %No other changes are permitted.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_2c2
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L533
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L612-L618
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1195, self, varargin{:});
    end
    function varargout = variability(self,varargin)
    %VARIABILITY [INTERNAL] 
    %
    %  char = VARIABILITY(self, char name)
    %
    %Get the variability.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L536
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L620-L627
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1196, self, varargin{:});
    end
    function varargout = set_variability(self,varargin)
    %SET_VARIABILITY [INTERNAL] 
    %
    %  SET_VARIABILITY(self, char name, char val)
    %
    %Set the variability, if permitted.
    %
    %For controls 'u' (variability 'continuous', causality 'input'), free 
    %
    %parameters 'p' (variability 'tunable', causality 'parameter') and 
    %fixed 
    %parameters 'c' (variability 'fixed', causality 'parameter'), 
    %update 
    %variability in order to change the category. Causality is 
    %updated 
    %accordingly.
    %
    %Other changes are not permitted
    %
    %::
    %
    %  Extra doc: https://github.com/casadi/casadi/wiki/L_2c3 
    %  
    %
    %
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L548
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L629-L635
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1197, self, varargin{:});
    end
    function varargout = category(self,varargin)
    %CATEGORY [INTERNAL] 
    %
    %  char = CATEGORY(self, char name)
    %
    %Get the variable category.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L551
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L637-L644
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1198, self, varargin{:});
    end
    function varargout = set_category(self,varargin)
    %SET_CATEGORY [INTERNAL] 
    %
    %  SET_CATEGORY(self, char name, char val)
    %
    %Set the variable category, if permitted.
    %
    %The following changes are permitted: Controls 'u' can be changed 
    %to/from 
    %tunable parameters 'p' or fixed parameters 'c' Differential 
    %states that do 
    %not appear in the right-hand-sides can be changed 
    %between regular states 
    %'x', quadrature states 'q' and no category '0'.
    %
    %Other changes are not permitted. Causality and variability is updated 
    %
    %accordingly.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_2c4
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L563
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L646-L653
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1199, self, varargin{:});
    end
    function varargout = initial(self,varargin)
    %INITIAL [INTERNAL] 
    %
    %  char = INITIAL(self, char name)
    %
    %Get/set the initial property
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L567
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L655-L657
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1200, self, varargin{:});
    end
    function varargout = set_initial(self,varargin)
    %SET_INITIAL [INTERNAL] 
    %
    %  SET_INITIAL(self, char name, char val)
    %
    %Get/set the initial property
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L568
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L659-L661
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1201, self, varargin{:});
    end
    function varargout = unit(self,varargin)
    %UNIT [INTERNAL] 
    %
    %  char = UNIT(self, char name)
    %
    %Get/set the unit
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L573
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L663-L665
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1202, self, varargin{:});
    end
    function varargout = set_unit(self,varargin)
    %SET_UNIT [INTERNAL] 
    %
    %  SET_UNIT(self, char name, char val)
    %
    %Get/set the unit
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L574
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L667-L669
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1203, self, varargin{:});
    end
    function varargout = display_unit(self,varargin)
    %DISPLAY_UNIT [INTERNAL] 
    %
    %  char = DISPLAY_UNIT(self, char name)
    %
    %Get/set the display unit
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L579
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L671-L673
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1204, self, varargin{:});
    end
    function varargout = set_display_unit(self,varargin)
    %SET_DISPLAY_UNIT [INTERNAL] 
    %
    %  SET_DISPLAY_UNIT(self, char name, char val)
    %
    %Get/set the display unit
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L580
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L675-L677
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1205, self, varargin{:});
    end
    function varargout = numel(self,varargin)
    %NUMEL [INTERNAL] 
    %
    %  int = NUMEL(self, char name)
    %
    %Get the number of elements of a variable.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L584
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L679-L681
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1206, self, varargin{:});
    end
    function varargout = dimension(self,varargin)
    %DIMENSION [INTERNAL] 
    %
    %  [int] = DIMENSION(self, char name)
    %
    %Get the dimensions of a variable.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L587
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L683-L685
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1207, self, varargin{:});
    end
    function varargout = start_time(self,varargin)
    %START_TIME [INTERNAL] 
    %
    %  double = START_TIME(self)
    %
    %Get the start time.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L590
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L687-L694
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1208, self, varargin{:});
    end
    function varargout = set_start_time(self,varargin)
    %SET_START_TIME [INTERNAL] 
    %
    %  SET_START_TIME(self, double val)
    %
    %Set the start time.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L593
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L696-L702
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1209, self, varargin{:});
    end
    function varargout = stop_time(self,varargin)
    %STOP_TIME [INTERNAL] 
    %
    %  double = STOP_TIME(self)
    %
    %Get the stop time.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L596
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L704-L711
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1210, self, varargin{:});
    end
    function varargout = set_stop_time(self,varargin)
    %SET_STOP_TIME [INTERNAL] 
    %
    %  SET_STOP_TIME(self, double val)
    %
    %Set the stop time.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L599
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L713-L719
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1211, self, varargin{:});
    end
    function varargout = tolerance(self,varargin)
    %TOLERANCE [INTERNAL] 
    %
    %  double = TOLERANCE(self)
    %
    %Get the tolerance.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L602
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L721-L728
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1212, self, varargin{:});
    end
    function varargout = set_tolerance(self,varargin)
    %SET_TOLERANCE [INTERNAL] 
    %
    %  SET_TOLERANCE(self, double val)
    %
    %Set the tolerance.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L605
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L730-L736
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1213, self, varargin{:});
    end
    function varargout = step_size(self,varargin)
    %STEP_SIZE [INTERNAL] 
    %
    %  double = STEP_SIZE(self)
    %
    %Get the step size.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L608
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L738-L745
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1214, self, varargin{:});
    end
    function varargout = set_step_size(self,varargin)
    %SET_STEP_SIZE [INTERNAL] 
    %
    %  SET_STEP_SIZE(self, double val)
    %
    %Set the step size.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L611
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L747-L753
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1215, self, varargin{:});
    end
    function varargout = attribute(self,varargin)
    %ATTRIBUTE [INTERNAL] 
    %
    %  [double] = ATTRIBUTE(self, char a, {char} name)
    %
    %Get an attribute.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L673
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L939-L947
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1216, self, varargin{:});
    end
    function varargout = set_attribute(self,varargin)
    %SET_ATTRIBUTE [INTERNAL] 
    %
    %  SET_ATTRIBUTE(self, char a, {char} name, [double] val)
    %
    %Set an attribute.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L676
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L957-L964
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1217, self, varargin{:});
    end
    function varargout = min(self,varargin)
    %MIN [INTERNAL] 
    %
    %  [double] = MIN(self, {char} name)
    %
    %Get the lower bound.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L680
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L975-L982
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1218, self, varargin{:});
    end
    function varargout = set_min(self,varargin)
    %SET_MIN [INTERNAL] 
    %
    %  SET_MIN(self, {char} name, [double] val)
    %
    %Set the lower bound.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L683
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L992-L998
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1219, self, varargin{:});
    end
    function varargout = max(self,varargin)
    %MAX [INTERNAL] 
    %
    %  [double] = MAX(self, {char} name)
    %
    %Get the upper bound.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L686
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L1009-L1016
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1220, self, varargin{:});
    end
    function varargout = set_max(self,varargin)
    %SET_MAX [INTERNAL] 
    %
    %  SET_MAX(self, {char} name, [double] val)
    %
    %Set the upper bound.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L689
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L1026-L1032
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1221, self, varargin{:});
    end
    function varargout = nominal(self,varargin)
    %NOMINAL [INTERNAL] 
    %
    %  [double] = NOMINAL(self, {char} name)
    %
    %Get the nominal value.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L692
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L1043-L1050
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1222, self, varargin{:});
    end
    function varargout = set_nominal(self,varargin)
    %SET_NOMINAL [INTERNAL] 
    %
    %  SET_NOMINAL(self, {char} name, [double] val)
    %
    %Set the nominal value.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L695
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L1060-L1066
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1223, self, varargin{:});
    end
    function varargout = start(self,varargin)
    %START [INTERNAL] 
    %
    %  [double] = START(self, {char} name)
    %
    %Get the start attribute.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L698
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L1077-L1084
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1224, self, varargin{:});
    end
    function varargout = set_start(self,varargin)
    %SET_START [INTERNAL] 
    %
    %  SET_START(self, {char} name, [double] val)
    %
    %Set the start attribute.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L701
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L1102-L1108
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1225, self, varargin{:});
    end
    function varargout = set(self,varargin)
    %SET [INTERNAL] 
    %
    %  SET(self, {char} name, [double] val)
    %  SET(self, {char} name, {char} val)
    %
    %Set the current value (string)
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L707
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L1142-L1149
    %
    %
    %
    %.......
    %
    %::
    %
    %  SET(self, {char} name, [double] val)
    %
    %
    %
    %[INTERNAL] 
    %Set the current value.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L704
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L1134-L1140
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
    %  SET(self, {char} name, {char} val)
    %
    %
    %
    %[INTERNAL] 
    %Set the current value (string)
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L707
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L1142-L1149
    %
    %
    %
    %.............
    %
    %
      [varargout{1:nargout}] = casadiMEX(1226, self, varargin{:});
    end
    function varargout = get(self,varargin)
    %GET [INTERNAL] 
    %
    %  {GenericType} = GET(self, {char} name)
    %
    %Evaluate the values for a set of variables at the initial time.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L710
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L1155-L1196
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1227, self, varargin{:});
    end
    function varargout = has(self,varargin)
    %HAS [INTERNAL] 
    %
    %  bool = HAS(self, char name)
    %
    %Check if a particular variable exists.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L713
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L254-L261
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1228, self, varargin{:});
    end
    function varargout = all(self,varargin)
    %ALL [INTERNAL] 
    %
    %  {char} = ALL(self)
    %  {char} = ALL(self, char cat)
    %
    %Get a list of all variables of a particular category.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L719
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L272-L279
    %
    %
    %
    %.......
    %
    %::
    %
    %  ALL(self)
    %
    %
    %
    %[INTERNAL] 
    %Get a list of all variables.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L716
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L263-L270
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
    %  ALL(self, char cat)
    %
    %
    %
    %[INTERNAL] 
    %Get a list of all variables of a particular category.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L719
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L272-L279
    %
    %
    %
    %.............
    %
    %
      [varargout{1:nargout}] = casadiMEX(1229, self, varargin{:});
    end
    function varargout = oracle(self,varargin)
    %ORACLE [INTERNAL] 
    %
    %  Function = ORACLE(self, bool sx, bool elim_w, bool lifted_calls)
    %
    %Get the (cached) oracle, SX or  MX.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L722
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L862-L869
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1230, self, varargin{:});
    end
    function varargout = jac_sparsity(self,varargin)
    %JAC_SPARSITY [INTERNAL] 
    %
    %  Sparsity = JAC_SPARSITY(self, {char} onames, {char} inames)
    %
    %Get Jacobian sparsity.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_6g
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L727
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L1207-L1215
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1231, self, varargin{:});
    end
    function self = DaeBuilder(varargin)
    %DAEBUILDER 
    %
    %  new_obj = DAEBUILDER()
    %  new_obj = DAEBUILDER(char name, char path, struct opts)
    %
    %
    %.......
    %
    %::
    %
    %  DAEBUILDER()
    %
    %
    %
    %[INTERNAL] 
    %Default constructor.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L77
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L51-L52
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
    %  DAEBUILDER(char name, char path, struct opts)
    %
    %
    %
    %[INTERNAL] 
    %Construct a  DaeBuilder instance.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L80
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L54-L57
    %
    %
    %
    %.............
    %
    %
      self@casadi.SharedObject(SwigRef.Null);
      self@casadi.PrintableCommon(SwigRef.Null);
      if nargin == 0 && ~isempty(self.swigPtr)
        return
      end
      if nargin==1 && strcmp(class(varargin{1}),'SwigRef')
        if ~isnull(varargin{1})
          self.swigPtr = varargin{1}.swigPtr;
        end
      else
        tmp = casadiMEX(1232, varargin{:});
        self.swigPtr = tmp.swigPtr;
        tmp.SwigClear();
      end
    end
    function delete(self)
        if self.swigPtr
          casadiMEX(1233, self);
          self.SwigClear();
        end
    end
  end
  methods(Static)
  end
end
