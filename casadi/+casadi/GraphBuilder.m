classdef  GraphBuilder < casadi.SharedObject & casadi.PrintableCommon & SwigRef
    %GRAPHBUILDER [INTERNAL] 
    %
    %
    %A mutable, format-neutral interface to a computational-graph 
    %model.
    %
    %Two-stage workflow: explore and configure a model (introspection, 
    %dynamic-
    %dimension binding) with  GraphBuilder, then freeze it into an immutable, 
    %evaluable  Function.
    %
    %
    %
    %::
    %
    %  GraphBuilder b("model.onnx");
    %  b.bind_dim("batch", 4);
    %  Function f = b.create("net");
    %  
    %
    %
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_2jd
    %
    %C++ includes: graph_builder.hpp
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
    %https://github.com/casadi/casadi/blob/main/casadi/core/graph_builder.hpp#L54
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/graph_builder.hpp#L54-L54
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(911, self, varargin{:});
    end
    function varargout = name(self,varargin)
    %NAME [INTERNAL] 
    %
    %  char = NAME(self)
    %
    %Name of the model.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/graph_builder.hpp#L72
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/graph_builder.cpp#L95-L98
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(912, self, varargin{:});
    end
    function varargout = n_in(self,varargin)
    %N_IN [INTERNAL] 
    %
    %  int = N_IN(self)
    %
    %Declared shape of a tensor (input or output) by name; -1 for 
    %dynamic 
    %dimensions.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/graph_builder.hpp#L76
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/graph_builder.cpp#L100-L100
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(913, self, varargin{:});
    end
    function varargout = n_out(self,varargin)
    %N_OUT [INTERNAL] 
    %
    %  int = N_OUT(self)
    %
    %Declared shape of a tensor (input or output) by name; -1 for 
    %dynamic 
    %dimensions.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/graph_builder.hpp#L77
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/graph_builder.cpp#L101-L101
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(914, self, varargin{:});
    end
    function varargout = name_in(self,varargin)
    %NAME_IN [INTERNAL] 
    %
    %  {char} = NAME_IN(self)
    %
    %Declared shape of a tensor (input or output) by name; -1 for 
    %dynamic 
    %dimensions.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/graph_builder.hpp#L78
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/graph_builder.cpp#L102-L102
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(915, self, varargin{:});
    end
    function varargout = name_out(self,varargin)
    %NAME_OUT [INTERNAL] 
    %
    %  {char} = NAME_OUT(self)
    %
    %Declared shape of a tensor (input or output) by name; -1 for 
    %dynamic 
    %dimensions.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/graph_builder.hpp#L79
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/graph_builder.cpp#L103-L103
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(916, self, varargin{:});
    end
    function varargout = dimension(self,varargin)
    %DIMENSION [INTERNAL] 
    %
    %  [int] = DIMENSION(self, char name)
    %
    %Declared shape of a tensor (input or output) by name; -1 for 
    %dynamic 
    %dimensions.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/graph_builder.hpp#L81
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/graph_builder.cpp#L104-L106
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(917, self, varargin{:});
    end
    function varargout = dtype(self,varargin)
    %DTYPE [INTERNAL] 
    %
    %  char = DTYPE(self, char name)
    %
    %Element type name of a tensor (input or output) by name (FLOAT, 
    %INT64,
    % ...)
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/graph_builder.hpp#L83
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/graph_builder.cpp#L107-L109
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(918, self, varargin{:});
    end
    function varargout = dimension_param(self,varargin)
    %DIMENSION_PARAM [INTERNAL] 
    %
    %  {char} = DIMENSION_PARAM(self, char name)
    %
    %Per-axis symbolic dimension name of a tensor by name ("" for 
    %static 
    %axes)
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/graph_builder.hpp#L85
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/graph_builder.cpp#L110-L112
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(919, self, varargin{:});
    end
    function varargout = dynamic_params(self,varargin)
    %DYNAMIC_PARAMS [INTERNAL] 
    %
    %  {char} = DYNAMIC_PARAMS(self)
    %
    %Names of the symbolic/dynamic dimensions in the model.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/graph_builder.hpp#L87
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/graph_builder.cpp#L113-L115
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(920, self, varargin{:});
    end
    function varargout = bind_dim(self,varargin)
    %BIND_DIM [INTERNAL] 
    %
    %  BIND_DIM(self, char param, int value)
    %
    %Bind a symbolic/dynamic dimension to a concrete size.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/graph_builder.hpp#L93
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/graph_builder.cpp#L117-L119
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(921, self, varargin{:});
    end
    function varargout = bind_shape(self,varargin)
    %BIND_SHAPE [INTERNAL] 
    %
    %  BIND_SHAPE(self, char input_name, [int] shape)
    %
    %Pin the full shape of an input.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/graph_builder.hpp#L95
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/graph_builder.cpp#L120-L123
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(922, self, varargin{:});
    end
    function varargout = set(self,varargin)
    %SET [INTERNAL] 
    %
    %  SET(self, char input_name, [double] value)
    %  SET(self, char input_name, double value)
    %
    %Bake a scalar value into an input.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/graph_builder.hpp#L99
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/graph_builder.cpp#L127-L129
    %
    %
    %
    %.......
    %
    %::
    %
    %  SET(self, char input_name, [double] value)
    %
    %
    %
    %[INTERNAL] 
    %Bake a fixed value into an input; it is fed at  create() and not
    % exposed as a  Function input.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/graph_builder.hpp#L97
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/graph_builder.cpp#L124-L126
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
    %  SET(self, char input_name, double value)
    %
    %
    %
    %[INTERNAL] 
    %Bake a scalar value into an input.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/graph_builder.hpp#L99
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/graph_builder.cpp#L127-L129
    %
    %
    %
    %.............
    %
    %
      [varargout{1:nargout}] = casadiMEX(923, self, varargin{:});
    end
    function varargout = create(self,varargin)
    %CREATE [INTERNAL] 
    %
    %  Function = CREATE(self)
    %  Function = CREATE(self, char name, struct opts)
    %  Function = CREATE(self, char name, {char} name_in, {char} name_out, struct opts)
    %
    %Freeze into an evaluable  Function, default naming.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_2jg
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/graph_builder.hpp#L127
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/graph_builder.hpp#L127-L127
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
    %Freeze into an evaluable  Function, default naming.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_2jg
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/graph_builder.hpp#L127
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/graph_builder.hpp#L127-L127
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
    %  CREATE(self, char name, struct opts)
    %
    %
    %
    %[INTERNAL] 
    %Freeze into an evaluable  Function, exposing all model inputs 
    %and outputs.
    %
    %Parameters:
    %-----------
    %
    %name: 
    %Name assigned to the resulting  Function
    %
    %opts: 
    %See the full  create() overload
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_2jf
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/graph_builder.hpp#L122
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/graph_builder.cpp#L137-L139
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
    %Freeze into an evaluable  Function.
    %
    %Parameters:
    %-----------
    %
    %name: 
    %Name assigned to the resulting  Function
    %
    %name_in: 
    %Names of the inputs to expose (empty = all model inputs)
    %
    %name_out: 
    %Names of the outputs to expose (empty = all model outputs)
    %
    %opts: 
    %"symbolic" (bool, default false) and "backend" (numeric backend,
    % 
    %default "ort"); any remaining options pass through to the backend.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_2je
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/graph_builder.hpp#L111
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/graph_builder.cpp#L131-L136
    %
    %
    %
    %.............
    %
    %
      [varargout{1:nargout}] = casadiMEX(924, self, varargin{:});
    end
    function varargout = export_onnx(self,varargin)
    %EXPORT_ONNX [INTERNAL] 
    %
    %  EXPORT_ONNX(self, char filename, struct opts)
    %
    %Export to an ONNX model file.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_2jh
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/graph_builder.hpp#L132
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/graph_builder.cpp#L140-L142
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(925, self, varargin{:});
    end
    function self = GraphBuilder(varargin)
    %GRAPHBUILDER 
    %
    %  new_obj = GRAPHBUILDER()
    %  new_obj = GRAPHBUILDER(char model_path, struct opts)
    %  new_obj = GRAPHBUILDER(Function f, struct opts)
    %
    %
    %.......
    %
    %::
    %
    %  GRAPHBUILDER()
    %
    %
    %
    %[INTERNAL] 
    %Default constructor.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/graph_builder.hpp#L57
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/graph_builder.cpp#L62-L63
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
    %  GRAPHBUILDER(char model_path, struct opts)
    %
    %
    %
    %[INTERNAL] 
    %Construct from a model file (import lifecycle; format from the 
    %file 
    %suffix)
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/graph_builder.hpp#L60
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/graph_builder.cpp#L65-L74
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
    %  GRAPHBUILDER(Function f, struct opts)
    %
    %
    %
    %[INTERNAL] 
    %Construct from a CasADi  Function (export lifecycle)
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/graph_builder.hpp#L63
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/graph_builder.cpp#L76-L78
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
        tmp = casadiMEX(926, varargin{:});
        self.swigPtr = tmp.swigPtr;
        tmp.SwigClear();
      end
    end
    function delete(self)
        if self.swigPtr
          casadiMEX(927, self);
          self.SwigClear();
        end
    end
  end
  methods(Static)
  end
end
