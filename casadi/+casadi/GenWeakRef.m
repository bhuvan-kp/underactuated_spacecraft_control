classdef  GenWeakRef < casadi.GenSharedObject & SwigRef
    %GENWEAKREF [INTERNAL] C++ includes: generic_shared.hpp
    %
    %
    %
    %
  methods
    function varargout = is_null(self,varargin)
    %IS_NULL 
    %
    %  bool = IS_NULL(self)
    %
    %
      [varargout{1:nargout}] = casadiMEX(25, self, varargin{:});
    end
    function varargout = shared(self,varargin)
    %SHARED 
    %
    %  SharedObject = SHARED(self)
    %
    %
      [varargout{1:nargout}] = casadiMEX(26, self, varargin{:});
    end
    function varargout = alive(self,varargin)
    %ALIVE 
    %
    %  bool = ALIVE(self)
    %
    %
      [varargout{1:nargout}] = casadiMEX(27, self, varargin{:});
    end
    function varargout = shared_if_alive(self,varargin)
    %SHARED_IF_ALIVE 
    %
    %  bool = SHARED_IF_ALIVE(self, SharedObject shared)
    %
    %
      [varargout{1:nargout}] = casadiMEX(28, self, varargin{:});
    end
    function self = GenWeakRef(varargin)
    %GENWEAKREF 
    %
    %  new_obj = GENWEAKREF(int dummy)
    %  new_obj = GENWEAKREF(SharedObject shared)
    %
    %
      self@casadi.GenSharedObject(SwigRef.Null);
      if nargin == 0 && ~isempty(self.swigPtr)
        return
      end
      if nargin==1 && strcmp(class(varargin{1}),'SwigRef')
        if ~isnull(varargin{1})
          self.swigPtr = varargin{1}.swigPtr;
        end
      else
        tmp = casadiMEX(29, varargin{:});
        self.swigPtr = tmp.swigPtr;
        tmp.SwigClear();
      end
    end
    function delete(self)
        if self.swigPtr
          casadiMEX(30, self);
          self.SwigClear();
        end
    end
  end
  methods(Static)
  end
end
