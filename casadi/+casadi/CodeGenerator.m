classdef  CodeGenerator < SwigRef
    %CODEGENERATOR [INTERNAL] 
    %
    %
    %Helper class for C code generation.
    %
    %Joel Andersson
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_ru
    %
    %C++ includes: code_generator.hpp
    %
    %
  methods
    function this = swig_this(self)
      this = casadiMEX(3, self);
    end
    function self = CodeGenerator(varargin)
    %CODEGENERATOR [INTERNAL] 
    %
    %  new_obj = CODEGENERATOR()
    %
    %Constructor.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/code_generator.hpp#L47
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/code_generator.cpp#L38-L227
    %
    %
    %
      if nargin == 0 && ~isempty(self.swigPtr)
        return
      end
      if nargin==1 && strcmp(class(varargin{1}),'SwigRef')
        if ~isnull(varargin{1})
          self.swigPtr = varargin{1}.swigPtr;
        end
      else
        tmp = casadiMEX(985, varargin{:});
        self.swigPtr = tmp.swigPtr;
        tmp.SwigClear();
      end
    end
    function varargout = add(self,varargin)
    %ADD [INTERNAL] 
    %
    %  ADD(self, Function f, bool with_jac_sparsity)
    %
    %Add a function (name generated)
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/code_generator.hpp#L50
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/code_generator.cpp#L399-L442
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(986, self, varargin{:});
    end
    function varargout = dump(self,varargin)
    %DUMP [INTERNAL] 
    %
    %  char = DUMP(self)
    %
    %Generate a file, return code as string.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/code_generator.hpp#L58
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/code_generator.cpp#L444-L448
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(987, self, varargin{:});
    end
    function varargout = generate(self,varargin)
    %GENERATE [INTERNAL] 
    %
    %  char = GENERATE(self, char prefix)
    %
    %Generate file(s)
    %
    %The "prefix" argument will be prepended to the generated files and 
    %may be
    % a directory or a file prefix. returns the filename
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_rv
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/code_generator.hpp#L67
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/code_generator.cpp#L531-L602
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(988, self, varargin{:});
    end
    function varargout = add_include(self,varargin)
    %ADD_INCLUDE [INTERNAL] 
    %
    %  ADD_INCLUDE(self, char new_include, bool relative_path, char use_ifdef)
    %
    %Add an include file optionally using a relative path "..." 
    %instead 
    %of an absolute path <...>
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/code_generator.hpp#L70
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/code_generator.cpp#L1233-L1253
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(989, self, varargin{:});
    end
    function delete(self)
        if self.swigPtr
          casadiMEX(990, self);
          self.SwigClear();
        end
    end
  end
  methods(Static)
  end
end
