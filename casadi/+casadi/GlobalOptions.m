classdef  GlobalOptions < SwigRef
    %GLOBALOPTIONS [INTERNAL] 
    %
    %
    %Collects global CasADi options.
    %
    %Note to developers: 
    %use sparingly. Global options are - in general - a 
    %rather bad idea
    %
    %this class must never be instantiated. Access its static members 
    %directly 
    %
    %Joris Gillis
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_23m
    %
    %C++ includes: global_options.hpp
    %
    %
  methods
    function this = swig_this(self)
      this = casadiMEX(3, self);
    end
    function self = GlobalOptions(varargin)
    %GLOBALOPTIONS 
    %
    %  new_obj = GLOBALOPTIONS()
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
        tmp = casadiMEX(1067, varargin{:});
        self.swigPtr = tmp.swigPtr;
        tmp.SwigClear();
      end
    end
    function delete(self)
        if self.swigPtr
          casadiMEX(1068, self);
          self.SwigClear();
        end
    end
  end
  methods(Static)
    function varargout = setSimplificationOnTheFly(varargin)
    %SETSIMPLIFICATIONONTHEFLY 
    %
    %  SETSIMPLIFICATIONONTHEFLY(bool flag)
    %
    %
     [varargout{1:nargout}] = casadiMEX(1049, varargin{:});
    end
    function varargout = getSimplificationOnTheFly(varargin)
    %GETSIMPLIFICATIONONTHEFLY 
    %
    %  bool = GETSIMPLIFICATIONONTHEFLY()
    %
    %
     [varargout{1:nargout}] = casadiMEX(1050, varargin{:});
    end
    function varargout = setHierarchicalSparsity(varargin)
    %SETHIERARCHICALSPARSITY 
    %
    %  SETHIERARCHICALSPARSITY(bool flag)
    %
    %
     [varargout{1:nargout}] = casadiMEX(1051, varargin{:});
    end
    function varargout = getHierarchicalSparsity(varargin)
    %GETHIERARCHICALSPARSITY 
    %
    %  bool = GETHIERARCHICALSPARSITY()
    %
    %
     [varargout{1:nargout}] = casadiMEX(1052, varargin{:});
    end
    function varargout = setCasadiPath(varargin)
    %SETCASADIPATH 
    %
    %  SETCASADIPATH(char path)
    %
    %
     [varargout{1:nargout}] = casadiMEX(1053, varargin{:});
    end
    function varargout = getCasadiPath(varargin)
    %GETCASADIPATH 
    %
    %  char = GETCASADIPATH()
    %
    %
     [varargout{1:nargout}] = casadiMEX(1054, varargin{:});
    end
    function varargout = setCasadiIncludePath(varargin)
    %SETCASADIINCLUDEPATH 
    %
    %  SETCASADIINCLUDEPATH(char path)
    %
    %
     [varargout{1:nargout}] = casadiMEX(1055, varargin{:});
    end
    function varargout = getCasadiIncludePath(varargin)
    %GETCASADIINCLUDEPATH 
    %
    %  char = GETCASADIINCLUDEPATH()
    %
    %
     [varargout{1:nargout}] = casadiMEX(1056, varargin{:});
    end
    function varargout = setMaxNumDir(varargin)
    %SETMAXNUMDIR 
    %
    %  SETMAXNUMDIR(int ndir)
    %
    %
     [varargout{1:nargout}] = casadiMEX(1057, varargin{:});
    end
    function varargout = getMaxNumDir(varargin)
    %GETMAXNUMDIR 
    %
    %  int = GETMAXNUMDIR()
    %
    %
     [varargout{1:nargout}] = casadiMEX(1058, varargin{:});
    end
    function varargout = setCopyElisionMinSize(varargin)
    %SETCOPYELISIONMINSIZE 
    %
    %  SETCOPYELISIONMINSIZE(int sz)
    %
    %
     [varargout{1:nargout}] = casadiMEX(1059, varargin{:});
    end
    function varargout = getCopyElisionMinSize(varargin)
    %GETCOPYELISIONMINSIZE 
    %
    %  int = GETCOPYELISIONMINSIZE()
    %
    %
     [varargout{1:nargout}] = casadiMEX(1060, varargin{:});
    end
    function varargout = setTempWorkDir(varargin)
    %SETTEMPWORKDIR 
    %
    %  SETTEMPWORKDIR(char dir)
    %
    %
     [varargout{1:nargout}] = casadiMEX(1061, varargin{:});
    end
    function varargout = getTempWorkDir(varargin)
    %GETTEMPWORKDIR 
    %
    %  char = GETTEMPWORKDIR()
    %
    %
     [varargout{1:nargout}] = casadiMEX(1062, varargin{:});
    end
    function varargout = setNumpyMode(varargin)
    %SETNUMPYMODE 
    %
    %  SETNUMPYMODE(int mode)
    %
    %
     [varargout{1:nargout}] = casadiMEX(1063, varargin{:});
    end
    function varargout = getNumpyMode(varargin)
    %GETNUMPYMODE 
    %
    %  int = GETNUMPYMODE()
    %
    %
     [varargout{1:nargout}] = casadiMEX(1064, varargin{:});
    end
    function varargout = setDefaultBlas(varargin)
    %SETDEFAULTBLAS 
    %
    %  SETDEFAULTBLAS(char name)
    %
    %
     [varargout{1:nargout}] = casadiMEX(1065, varargin{:});
    end
    function varargout = getDefaultBlas(varargin)
    %GETDEFAULTBLAS 
    %
    %  char = GETDEFAULTBLAS()
    %
    %
     [varargout{1:nargout}] = casadiMEX(1066, varargin{:});
    end
  end
end
