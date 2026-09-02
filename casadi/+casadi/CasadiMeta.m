classdef  CasadiMeta < SwigRef
    %CASADIMETA [INTERNAL] 
    %
    %
    %Collects global CasADi meta information.
    %
    %Joris Gillis
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_23k
    %
    %C++ includes: casadi_meta.hpp
    %
    %
  methods
    function this = swig_this(self)
      this = casadiMEX(3, self);
    end
    function self = CasadiMeta(varargin)
    %CASADIMETA 
    %
    %  new_obj = CASADIMETA()
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
        tmp = casadiMEX(1084, varargin{:});
        self.swigPtr = tmp.swigPtr;
        tmp.SwigClear();
      end
    end
    function delete(self)
        if self.swigPtr
          casadiMEX(1085, self);
          self.SwigClear();
        end
    end
  end
  methods(Static)
    function varargout = version(varargin)
    %VERSION 
    %
    %  char const * = VERSION()
    %
    %
     [varargout{1:nargout}] = casadiMEX(1069, varargin{:});
    end
    function varargout = git_revision(varargin)
    %GIT_REVISION 
    %
    %  char const * = GIT_REVISION()
    %
    %
     [varargout{1:nargout}] = casadiMEX(1070, varargin{:});
    end
    function varargout = git_describe(varargin)
    %GIT_DESCRIBE 
    %
    %  char const * = GIT_DESCRIBE()
    %
    %
     [varargout{1:nargout}] = casadiMEX(1071, varargin{:});
    end
    function varargout = feature_list(varargin)
    %FEATURE_LIST 
    %
    %  char const * = FEATURE_LIST()
    %
    %
     [varargout{1:nargout}] = casadiMEX(1072, varargin{:});
    end
    function varargout = build_type(varargin)
    %BUILD_TYPE 
    %
    %  char const * = BUILD_TYPE()
    %
    %
     [varargout{1:nargout}] = casadiMEX(1073, varargin{:});
    end
    function varargout = compiler_id(varargin)
    %COMPILER_ID 
    %
    %  char const * = COMPILER_ID()
    %
    %
     [varargout{1:nargout}] = casadiMEX(1074, varargin{:});
    end
    function varargout = compiler(varargin)
    %COMPILER 
    %
    %  char const * = COMPILER()
    %
    %
     [varargout{1:nargout}] = casadiMEX(1075, varargin{:});
    end
    function varargout = compiler_flags(varargin)
    %COMPILER_FLAGS 
    %
    %  char const * = COMPILER_FLAGS()
    %
    %
     [varargout{1:nargout}] = casadiMEX(1076, varargin{:});
    end
    function varargout = modules(varargin)
    %MODULES 
    %
    %  char const * = MODULES()
    %
    %
     [varargout{1:nargout}] = casadiMEX(1077, varargin{:});
    end
    function varargout = plugins(varargin)
    %PLUGINS 
    %
    %  char const * = PLUGINS()
    %
    %
     [varargout{1:nargout}] = casadiMEX(1078, varargin{:});
    end
    function varargout = install_prefix(varargin)
    %INSTALL_PREFIX 
    %
    %  char const * = INSTALL_PREFIX()
    %
    %
     [varargout{1:nargout}] = casadiMEX(1079, varargin{:});
    end
    function varargout = shared_library_prefix(varargin)
    %SHARED_LIBRARY_PREFIX 
    %
    %  char const * = SHARED_LIBRARY_PREFIX()
    %
    %
     [varargout{1:nargout}] = casadiMEX(1080, varargin{:});
    end
    function varargout = shared_library_suffix(varargin)
    %SHARED_LIBRARY_SUFFIX 
    %
    %  char const * = SHARED_LIBRARY_SUFFIX()
    %
    %
     [varargout{1:nargout}] = casadiMEX(1081, varargin{:});
    end
    function varargout = object_file_suffix(varargin)
    %OBJECT_FILE_SUFFIX 
    %
    %  char const * = OBJECT_FILE_SUFFIX()
    %
    %
     [varargout{1:nargout}] = casadiMEX(1082, varargin{:});
    end
    function varargout = lapack_libraries(varargin)
    %LAPACK_LIBRARIES 
    %
    %  char const * = LAPACK_LIBRARIES()
    %
    %
     [varargout{1:nargout}] = casadiMEX(1083, varargin{:});
    end
  end
end
