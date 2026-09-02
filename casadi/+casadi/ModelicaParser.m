classdef  ModelicaParser < casadi.SharedObject & casadi.PrintableCommon & SwigRef
    %MODELICAPARSER [INTERNAL] 
    %
    %
    %Modelica parser.
    %
    %Can be used for parsing Modelica files into CasADi data structures.
    %
    %Joris Gillis
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_2j3
    %
    %C++ includes: modelica_parser.hpp
    %
    %
  methods
    function this = swig_this(self)
      this = casadiMEX(3, self);
    end
    function delete(self)
        if self.swigPtr
          casadiMEX(977, self);
          self.SwigClear();
        end
    end
    function varargout = parse(self,varargin)
    %PARSE [INTERNAL] 
    %
    %  PARSE(self, char filename, char output_dir)
    %
    %
      [varargout{1:nargout}] = casadiMEX(980, self, varargin{:});
    end
    function self = ModelicaParser(varargin)
    %MODELICAPARSER 
    %
    %  new_obj = MODELICAPARSER()
    %  new_obj = MODELICAPARSER(char name)
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
        tmp = casadiMEX(981, varargin{:});
        self.swigPtr = tmp.swigPtr;
        tmp.SwigClear();
      end
    end
  end
  methods(Static)
    function varargout = type_name(varargin)
    %TYPE_NAME 
    %
    %  char = TYPE_NAME()
    %
    %
     [varargout{1:nargout}] = casadiMEX(976, varargin{:});
    end
    function varargout = load_plugin(varargin)
    %LOAD_PLUGIN 
    %
    %  LOAD_PLUGIN(char name)
    %
    %
     [varargout{1:nargout}] = casadiMEX(978, varargin{:});
    end
    function varargout = doc(varargin)
    %DOC 
    %
    %  char = DOC(char name)
    %
    %
     [varargout{1:nargout}] = casadiMEX(979, varargin{:});
    end
  end
end
