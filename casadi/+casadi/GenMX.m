classdef  GenMX < casadi.GenericMatrixCommon & casadi.SparsityInterfaceCommon & SwigRef
    %GENMX 
    %
    %
    %
  methods
    function this = swig_this(self)
      this = casadiMEX(3, self);
    end
    function varargout = nnz(self,varargin)
    %NNZ [INTERNAL] 
    %
    %  int = NNZ(self)
    %
    %Get the number of (structural) non-zero elements.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1an
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L84
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L1325-L1327
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(343, self, varargin{:});
    end
    function varargout = nnz_lower(self,varargin)
    %NNZ_LOWER [INTERNAL] 
    %
    %  int = NNZ_LOWER(self)
    %
    %Get the number of non-zeros in the lower triangular half.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1ao
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L89
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L1330-L1332
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(344, self, varargin{:});
    end
    function varargout = nnz_upper(self,varargin)
    %NNZ_UPPER [INTERNAL] 
    %
    %  int = NNZ_UPPER(self)
    %
    %Get the number of non-zeros in the upper triangular half.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1ap
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L94
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L1335-L1337
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(345, self, varargin{:});
    end
    function varargout = nnz_diag(self,varargin)
    %NNZ_DIAG [INTERNAL] 
    %
    %  int = NNZ_DIAG(self)
    %
    %Get get the number of non-zeros on the diagonal.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1aq
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L99
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L1340-L1342
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(346, self, varargin{:});
    end
    function varargout = numel(self,varargin)
    %NUMEL [INTERNAL] 
    %
    %  int = NUMEL(self)
    %
    %Get the number of elements.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1ar
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L104
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L1345-L1347
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(347, self, varargin{:});
    end
    function varargout = size1(self,varargin)
    %SIZE1 [INTERNAL] 
    %
    %  int = SIZE1(self)
    %
    %Get the first dimension (i.e. number of rows)
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1as
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L109
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L1350-L1352
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(348, self, varargin{:});
    end
    function varargout = rows(self,varargin)
    %ROWS [INTERNAL] 
    %
    %  int = ROWS(self)
    %
    %Get the number of rows, Octave-style syntax.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1at
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L114
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L114-L114
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(349, self, varargin{:});
    end
    function varargout = size2(self,varargin)
    %SIZE2 [INTERNAL] 
    %
    %  int = SIZE2(self)
    %
    %Get the second dimension (i.e. number of columns)
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1au
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L119
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L1355-L1357
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(350, self, varargin{:});
    end
    function varargout = columns(self,varargin)
    %COLUMNS [INTERNAL] 
    %
    %  int = COLUMNS(self)
    %
    %Get the number of columns, Octave-style syntax.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1av
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L124
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L124-L124
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(351, self, varargin{:});
    end
    function varargout = dim(self,varargin)
    %DIM [INTERNAL] 
    %
    %  char = DIM(self, bool with_nz)
    %
    %Get string representation of dimensions.
    %
    %The representation is e.g. "4x5" or "4x5,10nz"
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1aw
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L131
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L1370-L1372
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(352, self, varargin{:});
    end
    function varargout = size(self,varargin)
    %SIZE [INTERNAL] 
    %
    %  [int,int] = SIZE(self)
    %  int = SIZE(self, int axis)
    %
    %Get the size along a particular dimensions.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1ay
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L141
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L1365-L1367
    %
    %
    %
    %.......
    %
    %::
    %
    %  SIZE(self)
    %
    %
    %
    %[INTERNAL] 
    %Get the shape.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1ax
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L136
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L1360-L1362
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
    %  SIZE(self, int axis)
    %
    %
    %
    %[INTERNAL] 
    %Get the size along a particular dimensions.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1ay
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L141
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L1365-L1367
    %
    %
    %
    %.............
    %
    %
      out = casadiMEX(353, self, varargin{:});
      if nargout<=1
        varargout{1}=out;
      else
        nargoutchk(length(out),length(out))
        for i=1:nargout
          varargout{i} = out(i);
        end
      end
    end
    function varargout = is_empty(self,varargin)
    %IS_EMPTY [INTERNAL] 
    %
    %  bool = IS_EMPTY(self, bool both)
    %
    %Check if the sparsity is empty, i.e. if one of the dimensions is
    % zero.
    %
    %(or optionally both dimensions)
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1az
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L148
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L148-L148
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(354, self, varargin{:});
    end
    function varargout = is_dense(self,varargin)
    %IS_DENSE [INTERNAL] 
    %
    %  bool = IS_DENSE(self)
    %
    %Check if the matrix expression is dense.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1b0
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L153
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L153-L153
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(355, self, varargin{:});
    end
    function varargout = is_scalar(self,varargin)
    %IS_SCALAR [INTERNAL] 
    %
    %  bool = IS_SCALAR(self, bool scalar_and_dense)
    %
    %Check if the matrix expression is scalar.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1b1
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L158
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L1375-L1377
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(356, self, varargin{:});
    end
    function varargout = is_square(self,varargin)
    %IS_SQUARE [INTERNAL] 
    %
    %  bool = IS_SQUARE(self)
    %
    %Check if the matrix expression is square.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1b2
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L163
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L163-L163
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(357, self, varargin{:});
    end
    function varargout = is_vector(self,varargin)
    %IS_VECTOR [INTERNAL] 
    %
    %  bool = IS_VECTOR(self)
    %
    %Check if the matrix is a row or column vector.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1b3
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L168
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L168-L168
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(358, self, varargin{:});
    end
    function varargout = is_row(self,varargin)
    %IS_ROW [INTERNAL] 
    %
    %  bool = IS_ROW(self)
    %
    %Check if the matrix is a row vector (i.e.  size1()==1)
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1b4
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L173
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L173-L173
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(359, self, varargin{:});
    end
    function varargout = is_column(self,varargin)
    %IS_COLUMN [INTERNAL] 
    %
    %  bool = IS_COLUMN(self)
    %
    %Check if the matrix is a column vector (i.e.  size2()==1)
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1b5
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L178
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L178-L178
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(360, self, varargin{:});
    end
    function varargout = is_triu(self,varargin)
    %IS_TRIU [INTERNAL] 
    %
    %  bool = IS_TRIU(self)
    %
    %Check if the matrix is upper triangular.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1b6
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L183
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L183-L183
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(361, self, varargin{:});
    end
    function varargout = is_tril(self,varargin)
    %IS_TRIL [INTERNAL] 
    %
    %  bool = IS_TRIL(self)
    %
    %Check if the matrix is lower triangular.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1b7
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L188
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L188-L188
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(362, self, varargin{:});
    end
    function varargout = row(self,varargin)
    %ROW [INTERNAL] 
    %
    %  [int] = ROW(self)
    %  int = ROW(self, int el)
    %
    %Get the sparsity pattern. See the Sparsity class for details.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1b8
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L200
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L200-L200
    %
    %
    %
    %.......
    %
    %::
    %
    %  ROW(self)
    %
    %
    %
    %[INTERNAL] 
    %Get the sparsity pattern. See the Sparsity class for details.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1b8
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L194
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L194-L194
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
    %  ROW(self, int el)
    %
    %
    %
    %[INTERNAL] 
    %Get the sparsity pattern. See the Sparsity class for details.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1b8
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L200
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L200-L200
    %
    %
    %
    %.............
    %
    %
      [varargout{1:nargout}] = casadiMEX(363, self, varargin{:});
    end
    function varargout = colind(self,varargin)
    %COLIND [INTERNAL] 
    %
    %  [int] = COLIND(self)
    %  int = COLIND(self, int col)
    %
    %Get the sparsity pattern. See the Sparsity class for details.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1b8
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L201
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L201-L201
    %
    %
    %
    %.......
    %
    %::
    %
    %  COLIND(self)
    %
    %
    %
    %[INTERNAL] 
    %Get the sparsity pattern. See the Sparsity class for details.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1b8
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L195
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L195-L195
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
    %  COLIND(self, int col)
    %
    %
    %
    %[INTERNAL] 
    %Get the sparsity pattern. See the Sparsity class for details.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1b8
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L201
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L201-L201
    %
    %
    %
    %.............
    %
    %
      [varargout{1:nargout}] = casadiMEX(364, self, varargin{:});
    end
    function varargout = sparsity(self,varargin)
    %SPARSITY [INTERNAL] 
    %
    %  Sparsity = SPARSITY(self)
    %
    %Get the sparsity pattern.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1b9
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L207
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L1320-L1322
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(365, self, varargin{:});
    end
    function self = GenMX(varargin)
    %GENMX 
    %
    %  new_obj = GENMX()
    %
    %
      self@casadi.GenericMatrixCommon(SwigRef.Null);
      self@casadi.SparsityInterfaceCommon(SwigRef.Null);
      if nargin == 0 && ~isempty(self.swigPtr)
        return
      end
      if nargin==1 && strcmp(class(varargin{1}),'SwigRef')
        if ~isnull(varargin{1})
          self.swigPtr = varargin{1}.swigPtr;
        end
      else
        tmp = casadiMEX(369, varargin{:});
        self.swigPtr = tmp.swigPtr;
        tmp.SwigClear();
      end
    end
    function delete(self)
        if self.swigPtr
          casadiMEX(370, self);
          self.SwigClear();
        end
    end
  end
  methods(Static)
    function varargout = sym(varargin)
    %SYM [INTERNAL] 
    %
    %  MX = SYM(char name, int nrow, int ncol)
    %  MX = SYM(char name, [int,int] rc)
    %  MX = SYM(char name, Sparsity sp)
    %  {MX} = SYM(char name, Sparsity sp, int p)
    %  {MX} = SYM(char name, int nrow, int ncol, int p)
    %  {{MX}} = SYM(char name, Sparsity sp, int p, int r)
    %  {{MX}} = SYM(char name, int nrow, int ncol, int p, int r)
    %
    %Create a vector of length r of vectors of length p.
    %
    %with nrow-by-ncol symbolic primitives
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1dg
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L1280
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L1280-L1282
    %
    %
    %
    %.......
    %
    %::
    %
    %  SYM(char name, int nrow, int ncol)
    %
    %
    %
    %[INTERNAL] 
    %Create an nrow-by-ncol symbolic primitive.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1da
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L1233
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L1233-L1235
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
    %  SYM(char name, [int,int] rc)
    %
    %
    %
    %[INTERNAL] 
    %Construct a symbolic primitive with given dimensions.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1db
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L1240
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L1240-L1242
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
    %  SYM(char name, Sparsity sp)
    %
    %
    %
    %[INTERNAL] 
    %Create symbolic primitive with a given sparsity pattern.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1dc
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L1247
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L1247-L1249
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
    %  SYM(char name, Sparsity sp, int p)
    %
    %
    %
    %[INTERNAL] 
    %Create a vector of length p with with matrices.
    %
    %with symbolic primitives of given sparsity
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1dd
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L1256
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L1382-L1392
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
    %  SYM(char name, int nrow, int ncol, int p)
    %
    %
    %
    %[INTERNAL] 
    %Create a vector of length p with nrow-by-ncol symbolic 
    %primitives.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1de
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L1261
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L1261-L1264
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
    %  SYM(char name, Sparsity sp, int p, int r)
    %
    %
    %
    %[INTERNAL] 
    %Create a vector of length r of vectors of length p with.
    %
    %symbolic primitives with given sparsity
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1df
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L1272
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L1395-L1405
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
    %  SYM(char name, int nrow, int ncol, int p, int r)
    %
    %
    %
    %[INTERNAL] 
    %Create a vector of length r of vectors of length p.
    %
    %with nrow-by-ncol symbolic primitives
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1dg
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L1280
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L1280-L1282
    %
    %
    %
    %.............
    %
    %
     [varargout{1:nargout}] = casadiMEX(366, varargin{:});
    end
    function varargout = zeros(varargin)
    %ZEROS [INTERNAL] 
    %
    %  MX = ZEROS(int nrow, int ncol)
    %  MX = ZEROS([int,int] rc)
    %  MX = ZEROS(Sparsity sp)
    %
    %Create a dense matrix or a matrix with specified sparsity with 
    %all 
    %entries zero.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1dh
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L1293
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L1293-L1295
    %
    %
    %
    %.......
    %
    %::
    %
    %  ZEROS(int nrow, int ncol)
    %
    %
    %
    %[INTERNAL] 
    %Create a dense matrix or a matrix with specified sparsity with 
    %all 
    %entries zero.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1dh
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L1289
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L1289-L1291
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
    %  ZEROS([int,int] rc)
    %
    %
    %
    %[INTERNAL] 
    %Create a dense matrix or a matrix with specified sparsity with 
    %all 
    %entries zero.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1dh
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L1293
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L1293-L1295
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
    %  ZEROS(Sparsity sp)
    %
    %
    %
    %[INTERNAL] 
    %Create a dense matrix or a matrix with specified sparsity with 
    %all 
    %entries zero.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1dh
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L1292
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L1292-L1292
    %
    %
    %
    %.............
    %
    %
     [varargout{1:nargout}] = casadiMEX(367, varargin{:});
    end
    function varargout = ones(varargin)
    %ONES [INTERNAL] 
    %
    %  MX = ONES(int nrow, int ncol)
    %  MX = ONES([int,int] rc)
    %  MX = ONES(Sparsity sp)
    %
    %Create a dense matrix or a matrix with specified sparsity with 
    %all 
    %entries one.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1di
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L1306
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L1306-L1308
    %
    %
    %
    %.......
    %
    %::
    %
    %  ONES(int nrow, int ncol)
    %
    %
    %
    %[INTERNAL] 
    %Create a dense matrix or a matrix with specified sparsity with 
    %all 
    %entries one.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1di
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L1302
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L1302-L1304
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
    %  ONES([int,int] rc)
    %
    %
    %
    %[INTERNAL] 
    %Create a dense matrix or a matrix with specified sparsity with 
    %all 
    %entries one.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1di
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L1306
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L1306-L1308
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
    %  ONES(Sparsity sp)
    %
    %
    %
    %[INTERNAL] 
    %Create a dense matrix or a matrix with specified sparsity with 
    %all 
    %entries one.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1di
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L1305
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L1305-L1305
    %
    %
    %
    %.............
    %
    %
     [varargout{1:nargout}] = casadiMEX(368, varargin{:});
    end
  end
end
