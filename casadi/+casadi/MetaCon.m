classdef  MetaCon < casadi.IndexAbstraction & SwigRef
    %METACON 
    %
    %   = METACON()
    %
    %
  methods
    function v = original(self)
      v = casadiMEX(1374, self);
    end
    function v = canon(self)
      v = casadiMEX(1375, self);
    end
    function v = type(self)
      v = casadiMEX(1376, self);
    end
    function v = lb(self)
      v = casadiMEX(1377, self);
    end
    function v = ub(self)
      v = casadiMEX(1378, self);
    end
    function v = n(self)
      v = casadiMEX(1379, self);
    end
    function v = flipped(self)
      v = casadiMEX(1380, self);
    end
    function v = dual_canon(self)
      v = casadiMEX(1381, self);
    end
    function v = dual(self)
      v = casadiMEX(1382, self);
    end
    function v = extra(self)
      v = casadiMEX(1383, self);
    end
    function v = linear_scale(self)
      v = casadiMEX(1384, self);
    end
    function self = MetaCon(varargin)
    %METACON 
    %
    %  new_obj = METACON()
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
        tmp = casadiMEX(1385, varargin{:});
        self.swigPtr = tmp.swigPtr;
        tmp.SwigClear();
      end
    end
    function delete(self)
        if self.swigPtr
          casadiMEX(1386, self);
          self.SwigClear();
        end
    end
  end
  methods(Static)
  end
end
