classdef  WeakRef < casadi.GenWeakRef
    %WEAKREF [INTERNAL] 
    %
    %
    %Weak reference type.
    %
    %A weak reference to a  GenericShared
    %Joel Andersson
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_ax
    %
    %C++ includes: shared_object.hpp
    %
    %
  methods
    function self = WeakRef(varargin)
    %WEAKREF 
    %
    %  new_obj = WEAKREF(int dummy)
    %  new_obj = WEAKREF(SharedObject shared)
    %
    %
      self@casadi.GenWeakRef(SwigRef.Null);
      if nargin == 0 && ~isempty(self.swigPtr)
        return
      end
      if nargin==1 && strcmp(class(varargin{1}),'SwigRef')
        if ~isnull(varargin{1})
          self.swigPtr = varargin{1}.swigPtr;
        end
      else
        tmp = casadiMEX(36, varargin{:});
        self.swigPtr = tmp.swigPtr;
        tmp.SwigClear();
      end
    end
    function delete(self)
        if self.swigPtr
          casadiMEX(37, self);
          self.SwigClear();
        end
    end
  end
  methods(Static)
  end
end
