classdef  MetaVar < casadi.IndexAbstraction & SwigRef
    %METAVAR 
    %
    %   = METAVAR()
    %
    %
  methods
    function v = attribute(self)
      v = casadiMEX(1387, self);
    end
    function v = n(self)
      v = casadiMEX(1388, self);
    end
    function v = m(self)
      v = casadiMEX(1389, self);
    end
    function v = type(self)
      v = casadiMEX(1390, self);
    end
    function v = domain(self)
      v = casadiMEX(1391, self);
    end
    function v = count(self)
      v = casadiMEX(1392, self);
    end
    function v = i(self)
      v = casadiMEX(1393, self);
    end
    function v = active_i(self)
      v = casadiMEX(1394, self);
    end
    function v = extra(self)
      v = casadiMEX(1395, self);
    end
    function self = MetaVar(varargin)
    %METAVAR 
    %
    %  new_obj = METAVAR()
    %
    %
      self@casadi.IndexAbstraction(SwigRef.Null);
      if nargin == 0 && ~isempty(self.swigPtr)
        return
      end
      if nargin==1 && strcmp(class(varargin{1}),'SwigRef')
        if ~isnull(varargin{1})
          self.swigPtr = varargin{1}.swigPtr;
        end
      else
        tmp = casadiMEX(1396, varargin{:});
        self.swigPtr = tmp.swigPtr;
        tmp.SwigClear();
      end
    end
    function delete(self)
        if self.swigPtr
          casadiMEX(1397, self);
          self.SwigClear();
        end
    end
  end
  methods(Static)
  end
end
