classdef  Function < casadi.SharedObject & casadi.PrintableCommon & SwigRef
    %FUNCTION [INTERNAL] 
    %
    %
    % Function object.
    %
    %A  Function instance is a general multiple-input, multiple-output function 
    %where 
    %each input and output can be a sparse matrix.
    % For an introduction to
    % this class, see the CasADi user guide. Function is a reference counted and 
    %immutable class; copying a class instance 
    %is very cheap and its behavior 
    %(with some exceptions) is not affected 
    %by calling its member functions.
    %
    %Joel Andersson
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1uw
    %
    %>List of available options
    %
    %+------------------+-----------------+------------------+------------------+
    %|        Id        |      Type       |   Description    |     Used in      |
    %+==================+=================+==================+==================+
    %| ad_weight        | OT_DOUBLE       | Weighting factor | casadi::Function |
    %|                  |                 | for derivative   | Internal         |
    %|                  |                 | calculation.When |                  |
    %|                  |                 | there is an      |                  |
    %|                  |                 | option of either |                  |
    %|                  |                 | using forward or |                  |
    %|                  |                 | reverse mode     |                  |
    %|                  |                 | directional      |                  |
    %|                  |                 | derivatives, the |                  |
    %|                  |                 | condition ad_wei |                  |
    %|                  |                 | ght*nf<=(1-      |                  |
    %|                  |                 | ad_weight)*na is |                  |
    %|                  |                 | used where nf    |                  |
    %|                  |                 | and na are       |                  |
    %|                  |                 | estimates of the |                  |
    %|                  |                 | number of        |                  |
    %|                  |                 | forward/reverse  |                  |
    %|                  |                 | mode directional |                  |
    %|                  |                 | derivatives      |                  |
    %|                  |                 | needed. By       |                  |
    %|                  |                 | default,         |                  |
    %|                  |                 | ad_weight is     |                  |
    %|                  |                 | calculated       |                  |
    %|                  |                 | automatically,   |                  |
    %|                  |                 | but this can be  |                  |
    %|                  |                 | overridden by    |                  |
    %|                  |                 | setting this     |                  |
    %|                  |                 | option. In       |                  |
    %|                  |                 | particular, 0    |                  |
    %|                  |                 | means forcing    |                  |
    %|                  |                 | forward mode and |                  |
    %|                  |                 | 1 forcing        |                  |
    %|                  |                 | reverse mode.    |                  |
    %|                  |                 | Leave unset for  |                  |
    %|                  |                 | (class specific) |                  |
    %|                  |                 | heuristics.      |                  |
    %+------------------+-----------------+------------------+------------------+
    %| ad_weight_sp     | OT_DOUBLE       | Weighting factor | casadi::Function |
    %|                  |                 | for sparsity     | Internal         |
    %|                  |                 | pattern          |                  |
    %|                  |                 | calculation calc |                  |
    %|                  |                 | ulation.Override |                  |
    %|                  |                 | s default        |                  |
    %|                  |                 | behavior. Set to |                  |
    %|                  |                 | 0 and 1 to force |                  |
    %|                  |                 | forward and      |                  |
    %|                  |                 | reverse mode     |                  |
    %|                  |                 | respectively.    |                  |
    %|                  |                 | Cf. option       |                  |
    %|                  |                 | "ad_weight".     |                  |
    %|                  |                 | When set to -1,  |                  |
    %|                  |                 | sparsity is      |                  |
    %|                  |                 | completely       |                  |
    %|                  |                 | ignored and      |                  |
    %|                  |                 | dense matrices   |                  |
    %|                  |                 | are used.        |                  |
    %+------------------+-----------------+------------------+------------------+
    %| always_inline    | OT_BOOL         | Force inlining.  | casadi::Function |
    %|                  |                 |                  | Internal         |
    %+------------------+-----------------+------------------+------------------+
    %| cache            | OT_DICT         | Prepopulate the  | casadi::Function |
    %|                  |                 | function cache.  | Internal         |
    %|                  |                 | Default: empty   |                  |
    %+------------------+-----------------+------------------+------------------+
    %| compiler         | OT_STRING       | Just-in-time     | casadi::Function |
    %|                  |                 | compiler plugin  | Internal         |
    %|                  |                 | to be used.      |                  |
    %+------------------+-----------------+------------------+------------------+
    %| custom_jacobian  | OT_FUNCTION     | Override         | casadi::Function |
    %|                  |                 | CasADi's AD. Use | Internal         |
    %|                  |                 | together with    |                  |
    %|                  |                 | 'jac_penalty':   |                  |
    %|                  |                 | 0. Note: Highly  |                  |
    %|                  |                 | experimental.    |                  |
    %|                  |                 | Syntax may break |                  |
    %|                  |                 | often.           |                  |
    %+------------------+-----------------+------------------+------------------+
    %| der_options      | OT_DICT         | Default options  | casadi::Function |
    %|                  |                 | to be used to    | Internal         |
    %|                  |                 | populate         |                  |
    %|                  |                 | forward_options, |                  |
    %|                  |                 | reverse_options, |                  |
    %|                  |                 | and              |                  |
    %|                  |                 | jacobian_options |                  |
    %|                  |                 | before those     |                  |
    %|                  |                 | options are      |                  |
    %|                  |                 | merged in.       |                  |
    %+------------------+-----------------+------------------+------------------+
    %| derivative_of    | OT_FUNCTION     | The function is  | casadi::Function |
    %|                  |                 | a derivative of  | Internal         |
    %|                  |                 | another          |                  |
    %|                  |                 | function. The    |                  |
    %|                  |                 | type of          |                  |
    %|                  |                 | derivative       |                  |
    %|                  |                 | (directional     |                  |
    %|                  |                 | derivative,      |                  |
    %|                  |                 | Jacobian) is     |                  |
    %|                  |                 | inferred from    |                  |
    %|                  |                 | the function     |                  |
    %|                  |                 | name.            |                  |
    %+------------------+-----------------+------------------+------------------+
    %| dump             | OT_BOOL         | Dump function to | casadi::Function |
    %|                  |                 | file upon first  | Internal         |
    %|                  |                 | evaluation.      |                  |
    %|                  |                 | [false]          |                  |
    %+------------------+-----------------+------------------+------------------+
    %| dump_dir         | OT_STRING       | Directory to     | casadi::Function |
    %|                  |                 | dump             | Internal         |
    %|                  |                 | inputs/outputs   |                  |
    %|                  |                 | to. Make sure    |                  |
    %|                  |                 | the directory    |                  |
    %|                  |                 | exists [.]       |                  |
    %+------------------+-----------------+------------------+------------------+
    %| dump_format      | OT_STRING       | Choose file      | casadi::Function |
    %|                  |                 | format to dump   | Internal         |
    %|                  |                 | matrices. See    |                  |
    %|                  |                 | DM.from_file     |                  |
    %|                  |                 | [mtx]            |                  |
    %+------------------+-----------------+------------------+------------------+
    %| dump_in          | OT_BOOL         | Dump numerical   | casadi::Function |
    %|                  |                 | values of inputs | Internal         |
    %|                  |                 | to file          |                  |
    %|                  |                 | (readable with   |                  |
    %|                  |                 | DM.from_file )   |                  |
    %|                  |                 | [default: false] |                  |
    %|                  |                 | A counter is     |                  |
    %|                  |                 | used to generate |                  |
    %|                  |                 | unique names.    |                  |
    %|                  |                 | The counter may  |                  |
    %|                  |                 | be reset using r |                  |
    %|                  |                 | eset_dump_count. |                  |
    %+------------------+-----------------+------------------+------------------+
    %| dump_out         | OT_BOOL         | Dump numerical   | casadi::Function |
    %|                  |                 | values of        | Internal         |
    %|                  |                 | outputs to file  |                  |
    %|                  |                 | (readable with   |                  |
    %|                  |                 | DM.from_file )   |                  |
    %|                  |                 | [default: false] |                  |
    %|                  |                 | A counter is     |                  |
    %|                  |                 | used to generate |                  |
    %|                  |                 | unique names.    |                  |
    %|                  |                 | The counter may  |                  |
    %|                  |                 | be reset using r |                  |
    %|                  |                 | eset_dump_count. |                  |
    %+------------------+-----------------+------------------+------------------+
    %| enable_fd        | OT_BOOL         | Enable           | casadi::Function |
    %|                  |                 | derivative       | Internal         |
    %|                  |                 | calculation by   |                  |
    %|                  |                 | finite           |                  |
    %|                  |                 | differencing.    |                  |
    %|                  |                 | [default:        |                  |
    %|                  |                 | false]]          |                  |
    %+------------------+-----------------+------------------+------------------+
    %| enable_forward   | OT_BOOL         | Enable           | casadi::Function |
    %|                  |                 | derivative       | Internal         |
    %|                  |                 | calculation      |                  |
    %|                  |                 | using generated  |                  |
    %|                  |                 | functions for    |                  |
    %|                  |                 | Jacobian-times-  |                  |
    %|                  |                 | vector products  |                  |
    %|                  |                 | - typically      |                  |
    %|                  |                 | using forward    |                  |
    %|                  |                 | mode AD - if     |                  |
    %|                  |                 | available.       |                  |
    %|                  |                 | [default: true]  |                  |
    %+------------------+-----------------+------------------+------------------+
    %| enable_jacobian  | OT_BOOL         | Enable           | casadi::Function |
    %|                  |                 | derivative       | Internal         |
    %|                  |                 | calculation      |                  |
    %|                  |                 | using generated  |                  |
    %|                  |                 | functions for    |                  |
    %|                  |                 | Jacobians of all |                  |
    %|                  |                 | differentiable   |                  |
    %|                  |                 | outputs with     |                  |
    %|                  |                 | respect to all   |                  |
    %|                  |                 | differentiable   |                  |
    %|                  |                 | inputs - if      |                  |
    %|                  |                 | available.       |                  |
    %|                  |                 | [default: true]  |                  |
    %+------------------+-----------------+------------------+------------------+
    %| enable_reverse   | OT_BOOL         | Enable           | casadi::Function |
    %|                  |                 | derivative       | Internal         |
    %|                  |                 | calculation      |                  |
    %|                  |                 | using generated  |                  |
    %|                  |                 | functions for    |                  |
    %|                  |                 | transposed       |                  |
    %|                  |                 | Jacobian-times-  |                  |
    %|                  |                 | vector products  |                  |
    %|                  |                 | - typically      |                  |
    %|                  |                 | using reverse    |                  |
    %|                  |                 | mode AD - if     |                  |
    %|                  |                 | available.       |                  |
    %|                  |                 | [default: true]  |                  |
    %+------------------+-----------------+------------------+------------------+
    %| error_on_fail    | OT_BOOL         | Throw exceptions | casadi::ProtoFun |
    %|                  |                 | when function    | ction            |
    %|                  |                 | evaluation fails |                  |
    %|                  |                 | (default true).  |                  |
    %+------------------+-----------------+------------------+------------------+
    %| external_transfo | OT_VECTORVECTOR | List of external | casadi::Function |
    %| rm               |                 | _transform       | Internal         |
    %|                  |                 | instruction      |                  |
    %|                  |                 | arguments.       |                  |
    %|                  |                 | Default: empty   |                  |
    %+------------------+-----------------+------------------+------------------+
    %| fd_method        | OT_STRING       | Method for       | casadi::Function |
    %|                  |                 | finite           | Internal         |
    %|                  |                 | differencing     |                  |
    %|                  |                 | [default         |                  |
    %|                  |                 | 'central']       |                  |
    %+------------------+-----------------+------------------+------------------+
    %| fd_options       | OT_DICT         | Options to be    | casadi::Function |
    %|                  |                 | passed to the    | Internal         |
    %|                  |                 | finite           |                  |
    %|                  |                 | difference       |                  |
    %|                  |                 | instance         |                  |
    %+------------------+-----------------+------------------+------------------+
    %| forward_options  | OT_DICT         | Options to be    | casadi::Function |
    %|                  |                 | passed to a      | Internal         |
    %|                  |                 | forward mode     |                  |
    %|                  |                 | constructor      |                  |
    %+------------------+-----------------+------------------+------------------+
    %| gather_stats     | OT_BOOL         | Deprecated       | casadi::Function |
    %|                  |                 | option           | Internal         |
    %|                  |                 | (ignored):       |                  |
    %|                  |                 | Statistics are   |                  |
    %|                  |                 | now always       |                  |
    %|                  |                 | collected.       |                  |
    %+------------------+-----------------+------------------+------------------+
    %| inputs_check     | OT_BOOL         | Throw exceptions | casadi::Function |
    %|                  |                 | when the         | Internal         |
    %|                  |                 | numerical values |                  |
    %|                  |                 | of the inputs    |                  |
    %|                  |                 | don't make sense |                  |
    %+------------------+-----------------+------------------+------------------+
    %| is_diff_in       | OT_BOOLVECTOR   | Indicate for     | casadi::Function |
    %|                  |                 | each input if it | Internal         |
    %|                  |                 | should be        |                  |
    %|                  |                 | differentiable.  |                  |
    %+------------------+-----------------+------------------+------------------+
    %| is_diff_out      | OT_BOOLVECTOR   | Indicate for     | casadi::Function |
    %|                  |                 | each output if   | Internal         |
    %|                  |                 | it should be     |                  |
    %|                  |                 | differentiable.  |                  |
    %+------------------+-----------------+------------------+------------------+
    %| jac_penalty      | OT_DOUBLE       | When requested   | casadi::Function |
    %|                  |                 | for a number of  | Internal         |
    %|                  |                 | forward/reverse  |                  |
    %|                  |                 | directions, it   |                  |
    %|                  |                 | may be cheaper   |                  |
    %|                  |                 | to compute first |                  |
    %|                  |                 | the full         |                  |
    %|                  |                 | jacobian and     |                  |
    %|                  |                 | then multiply    |                  |
    %|                  |                 | with seeds,      |                  |
    %|                  |                 | rather than      |                  |
    %|                  |                 | obtain the       |                  |
    %|                  |                 | requested        |                  |
    %|                  |                 | directions in a  |                  |
    %|                  |                 | straightforward  |                  |
    %|                  |                 | manner. Casadi   |                  |
    %|                  |                 | uses a heuristic |                  |
    %|                  |                 | to decide which  |                  |
    %|                  |                 | is cheaper. A    |                  |
    %|                  |                 | high value of    |                  |
    %|                  |                 | 'jac_penalty'    |                  |
    %|                  |                 | makes it less    |                  |
    %|                  |                 | likely for the   |                  |
    %|                  |                 | heurstic to      |                  |
    %|                  |                 | chose the full   |                  |
    %|                  |                 | Jacobian         |                  |
    %|                  |                 | strategy. The    |                  |
    %|                  |                 | special value -1 |                  |
    %|                  |                 | indicates never  |                  |
    %|                  |                 | to use the full  |                  |
    %|                  |                 | Jacobian         |                  |
    %|                  |                 | strategy         |                  |
    %+------------------+-----------------+------------------+------------------+
    %| jacobian_options | OT_DICT         | Options to be    | casadi::Function |
    %|                  |                 | passed to a      | Internal         |
    %|                  |                 | Jacobian         |                  |
    %|                  |                 | constructor      |                  |
    %+------------------+-----------------+------------------+------------------+
    %| jit              | OT_BOOL         | Use just-in-time | casadi::Function |
    %|                  |                 | compiler to      | Internal         |
    %|                  |                 | speed up the     |                  |
    %|                  |                 | evaluation       |                  |
    %+------------------+-----------------+------------------+------------------+
    %| jit_cleanup      | OT_BOOL         | Cleanup up the   | casadi::Function |
    %|                  |                 | temporary source | Internal         |
    %|                  |                 | file that jit    |                  |
    %|                  |                 | creates.         |                  |
    %|                  |                 | Default: true    |                  |
    %+------------------+-----------------+------------------+------------------+
    %| jit_name         | OT_STRING       | The file name    | casadi::Function |
    %|                  |                 | used to write    | Internal         |
    %|                  |                 | out code. The    |                  |
    %|                  |                 | actual file      |                  |
    %|                  |                 | names used       |                  |
    %|                  |                 | depend on 'jit_t |                  |
    %|                  |                 | emp_suffix' and  |                  |
    %|                  |                 | include          |                  |
    %|                  |                 | extensions.      |                  |
    %|                  |                 | Default:         |                  |
    %|                  |                 | 'jit_tmp'        |                  |
    %+------------------+-----------------+------------------+------------------+
    %| jit_options      | OT_DICT         | Options to be    | casadi::Function |
    %|                  |                 | passed to the    | Internal         |
    %|                  |                 | jit compiler.    |                  |
    %+------------------+-----------------+------------------+------------------+
    %| jit_serialize    | OT_STRING       | Specify          | casadi::Function |
    %|                  |                 | behaviour when   | Internal         |
    %|                  |                 | serializing a    |                  |
    %|                  |                 | jitted function: |                  |
    %|                  |                 | SOURCE|link|embe |                  |
    %|                  |                 | d.               |                  |
    %+------------------+-----------------+------------------+------------------+
    %| jit_temp_suffix  | OT_BOOL         | Use a temporary  | casadi::Function |
    %|                  |                 | (seemingly       | Internal         |
    %|                  |                 | random) filename |                  |
    %|                  |                 | suffix for       |                  |
    %|                  |                 | generated code   |                  |
    %|                  |                 | and libraries.   |                  |
    %|                  |                 | This is desired  |                  |
    %|                  |                 | for thread-      |                  |
    %|                  |                 | safety. This     |                  |
    %|                  |                 | behaviour may    |                  |
    %|                  |                 | defeat caching   |                  |
    %|                  |                 | compiler         |                  |
    %|                  |                 | wrappers.        |                  |
    %|                  |                 | Default: true    |                  |
    %+------------------+-----------------+------------------+------------------+
    %| max_io           | OT_INT          | Acceptable       | casadi::Function |
    %|                  |                 | number of inputs | Internal         |
    %|                  |                 | and outputs.     |                  |
    %|                  |                 | Warn if          |                  |
    %|                  |                 | exceeded.        |                  |
    %+------------------+-----------------+------------------+------------------+
    %| max_num_dir      | OT_INT          | Specify the      | casadi::Function |
    %|                  |                 | maximum number   | Internal         |
    %|                  |                 | of directions    |                  |
    %|                  |                 | for derivative   |                  |
    %|                  |                 | functions.       |                  |
    %|                  |                 | Overrules the    |                  |
    %|                  |                 | builtin optimize |                  |
    %|                  |                 | d_num_dir.       |                  |
    %+------------------+-----------------+------------------+------------------+
    %| never_inline     | OT_BOOL         | Forbid inlining. | casadi::Function |
    %|                  |                 |                  | Internal         |
    %+------------------+-----------------+------------------+------------------+
    %| post_expand      | OT_BOOL         | After            | casadi::Function |
    %|                  |                 | construction,    | Internal         |
    %|                  |                 | expand this      |                  |
    %|                  |                 | Function .       |                  |
    %|                  |                 | Default: False   |                  |
    %+------------------+-----------------+------------------+------------------+
    %| post_expand_opti | OT_DICT         | Options to be    | casadi::Function |
    %| ons              |                 | passed to post-  | Internal         |
    %|                  |                 | construction     |                  |
    %|                  |                 | expansion.       |                  |
    %|                  |                 | Default: empty   |                  |
    %+------------------+-----------------+------------------+------------------+
    %| print_canonical  | OT_BOOL         | When printing    | casadi::Function |
    %|                  |                 | numerical        | Internal         |
    %|                  |                 | matrices, use a  |                  |
    %|                  |                 | format that is   |                  |
    %|                  |                 | exact and        |                  |
    %|                  |                 | reproducible in  |                  |
    %|                  |                 | generated C      |                  |
    %|                  |                 | code.            |                  |
    %+------------------+-----------------+------------------+------------------+
    %| print_in         | OT_BOOL         | Print numerical  | casadi::Function |
    %|                  |                 | values of inputs | Internal         |
    %|                  |                 | [default: false] |                  |
    %+------------------+-----------------+------------------+------------------+
    %| print_out        | OT_BOOL         | Print numerical  | casadi::Function |
    %|                  |                 | values of        | Internal         |
    %|                  |                 | outputs          |                  |
    %|                  |                 | [default: false] |                  |
    %+------------------+-----------------+------------------+------------------+
    %| print_time       | OT_BOOL         | print            | casadi::ProtoFun |
    %|                  |                 | information      | ction            |
    %|                  |                 | about execution  |                  |
    %|                  |                 | time. Implies    |                  |
    %|                  |                 | record_time.     |                  |
    %+------------------+-----------------+------------------+------------------+
    %| record_time      | OT_BOOL         | record           | casadi::ProtoFun |
    %|                  |                 | information      | ction            |
    %|                  |                 | about execution  |                  |
    %|                  |                 | time, for        |                  |
    %|                  |                 | retrieval with   |                  |
    %|                  |                 | stats() .        |                  |
    %+------------------+-----------------+------------------+------------------+
    %| regularity_check | OT_BOOL         | Throw exceptions | casadi::ProtoFun |
    %|                  |                 | when NaN or Inf  | ction            |
    %|                  |                 | appears during   |                  |
    %|                  |                 | evaluation       |                  |
    %+------------------+-----------------+------------------+------------------+
    %| reverse_options  | OT_DICT         | Options to be    | casadi::Function |
    %|                  |                 | passed to a      | Internal         |
    %|                  |                 | reverse mode     |                  |
    %|                  |                 | constructor      |                  |
    %+------------------+-----------------+------------------+------------------+
    %| user_data        | OT_VOIDPTR      | A user-defined   | casadi::Function |
    %|                  |                 | field that can   | Internal         |
    %|                  |                 | be used to       |                  |
    %|                  |                 | identify the     |                  |
    %|                  |                 | function or pass |                  |
    %|                  |                 | additional       |                  |
    %|                  |                 | information      |                  |
    %+------------------+-----------------+------------------+------------------+
    %| verbose          | OT_BOOL         | Verbose          | casadi::ProtoFun |
    %|                  |                 | evaluation  for  | ction            |
    %|                  |                 | debugging        |                  |
    %+------------------+-----------------+------------------+------------------+
    %
    %C++ includes: function.hpp
    %
    %
  methods
    function this = swig_this(self)
      this = casadiMEX(3, self);
    end
    function delete(self)
        if self.swigPtr
          casadiMEX(750, self);
          self.SwigClear();
        end
    end
    function varargout = expand(self,varargin)
    %EXPAND [INTERNAL] 
    %
    %  Function = EXPAND(self)
    %  Function = EXPAND(self, char name, struct opts)
    %
    %Expand a function to SX.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1v5
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L207
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L317-L328
    %
    %
    %
    %.......
    %
    %::
    %
    %  EXPAND(self)
    %
    %
    %
    %[INTERNAL] 
    %Expand a function to SX.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1v5
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L206
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L312-L315
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
    %  EXPAND(self, char name, struct opts)
    %
    %
    %
    %[INTERNAL] 
    %Expand a function to SX.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1v5
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L207
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L317-L328
    %
    %
    %
    %.............
    %
    %
      [varargout{1:nargout}] = casadiMEX(751, self, varargin{:});
    end
    function varargout = transform(self,varargin)
    %TRANSFORM [INTERNAL] 
    %
    %  Function = TRANSFORM(self, struct opts)
    %  Function = TRANSFORM(self, char fname, struct opts)
    %  Function = TRANSFORM(self, {{GenericType}} passes, struct opts)
    %  Function = TRANSFORM(self, char fname, {{GenericType}} passes, struct opts)
    %
    %Apply transformation passes.
    %
    %Options:
    %passes (OT_VECTORVECTOR): an ordered list of passes. Each pass is a
    % 
    %list whose first entry is the verb:
    %{"simplify", task, ...}: graph 
    %simplification passes applied in 
    %order (cse, ref_count, const_folding, 
    %combine_terms, empty_inputs). An
    % integer before a task sets its run count 
    %(N>0: N times, 0: until a 
    %fixed point); the default is 1.
    %
    %{"expand"}: expand to an SXFunction
    %
    %{"external", library, operation, opts}: apply an externally defined 
    %
    %transform (opts is an optional dict)
    %
    %boolean shorthands (used only when "passes" is absent): 
    %empty_inputs, 
    %combine_terms, cse, ref_count, const_folding. These 
    %build a single 
    %"simplify" pass.
    %
    %The dict-only form applies a default simplification flow when empty. 
    %The 
    %(passes, opts) form runs an explicit pipeline; its opts accepts 
    %only 
    %"verbose" (the boolean simplify options are rejected there).
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_2ig
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L237
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L406-L486
    %
    %
    %
    %.......
    %
    %::
    %
    %  TRANSFORM(self, struct opts)
    %
    %
    %
    %[INTERNAL] 
    %Apply transformation passes.
    %
    %Options:
    %passes (OT_VECTORVECTOR): an ordered list of passes. Each pass is a
    % 
    %list whose first entry is the verb:
    %{"simplify", task, ...}: graph 
    %simplification passes applied in 
    %order (cse, ref_count, const_folding, 
    %combine_terms, empty_inputs). An
    % integer before a task sets its run count 
    %(N>0: N times, 0: until a 
    %fixed point); the default is 1.
    %
    %{"expand"}: expand to an SXFunction
    %
    %{"external", library, operation, opts}: apply an externally defined 
    %
    %transform (opts is an optional dict)
    %
    %boolean shorthands (used only when "passes" is absent): 
    %empty_inputs, 
    %combine_terms, cse, ref_count, const_folding. These 
    %build a single 
    %"simplify" pass.
    %
    %The dict-only form applies a default simplification flow when empty. 
    %The 
    %(passes, opts) form runs an explicit pipeline; its opts accepts 
    %only 
    %"verbose" (the boolean simplify options are rejected there).
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_2ig
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L233
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L359-L361
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
    %  TRANSFORM(self, char fname, struct opts)
    %
    %
    %
    %[INTERNAL] 
    %Apply transformation passes.
    %
    %Options:
    %passes (OT_VECTORVECTOR): an ordered list of passes. Each pass is a
    % 
    %list whose first entry is the verb:
    %{"simplify", task, ...}: graph 
    %simplification passes applied in 
    %order (cse, ref_count, const_folding, 
    %combine_terms, empty_inputs). An
    % integer before a task sets its run count 
    %(N>0: N times, 0: until a 
    %fixed point); the default is 1.
    %
    %{"expand"}: expand to an SXFunction
    %
    %{"external", library, operation, opts}: apply an externally defined 
    %
    %transform (opts is an optional dict)
    %
    %boolean shorthands (used only when "passes" is absent): 
    %empty_inputs, 
    %combine_terms, cse, ref_count, const_folding. These 
    %build a single 
    %"simplify" pass.
    %
    %The dict-only form applies a default simplification flow when empty. 
    %The 
    %(passes, opts) form runs an explicit pipeline; its opts accepts 
    %only 
    %"verbose" (the boolean simplify options are rejected there).
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_2ig
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L234
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L363-L399
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
    %  TRANSFORM(self, {{GenericType}} passes, struct opts)
    %
    %
    %
    %[INTERNAL] 
    %Apply transformation passes.
    %
    %Options:
    %passes (OT_VECTORVECTOR): an ordered list of passes. Each pass is a
    % 
    %list whose first entry is the verb:
    %{"simplify", task, ...}: graph 
    %simplification passes applied in 
    %order (cse, ref_count, const_folding, 
    %combine_terms, empty_inputs). An
    % integer before a task sets its run count 
    %(N>0: N times, 0: until a 
    %fixed point); the default is 1.
    %
    %{"expand"}: expand to an SXFunction
    %
    %{"external", library, operation, opts}: apply an externally defined 
    %
    %transform (opts is an optional dict)
    %
    %boolean shorthands (used only when "passes" is absent): 
    %empty_inputs, 
    %combine_terms, cse, ref_count, const_folding. These 
    %build a single 
    %"simplify" pass.
    %
    %The dict-only form applies a default simplification flow when empty. 
    %The 
    %(passes, opts) form runs an explicit pipeline; its opts accepts 
    %only 
    %"verbose" (the boolean simplify options are rejected there).
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_2ig
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L235
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L401-L404
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
    %  TRANSFORM(self, char fname, {{GenericType}} passes, struct opts)
    %
    %
    %
    %[INTERNAL] 
    %Apply transformation passes.
    %
    %Options:
    %passes (OT_VECTORVECTOR): an ordered list of passes. Each pass is a
    % 
    %list whose first entry is the verb:
    %{"simplify", task, ...}: graph 
    %simplification passes applied in 
    %order (cse, ref_count, const_folding, 
    %combine_terms, empty_inputs). An
    % integer before a task sets its run count 
    %(N>0: N times, 0: until a 
    %fixed point); the default is 1.
    %
    %{"expand"}: expand to an SXFunction
    %
    %{"external", library, operation, opts}: apply an externally defined 
    %
    %transform (opts is an optional dict)
    %
    %boolean shorthands (used only when "passes" is absent): 
    %empty_inputs, 
    %combine_terms, cse, ref_count, const_folding. These 
    %build a single 
    %"simplify" pass.
    %
    %The dict-only form applies a default simplification flow when empty. 
    %The 
    %(passes, opts) form runs an explicit pipeline; its opts accepts 
    %only 
    %"verbose" (the boolean simplify options are rejected there).
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_2ig
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L237
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L406-L486
    %
    %
    %
    %.............
    %
    %
      [varargout{1:nargout}] = casadiMEX(752, self, varargin{:});
    end
    function varargout = n_in(self,varargin)
    %N_IN [INTERNAL] 
    %
    %  int = N_IN(self)
    %
    %Get the number of function inputs.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1v8
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L259
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L971-L973
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(753, self, varargin{:});
    end
    function varargout = n_out(self,varargin)
    %N_OUT [INTERNAL] 
    %
    %  int = N_OUT(self)
    %
    %Get the number of function outputs.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1v9
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L264
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L975-L977
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(754, self, varargin{:});
    end
    function varargout = size1_in(self,varargin)
    %SIZE1_IN [INTERNAL] 
    %
    %  int = SIZE1_IN(self, int ind)
    %  int = SIZE1_IN(self, char iname)
    %
    %Get input dimension.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1va
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L271
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L271-L271
    %
    %
    %
    %.......
    %
    %::
    %
    %  SIZE1_IN(self, int ind)
    %
    %
    %
    %[INTERNAL] 
    %Get input dimension.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1va
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L270
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L979-L981
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
    %  SIZE1_IN(self, char iname)
    %
    %
    %
    %[INTERNAL] 
    %Get input dimension.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1va
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L271
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L271-L271
    %
    %
    %
    %.............
    %
    %
      [varargout{1:nargout}] = casadiMEX(755, self, varargin{:});
    end
    function varargout = size2_in(self,varargin)
    %SIZE2_IN [INTERNAL] 
    %
    %  int = SIZE2_IN(self, int ind)
    %  int = SIZE2_IN(self, char iname)
    %
    %Get input dimension.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1va
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L273
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L273-L273
    %
    %
    %
    %.......
    %
    %::
    %
    %  SIZE2_IN(self, int ind)
    %
    %
    %
    %[INTERNAL] 
    %Get input dimension.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1va
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L272
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L983-L985
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
    %  SIZE2_IN(self, char iname)
    %
    %
    %
    %[INTERNAL] 
    %Get input dimension.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1va
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L273
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L273-L273
    %
    %
    %
    %.............
    %
    %
      [varargout{1:nargout}] = casadiMEX(756, self, varargin{:});
    end
    function varargout = size_in(self,varargin)
    %SIZE_IN [INTERNAL] 
    %
    %  [int,int] = SIZE_IN(self, int ind)
    %  [int,int] = SIZE_IN(self, char iname)
    %
    %Get input dimension.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1va
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L275
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L275-L277
    %
    %
    %
    %.......
    %
    %::
    %
    %  SIZE_IN(self, int ind)
    %
    %
    %
    %[INTERNAL] 
    %Get input dimension.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1va
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L274
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L995-L997
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
    %  SIZE_IN(self, char iname)
    %
    %
    %
    %[INTERNAL] 
    %Get input dimension.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1va
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L275
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L275-L277
    %
    %
    %
    %.............
    %
    %
      [varargout{1:nargout}] = casadiMEX(757, self, varargin{:});
    end
    function varargout = size1_out(self,varargin)
    %SIZE1_OUT [INTERNAL] 
    %
    %  int = SIZE1_OUT(self, int ind)
    %  int = SIZE1_OUT(self, char oname)
    %
    %Get output dimension.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1vb
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L285
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L285-L285
    %
    %
    %
    %.......
    %
    %::
    %
    %  SIZE1_OUT(self, int ind)
    %
    %
    %
    %[INTERNAL] 
    %Get output dimension.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1vb
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L284
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L987-L989
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
    %  SIZE1_OUT(self, char oname)
    %
    %
    %
    %[INTERNAL] 
    %Get output dimension.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1vb
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L285
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L285-L285
    %
    %
    %
    %.............
    %
    %
      [varargout{1:nargout}] = casadiMEX(758, self, varargin{:});
    end
    function varargout = size2_out(self,varargin)
    %SIZE2_OUT [INTERNAL] 
    %
    %  int = SIZE2_OUT(self, int ind)
    %  int = SIZE2_OUT(self, char oname)
    %
    %Get output dimension.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1vb
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L287
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L287-L287
    %
    %
    %
    %.......
    %
    %::
    %
    %  SIZE2_OUT(self, int ind)
    %
    %
    %
    %[INTERNAL] 
    %Get output dimension.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1vb
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L286
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L991-L993
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
    %  SIZE2_OUT(self, char oname)
    %
    %
    %
    %[INTERNAL] 
    %Get output dimension.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1vb
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L287
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L287-L287
    %
    %
    %
    %.............
    %
    %
      [varargout{1:nargout}] = casadiMEX(759, self, varargin{:});
    end
    function varargout = size_out(self,varargin)
    %SIZE_OUT [INTERNAL] 
    %
    %  [int,int] = SIZE_OUT(self, int ind)
    %  [int,int] = SIZE_OUT(self, char oname)
    %
    %Get output dimension.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1vb
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L289
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L289-L291
    %
    %
    %
    %.......
    %
    %::
    %
    %  SIZE_OUT(self, int ind)
    %
    %
    %
    %[INTERNAL] 
    %Get output dimension.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1vb
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L288
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L999-L1001
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
    %  SIZE_OUT(self, char oname)
    %
    %
    %
    %[INTERNAL] 
    %Get output dimension.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1vb
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L289
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L289-L291
    %
    %
    %
    %.............
    %
    %
      [varargout{1:nargout}] = casadiMEX(760, self, varargin{:});
    end
    function varargout = nnz_in(self,varargin)
    %NNZ_IN [INTERNAL] 
    %
    %  int = NNZ_IN(self)
    %  int = NNZ_IN(self, int ind)
    %  int = NNZ_IN(self, char iname)
    %
    %Get number of input nonzeros.
    %
    %For a particular input or for all of the inputs
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1vc
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L302
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L302-L302
    %
    %
    %
    %.......
    %
    %::
    %
    %  NNZ_IN(self)
    %
    %
    %
    %[INTERNAL] 
    %Get number of input nonzeros.
    %
    %For a particular input or for all of the inputs
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1vc
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L300
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L1003-L1005
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
    %  NNZ_IN(self, int ind)
    %
    %
    %
    %[INTERNAL] 
    %Get number of input nonzeros.
    %
    %For a particular input or for all of the inputs
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1vc
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L301
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L1019-L1021
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
    %  NNZ_IN(self, char iname)
    %
    %
    %
    %[INTERNAL] 
    %Get number of input nonzeros.
    %
    %For a particular input or for all of the inputs
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1vc
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L302
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L302-L302
    %
    %
    %
    %.............
    %
    %
      [varargout{1:nargout}] = casadiMEX(761, self, varargin{:});
    end
    function varargout = nnz_out(self,varargin)
    %NNZ_OUT [INTERNAL] 
    %
    %  int = NNZ_OUT(self)
    %  int = NNZ_OUT(self, int ind)
    %  int = NNZ_OUT(self, char oname)
    %
    %Get number of output nonzeros.
    %
    %For a particular output or for all of the outputs
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1vd
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L313
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L313-L313
    %
    %
    %
    %.......
    %
    %::
    %
    %  NNZ_OUT(self)
    %
    %
    %
    %[INTERNAL] 
    %Get number of output nonzeros.
    %
    %For a particular output or for all of the outputs
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1vd
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L311
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L1007-L1009
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
    %  NNZ_OUT(self, int ind)
    %
    %
    %
    %[INTERNAL] 
    %Get number of output nonzeros.
    %
    %For a particular output or for all of the outputs
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1vd
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L312
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L1023-L1025
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
    %  NNZ_OUT(self, char oname)
    %
    %
    %
    %[INTERNAL] 
    %Get number of output nonzeros.
    %
    %For a particular output or for all of the outputs
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1vd
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L313
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L313-L313
    %
    %
    %
    %.............
    %
    %
      [varargout{1:nargout}] = casadiMEX(762, self, varargin{:});
    end
    function varargout = activity(self,varargin)
    %ACTIVITY [INTERNAL] 
    %
    %  [bool] = ACTIVITY(self, [bool] arg)
    %
    % Output signal activity induced by a given input activity.
    %
    %arg is a flat activity mask over all input nonzeros (size  nnz_in(), true = 
    %active = possibly nonzero); the result is the corresponding 
    %mask over all 
    %output nonzeros (size  nnz_out()). An output that comes out inactive (false)
    % is guaranteed zero for 
    %any value of the active inputs. Unlike sparsity 
    %propagation this 
    %exploits annihilation: an inactive operand of a multiply 
    %kills the 
    %product.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_2ih
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L326
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L1269-L1295
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(763, self, varargin{:});
    end
    function varargout = numel_in(self,varargin)
    %NUMEL_IN [INTERNAL] 
    %
    %  int = NUMEL_IN(self)
    %  int = NUMEL_IN(self, int ind)
    %  int = NUMEL_IN(self, char iname)
    %
    %Get number of input elements.
    %
    %For a particular input or for all of the inputs
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1ve
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L336
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L336-L336
    %
    %
    %
    %.......
    %
    %::
    %
    %  NUMEL_IN(self)
    %
    %
    %
    %[INTERNAL] 
    %Get number of input elements.
    %
    %For a particular input or for all of the inputs
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1ve
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L334
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L1011-L1013
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
    %  NUMEL_IN(self, int ind)
    %
    %
    %
    %[INTERNAL] 
    %Get number of input elements.
    %
    %For a particular input or for all of the inputs
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1ve
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L335
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L1027-L1029
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
    %  NUMEL_IN(self, char iname)
    %
    %
    %
    %[INTERNAL] 
    %Get number of input elements.
    %
    %For a particular input or for all of the inputs
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1ve
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L336
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L336-L336
    %
    %
    %
    %.............
    %
    %
      [varargout{1:nargout}] = casadiMEX(764, self, varargin{:});
    end
    function varargout = numel_out(self,varargin)
    %NUMEL_OUT [INTERNAL] 
    %
    %  int = NUMEL_OUT(self)
    %  int = NUMEL_OUT(self, int ind)
    %  int = NUMEL_OUT(self, char oname)
    %
    %Get number of output elements.
    %
    %For a particular output or for all of the outputs
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1vf
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L347
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L347-L347
    %
    %
    %
    %.......
    %
    %::
    %
    %  NUMEL_OUT(self)
    %
    %
    %
    %[INTERNAL] 
    %Get number of output elements.
    %
    %For a particular output or for all of the outputs
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1vf
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L345
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L1015-L1017
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
    %  NUMEL_OUT(self, int ind)
    %
    %
    %
    %[INTERNAL] 
    %Get number of output elements.
    %
    %For a particular output or for all of the outputs
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1vf
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L346
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L1031-L1033
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
    %  NUMEL_OUT(self, char oname)
    %
    %
    %
    %[INTERNAL] 
    %Get number of output elements.
    %
    %For a particular output or for all of the outputs
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1vf
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L347
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L347-L347
    %
    %
    %
    %.............
    %
    %
      [varargout{1:nargout}] = casadiMEX(765, self, varargin{:});
    end
    function varargout = name_in(self,varargin)
    %NAME_IN [INTERNAL] 
    %
    %  {char} = NAME_IN(self)
    %  char = NAME_IN(self, int ind)
    %
    %Get input scheme name by index.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1vi
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L363
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L1151-L1157
    %
    %
    %
    %.......
    %
    %::
    %
    %  NAME_IN(self)
    %
    %
    %
    %[INTERNAL] 
    %Get input scheme.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1vg
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L353
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L1113-L1115
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
    %  NAME_IN(self, int ind)
    %
    %
    %
    %[INTERNAL] 
    %Get input scheme name by index.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1vi
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L363
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L1151-L1157
    %
    %
    %
    %.............
    %
    %
      [varargout{1:nargout}] = casadiMEX(766, self, varargin{:});
    end
    function varargout = name_out(self,varargin)
    %NAME_OUT [INTERNAL] 
    %
    %  {char} = NAME_OUT(self)
    %  char = NAME_OUT(self, int ind)
    %
    %Get output scheme name by index.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1vj
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L368
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L1159-L1165
    %
    %
    %
    %.......
    %
    %::
    %
    %  NAME_OUT(self)
    %
    %
    %
    %[INTERNAL] 
    %Get output scheme.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1vh
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L358
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L1117-L1119
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
    %  NAME_OUT(self, int ind)
    %
    %
    %
    %[INTERNAL] 
    %Get output scheme name by index.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1vj
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L368
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L1159-L1165
    %
    %
    %
    %.............
    %
    %
      [varargout{1:nargout}] = casadiMEX(767, self, varargin{:});
    end
    function varargout = index_in(self,varargin)
    %INDEX_IN [INTERNAL] 
    %
    %  int = INDEX_IN(self, char name)
    %
    %Find the index for a string describing a particular entry of an 
    %input 
    %scheme.
    %
    %example: schemeEntry("x_opt") -> returns NLPSOL_X if 
    %FunctionInternal 
    %adheres to SCHEME_NLPINput
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1vk
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L376
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L1121-L1127
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(768, self, varargin{:});
    end
    function varargout = index_out(self,varargin)
    %INDEX_OUT [INTERNAL] 
    %
    %  int = INDEX_OUT(self, char name)
    %
    %Find the index for a string describing a particular entry of an 
    %output
    % scheme.
    %
    %example: schemeEntry("x_opt") -> returns NLPSOL_X if 
    %FunctionInternal 
    %adheres to SCHEME_NLPINput
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1vl
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L384
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L1129-L1135
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(769, self, varargin{:});
    end
    function varargout = has_in(self,varargin)
    %HAS_IN [INTERNAL] 
    %
    %  bool = HAS_IN(self, char name)
    %
    %Does the function have a particularly named input?
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_2c9
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L389
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L1137-L1142
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(770, self, varargin{:});
    end
    function varargout = has_out(self,varargin)
    %HAS_OUT [INTERNAL] 
    %
    %  bool = HAS_OUT(self, char name)
    %
    %Does the function have a particularly named output?
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_2ca
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L393
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L1144-L1149
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(771, self, varargin{:});
    end
    function varargout = default_in(self,varargin)
    %DEFAULT_IN [INTERNAL] 
    %
    %  double = DEFAULT_IN(self, int ind)
    %
    %Get default input value.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1vm
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L398
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L1677-L1679
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(772, self, varargin{:});
    end
    function varargout = max_in(self,varargin)
    %MAX_IN [INTERNAL] 
    %
    %  double = MAX_IN(self, int ind)
    %
    %Get largest input value.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1vn
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L403
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L1681-L1683
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(773, self, varargin{:});
    end
    function varargout = min_in(self,varargin)
    %MIN_IN [INTERNAL] 
    %
    %  double = MIN_IN(self, int ind)
    %
    %Get smallest input value.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1vo
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L408
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L1685-L1687
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(774, self, varargin{:});
    end
    function varargout = nominal_in(self,varargin)
    %NOMINAL_IN [INTERNAL] 
    %
    %  [double] = NOMINAL_IN(self, int ind)
    %
    %Get nominal input value.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1vp
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L413
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L1689-L1691
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(775, self, varargin{:});
    end
    function varargout = nominal_out(self,varargin)
    %NOMINAL_OUT [INTERNAL] 
    %
    %  [double] = NOMINAL_OUT(self, int ind)
    %
    %Get nominal output value.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1vq
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L418
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L1693-L1695
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(776, self, varargin{:});
    end
    function varargout = sparsity_in(self,varargin)
    %SPARSITY_IN [INTERNAL] 
    %
    %  Sparsity = SPARSITY_IN(self, int ind)
    %  Sparsity = SPARSITY_IN(self, char iname)
    %
    %Get sparsity of a given input.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1vr
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L425
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L1175-L1181
    %
    %
    %
    %.......
    %
    %::
    %
    %  SPARSITY_IN(self, int ind)
    %
    %
    %
    %[INTERNAL] 
    %Get sparsity of a given input.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1vr
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L424
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L1167-L1173
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
    %  SPARSITY_IN(self, char iname)
    %
    %
    %
    %[INTERNAL] 
    %Get sparsity of a given input.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1vr
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L425
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L1175-L1181
    %
    %
    %
    %.............
    %
    %
      [varargout{1:nargout}] = casadiMEX(777, self, varargin{:});
    end
    function varargout = sparsity_out(self,varargin)
    %SPARSITY_OUT [INTERNAL] 
    %
    %  Sparsity = SPARSITY_OUT(self, int ind)
    %  Sparsity = SPARSITY_OUT(self, char iname)
    %
    %Get sparsity of a given output.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1vs
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L433
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L1191-L1197
    %
    %
    %
    %.......
    %
    %::
    %
    %  SPARSITY_OUT(self, int ind)
    %
    %
    %
    %[INTERNAL] 
    %Get sparsity of a given output.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1vs
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L432
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L1183-L1189
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
    %  SPARSITY_OUT(self, char iname)
    %
    %
    %
    %[INTERNAL] 
    %Get sparsity of a given output.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1vs
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L433
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L1191-L1197
    %
    %
    %
    %.............
    %
    %
      [varargout{1:nargout}] = casadiMEX(778, self, varargin{:});
    end
    function varargout = is_diff_in(self,varargin)
    %IS_DIFF_IN [INTERNAL] 
    %
    %  [bool] = IS_DIFF_IN(self)
    %  bool = IS_DIFF_IN(self, int ind)
    %
    %Get differentiability of inputs/output.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1vt
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L442
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L1215-L1221
    %
    %
    %
    %.......
    %
    %::
    %
    %  IS_DIFF_IN(self)
    %
    %
    %
    %[INTERNAL] 
    %Get differentiability of inputs/output.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1vt
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L442
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L1215-L1221
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
    %  IS_DIFF_IN(self, int ind)
    %
    %
    %
    %[INTERNAL] 
    %Get differentiability of inputs/output.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1vt
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L440
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L1199-L1205
    %
    %
    %
    %.............
    %
    %
      [varargout{1:nargout}] = casadiMEX(779, self, varargin{:});
    end
    function varargout = is_diff_out(self,varargin)
    %IS_DIFF_OUT [INTERNAL] 
    %
    %  [bool] = IS_DIFF_OUT(self)
    %  bool = IS_DIFF_OUT(self, int ind)
    %
    %Get differentiability of inputs/output.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1vt
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L443
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L1223-L1229
    %
    %
    %
    %.......
    %
    %::
    %
    %  IS_DIFF_OUT(self)
    %
    %
    %
    %[INTERNAL] 
    %Get differentiability of inputs/output.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1vt
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L443
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L1223-L1229
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
    %  IS_DIFF_OUT(self, int ind)
    %
    %
    %
    %[INTERNAL] 
    %Get differentiability of inputs/output.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1vt
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L441
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L1207-L1213
    %
    %
    %
    %.............
    %
    %
      [varargout{1:nargout}] = casadiMEX(780, self, varargin{:});
    end
    function varargout = factory(self,varargin)
    %FACTORY [INTERNAL] 
    %
    %  Function = FACTORY(self, char name, {char} s_in, {char} s_out, struct:{char} aux, struct opts)
    %
    %
      [varargout{1:nargout}] = casadiMEX(781, self, varargin{:});
    end
    function varargout = oracle(self,varargin)
    %ORACLE [INTERNAL] 
    %
    %  Function = ORACLE(self)
    %
    %Get oracle.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1vu
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L459
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L2104-L2110
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(782, self, varargin{:});
    end
    function varargout = wrap(self,varargin)
    %WRAP [INTERNAL] 
    %
    %  Function = WRAP(self)
    %  Function = WRAP(self, char name)
    %
    %Wrap in an  Function instance consisting of only one  MX call.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1vv
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L466
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L2116-L2118
    %
    %
    %
    %.......
    %
    %::
    %
    %  WRAP(self)
    %
    %
    %
    %[INTERNAL] 
    %Wrap in an  Function instance consisting of only one  MX call.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1vv
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L465
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L2112-L2114
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
    %  WRAP(self, char name)
    %
    %
    %
    %[INTERNAL] 
    %Wrap in an  Function instance consisting of only one  MX call.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1vv
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L466
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L2116-L2118
    %
    %
    %
    %.............
    %
    %
      [varargout{1:nargout}] = casadiMEX(783, self, varargin{:});
    end
    function varargout = wrap_as_needed(self,varargin)
    %WRAP_AS_NEEDED [INTERNAL] 
    %
    %  Function = WRAP_AS_NEEDED(self, struct opts)
    %  Function = WRAP_AS_NEEDED(self, char name, struct opts)
    %
    %Wrap in a  Function with options.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1vw
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L474
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L2124-L2126
    %
    %
    %
    %.......
    %
    %::
    %
    %  WRAP_AS_NEEDED(self, struct opts)
    %
    %
    %
    %[INTERNAL] 
    %Wrap in a  Function with options.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1vw
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L473
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L2120-L2122
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
    %  WRAP_AS_NEEDED(self, char name, struct opts)
    %
    %
    %
    %[INTERNAL] 
    %Wrap in a  Function with options.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1vw
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L474
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L2124-L2126
    %
    %
    %
    %.............
    %
    %
      [varargout{1:nargout}] = casadiMEX(784, self, varargin{:});
    end
    function varargout = which_depends(self,varargin)
    %WHICH_DEPENDS [INTERNAL] 
    %
    %  [bool] = WHICH_DEPENDS(self, char s_in, {char} s_out, int order, bool tr)
    %
    %Which variables enter with some order.
    %
    %Parameters:
    %-----------
    %
    %order: 
    %Only 1 (linear) and 2 (nonlinear) allowed
    %
    %tr: 
    %Flip the relationship. Return which expressions contain the variables
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1vx
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L483
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L2023-L2030
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(785, self, varargin{:});
    end
    function varargout = print_dimensions(self,varargin)
    %PRINT_DIMENSIONS [INTERNAL] 
    %
    %  std::ostream & = PRINT_DIMENSIONS(self)
    %
    %Print dimensions of inputs and outputs.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1vy
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L490
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L1340-L1342
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(786, self, varargin{:});
    end
    function varargout = print_options(self,varargin)
    %PRINT_OPTIONS [INTERNAL] 
    %
    %  std::ostream & = PRINT_OPTIONS(self)
    %
    %Print options to a stream.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1vz
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L495
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L1344-L1346
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(787, self, varargin{:});
    end
    function varargout = print_option(self,varargin)
    %PRINT_OPTION [INTERNAL] 
    %
    %  std::ostream & = PRINT_OPTION(self, char name)
    %
    %Print all information there is to know about a certain option.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1w0
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L500
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L1348-L1350
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(788, self, varargin{:});
    end
    function varargout = has_option(self,varargin)
    %HAS_OPTION [INTERNAL] 
    %
    %  bool = HAS_OPTION(self, char option_name)
    %
    %Does a particular option exist.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1w1
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L505
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L1352-L1359
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(789, self, varargin{:});
    end
    function varargout = change_option(self,varargin)
    %CHANGE_OPTION [INTERNAL] 
    %
    %  CHANGE_OPTION(self, char option_name, GenericType option_value)
    %
    %Change option after object creation for debugging.
    %
    %This is only possible for a selected number of options that do not 
    %change 
    %the numerical results of the computation, e.g. to enable a more
    % verbose 
    %output or saving to file.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1w2
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L513
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L1361-L1371
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(790, self, varargin{:});
    end
    function varargout = reset_dump_count(self,varargin)
    %RESET_DUMP_COUNT [INTERNAL] 
    %
    %  RESET_DUMP_COUNT(self)
    %
    %Reset the counter used to name dump files.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_2dy
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L518
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L1373-L1379
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(791, self, varargin{:});
    end
    function varargout = uses_output(self,varargin)
    %USES_OUTPUT [INTERNAL] 
    %
    %  bool = USES_OUTPUT(self)
    %
    %Do the derivative functions need nondifferentiated outputs?
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1w3
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L523
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L1035-L1037
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(792, self, varargin{:});
    end
    function varargout = jacobian_old(self,varargin)
    %JACOBIAN_OLD [DEPRECATED] Replaced by  Function::factory.
    %
    %  Function = JACOBIAN_OLD(self, int iind, int oind)
    %
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1w4
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L529
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L1040-L1046
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(793, self, varargin{:});
    end
    function varargout = hessian_old(self,varargin)
    %HESSIAN_OLD [DEPRECATED] Replaced by  Function::factory.
    %
    %  Function = HESSIAN_OLD(self, int iind, int oind)
    %
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1w5
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L534
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L1048-L1056
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(794, self, varargin{:});
    end
    function varargout = sparsity_jac(self,varargin)
    %SPARSITY_JAC [DEPRECATED] Get, if necessary generate, the sparsity of a Jacobian 
    %
    %  Sparsity = SPARSITY_JAC(self, char iind, int oind, bool compact, bool symmetric)
    %  Sparsity = SPARSITY_JAC(self, int iind, int oind, bool compact, bool symmetric)
    %  Sparsity = SPARSITY_JAC(self, int iind, char oind, bool compact, bool symmetric)
    %  Sparsity = SPARSITY_JAC(self, char iind, char oind, bool compact, bool symmetric)
    %
    %block
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L548
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L548-L551
    %
    %
    %
    %.......
    %
    %::
    %
    %  SPARSITY_JAC(self, char iind, int oind, bool compact, bool symmetric)
    %
    %
    %
    %[DEPRECATED] Get, if necessary generate, the sparsity of a Jacobian 
    %block
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L540
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L540-L543
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
    %  SPARSITY_JAC(self, int iind, int oind, bool compact, bool symmetric)
    %
    %
    %
    %[DEPRECATED] Get, if necessary generate, the sparsity of a Jacobian 
    %block
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L538
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L1059-L1065
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
    %  SPARSITY_JAC(self, int iind, char oind, bool compact, bool symmetric)
    %
    %
    %
    %[DEPRECATED] Get, if necessary generate, the sparsity of a Jacobian 
    %block
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L544
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L544-L547
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
    %  SPARSITY_JAC(self, char iind, char oind, bool compact, bool symmetric)
    %
    %
    %
    %[DEPRECATED] Get, if necessary generate, the sparsity of a Jacobian 
    %block
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L548
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L548-L551
    %
    %
    %
    %.............
    %
    %
      [varargout{1:nargout}] = casadiMEX(795, self, varargin{:});
    end
    function varargout = jacobian(self,varargin)
    %JACOBIAN [INTERNAL] 
    %
    %  Function = JACOBIAN(self)
    %
    %Calculate all Jacobian blocks.
    %
    %Generates a function that takes all non-differentiated inputs and 
    %outputs 
    %and calculates all Jacobian blocks. Inputs that are not needed
    % by the 
    %routine are all-zero sparse matrices with the correct 
    %dimensions.  Output 
    %blocks that are not calculated, e.g. if the corresponding input or 
    %output 
    %is marked non-differentiated are also all-zero sparse. The 
    %Jacobian blocks 
    %are sorted starting by all the blocks for the first 
    %output, then all the 
    %blocks for the second output and so on. E.g. f : 
    %(x, y) -> (r, s) results 
    %in the function jac_f : (x, y, out_r, out_s) 
    %-> (jac_r_x, jac_r_y, jac_s_x,
    % jac_s_y)
    %
    %This function is cached.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1w6
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L571
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L1068-L1074
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(796, self, varargin{:});
    end
    function varargout = call(self,varargin)
    %CALL [INTERNAL] 
    %
    %  struct:DM = CALL(self, struct:DM arg, bool always_inline, bool never_inline)
    %  {DM} = CALL(self, {DM} arg, bool always_inline, bool never_inline)
    %  {SX} = CALL(self, {SX} arg, bool always_inline, bool never_inline)
    %  struct:SX = CALL(self, struct:SX arg, bool always_inline, bool never_inline)
    %  struct:MX = CALL(self, struct:MX arg, bool always_inline, bool never_inline)
    %  {MX} = CALL(self, {MX} arg, bool always_inline, bool never_inline)
    %
    %Evaluate the function symbolically or numerically.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1w7
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L587
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L1668-L1675
    %
    %
    %
    %.......
    %
    %::
    %
    %  CALL(self, struct:DM arg, bool always_inline, bool never_inline)
    %
    %
    %
    %[INTERNAL] 
    %Evaluate the function symbolically or numerically.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1w7
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L583
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L1650-L1657
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
    %  CALL(self, {DM} arg, bool always_inline, bool never_inline)
    %
    %
    %
    %[INTERNAL] 
    %Evaluate the function symbolically or numerically.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1w7
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L577
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L509-L516
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
    %  CALL(self, {SX} arg, bool always_inline, bool never_inline)
    %
    %
    %
    %[INTERNAL] 
    %Evaluate the function symbolically or numerically.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1w7
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L579
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L518-L525
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
    %  CALL(self, struct:SX arg, bool always_inline, bool never_inline)
    %
    %
    %
    %[INTERNAL] 
    %Evaluate the function symbolically or numerically.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1w7
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L585
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L1659-L1666
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
    %  CALL(self, struct:MX arg, bool always_inline, bool never_inline)
    %
    %
    %
    %[INTERNAL] 
    %Evaluate the function symbolically or numerically.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1w7
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L587
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L1668-L1675
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
    %  CALL(self, {MX} arg, bool always_inline, bool never_inline)
    %
    %
    %
    %[INTERNAL] 
    %Evaluate the function symbolically or numerically.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1w7
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L581
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L527-L534
    %
    %
    %
    %.............
    %
    %
      [varargout{1:nargout}] = casadiMEX(797, self, varargin{:});
    end
    function varargout = mapsum(self,varargin)
    %MAPSUM [INTERNAL] 
    %
    %  {MX} = MAPSUM(self, {MX} x, char parallelization)
    %
    %Evaluate symbolically in parallel and sum (matrix graph)
    %
    %Parameters:
    %-----------
    %
    %parallelization: 
    %Type of parallelization used: unroll|serial|openmp
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1wh
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L711
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L908-L915
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(798, self, varargin{:});
    end
    function varargout = mapaccum(self,varargin)
    %MAPACCUM [INTERNAL] 
    %
    %  Function = MAPACCUM(self, int N, struct opts)
    %  Function = MAPACCUM(self, char name, int N, struct opts)
    %  Function = MAPACCUM(self, char name, int N, int n_accum, struct opts)
    %  Function = MAPACCUM(self, char name, int n, {char} accum_in, {char} accum_out, struct opts)
    %  Function = MAPACCUM(self, char name, int n, [int] accum_in, [int] accum_out, struct opts)
    %
    %Create a mapaccumulated version of this function.
    %
    %Suppose the function has a signature of:
    %
    %::
    %
    %     f: (x, u) -> (x_next , y )
    %  
    %
    %
    %
    %The the mapaccumulated version has the signature:
    %
    %::
    %
    %     F: (x0, U) -> (X , Y )
    %  
    %      with
    %          U: horzcat([u0, u1, ..., u_(N-1)])
    %          X: horzcat([x1, x2, ..., x_N])
    %          Y: horzcat([y0, y1, ..., y_(N-1)])
    %  
    %      and
    %          x1, y0 <- f(x0, u0)
    %          x2, y1 <- f(x1, u1)
    %          ...
    %          x_N, y_(N-1) <- f(x_(N-1), u_(N-1))
    %  
    %
    %
    %
    %Mapaccum has the following benefits over writing an equivalent for-
    %loop:
    %
    %much faster at construction time
    %
    %potentially much faster compilation times (for codegen)
    %
    %offers a trade-off between memory and evaluation time
    %
    %The base (settable through the options dictionary, default 10), is 
    %used to 
    %create a tower of function calls, containing unrolled for-
    %loops of length 
    %maximum base.
    %
    %This technique is much more scalable in terms of memory-usage, but 
    %slightly
    % slower at evaluation, than a plain for-loop. The effect is 
    %similar to that
    % of a for-loop with a check-pointing instruction after 
    %each chunk of 
    %iterations with size base.
    %
    %Set base to -1 to unroll all the way; no gains in memory efficiency 
    %here.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1wi
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L766
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L668-L670
    %
    %
    %
    %.......
    %
    %::
    %
    %  MAPACCUM(self, int N, struct opts)
    %
    %
    %
    %[INTERNAL] 
    %Create a mapaccumulated version of this function.
    %
    %Suppose the function has a signature of:
    %
    %::
    %
    %     f: (x, u) -> (x_next , y )
    %  
    %
    %
    %
    %The the mapaccumulated version has the signature:
    %
    %::
    %
    %     F: (x0, U) -> (X , Y )
    %  
    %      with
    %          U: horzcat([u0, u1, ..., u_(N-1)])
    %          X: horzcat([x1, x2, ..., x_N])
    %          Y: horzcat([y0, y1, ..., y_(N-1)])
    %  
    %      and
    %          x1, y0 <- f(x0, u0)
    %          x2, y1 <- f(x1, u1)
    %          ...
    %          x_N, y_(N-1) <- f(x_(N-1), u_(N-1))
    %  
    %
    %
    %
    %Mapaccum has the following benefits over writing an equivalent for-
    %loop:
    %
    %much faster at construction time
    %
    %potentially much faster compilation times (for codegen)
    %
    %offers a trade-off between memory and evaluation time
    %
    %The base (settable through the options dictionary, default 10), is 
    %used to 
    %create a tower of function calls, containing unrolled for-
    %loops of length 
    %maximum base.
    %
    %This technique is much more scalable in terms of memory-usage, but 
    %slightly
    % slower at evaluation, than a plain for-loop. The effect is 
    %similar to that
    % of a for-loop with a check-pointing instruction after 
    %each chunk of 
    %iterations with size base.
    %
    %Set base to -1 to unroll all the way; no gains in memory efficiency 
    %here.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1wi
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L766
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L668-L670
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
    %  MAPACCUM(self, char name, int N, struct opts)
    %
    %
    %
    %[INTERNAL] 
    %Create a mapaccumulated version of this function.
    %
    %Suppose the function has a signature of:
    %
    %::
    %
    %     f: (x, u) -> (x_next , y )
    %  
    %
    %
    %
    %The the mapaccumulated version has the signature:
    %
    %::
    %
    %     F: (x0, U) -> (X , Y )
    %  
    %      with
    %          U: horzcat([u0, u1, ..., u_(N-1)])
    %          X: horzcat([x1, x2, ..., x_N])
    %          Y: horzcat([y0, y1, ..., y_(N-1)])
    %  
    %      and
    %          x1, y0 <- f(x0, u0)
    %          x2, y1 <- f(x1, u1)
    %          ...
    %          x_N, y_(N-1) <- f(x_(N-1), u_(N-1))
    %  
    %
    %
    %
    %Mapaccum has the following benefits over writing an equivalent for-
    %loop:
    %
    %much faster at construction time
    %
    %potentially much faster compilation times (for codegen)
    %
    %offers a trade-off between memory and evaluation time
    %
    %The base (settable through the options dictionary, default 10), is 
    %used to 
    %create a tower of function calls, containing unrolled for-
    %loops of length 
    %maximum base.
    %
    %This technique is much more scalable in terms of memory-usage, but 
    %slightly
    % slower at evaluation, than a plain for-loop. The effect is 
    %similar to that
    % of a for-loop with a check-pointing instruction after 
    %each chunk of 
    %iterations with size base.
    %
    %Set base to -1 to unroll all the way; no gains in memory efficiency 
    %here.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1wi
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L755
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L671-L673
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
    %  MAPACCUM(self, char name, int N, int n_accum, struct opts)
    %
    %
    %
    %[INTERNAL] 
    %Create a mapaccumulated version of this function.
    %
    %Suppose the function has a signature of:
    %
    %::
    %
    %     f: (x, u) -> (x_next , y )
    %  
    %
    %
    %
    %The the mapaccumulated version has the signature:
    %
    %::
    %
    %     F: (x0, U) -> (X , Y )
    %  
    %      with
    %          U: horzcat([u0, u1, ..., u_(N-1)])
    %          X: horzcat([x1, x2, ..., x_N])
    %          Y: horzcat([y0, y1, ..., y_(N-1)])
    %  
    %      and
    %          x1, y0 <- f(x0, u0)
    %          x2, y1 <- f(x1, u1)
    %          ...
    %          x_N, y_(N-1) <- f(x_(N-1), u_(N-1))
    %  
    %
    %
    %
    %Mapaccum has the following benefits over writing an equivalent for-
    %loop:
    %
    %much faster at construction time
    %
    %potentially much faster compilation times (for codegen)
    %
    %offers a trade-off between memory and evaluation time
    %
    %The base (settable through the options dictionary, default 10), is 
    %used to 
    %create a tower of function calls, containing unrolled for-
    %loops of length 
    %maximum base.
    %
    %This technique is much more scalable in terms of memory-usage, but 
    %slightly
    % slower at evaluation, than a plain for-loop. The effect is 
    %similar to that
    % of a for-loop with a check-pointing instruction after 
    %each chunk of 
    %iterations with size base.
    %
    %Set base to -1 to unroll all the way; no gains in memory efficiency 
    %here.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1wi
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L756
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L674-L702
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
    %  MAPACCUM(self, char name, int n, {char} accum_in, {char} accum_out, struct opts)
    %
    %
    %
    %[INTERNAL] 
    %Create a mapaccumulated version of this function.
    %
    %Suppose the function has a signature of:
    %
    %::
    %
    %     f: (x, u) -> (x_next , y )
    %  
    %
    %
    %
    %The the mapaccumulated version has the signature:
    %
    %::
    %
    %     F: (x0, U) -> (X , Y )
    %  
    %      with
    %          U: horzcat([u0, u1, ..., u_(N-1)])
    %          X: horzcat([x1, x2, ..., x_N])
    %          Y: horzcat([y0, y1, ..., y_(N-1)])
    %  
    %      and
    %          x1, y0 <- f(x0, u0)
    %          x2, y1 <- f(x1, u1)
    %          ...
    %          x_N, y_(N-1) <- f(x_(N-1), u_(N-1))
    %  
    %
    %
    %
    %Mapaccum has the following benefits over writing an equivalent for-
    %loop:
    %
    %much faster at construction time
    %
    %potentially much faster compilation times (for codegen)
    %
    %offers a trade-off between memory and evaluation time
    %
    %The base (settable through the options dictionary, default 10), is 
    %used to 
    %create a tower of function calls, containing unrolled for-
    %loops of length 
    %maximum base.
    %
    %This technique is much more scalable in terms of memory-usage, but 
    %slightly
    % slower at evaluation, than a plain for-loop. The effect is 
    %similar to that
    % of a for-loop with a check-pointing instruction after 
    %each chunk of 
    %iterations with size base.
    %
    %Set base to -1 to unroll all the way; no gains in memory efficiency 
    %here.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1wi
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L762
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L779-L787
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
    %  MAPACCUM(self, char name, int n, [int] accum_in, [int] accum_out, struct opts)
    %
    %
    %
    %[INTERNAL] 
    %Create a mapaccumulated version of this function.
    %
    %Suppose the function has a signature of:
    %
    %::
    %
    %     f: (x, u) -> (x_next , y )
    %  
    %
    %
    %
    %The the mapaccumulated version has the signature:
    %
    %::
    %
    %     F: (x0, U) -> (X , Y )
    %  
    %      with
    %          U: horzcat([u0, u1, ..., u_(N-1)])
    %          X: horzcat([x1, x2, ..., x_N])
    %          Y: horzcat([y0, y1, ..., y_(N-1)])
    %  
    %      and
    %          x1, y0 <- f(x0, u0)
    %          x2, y1 <- f(x1, u1)
    %          ...
    %          x_N, y_(N-1) <- f(x_(N-1), u_(N-1))
    %  
    %
    %
    %
    %Mapaccum has the following benefits over writing an equivalent for-
    %loop:
    %
    %much faster at construction time
    %
    %potentially much faster compilation times (for codegen)
    %
    %offers a trade-off between memory and evaluation time
    %
    %The base (settable through the options dictionary, default 10), is 
    %used to 
    %create a tower of function calls, containing unrolled for-
    %loops of length 
    %maximum base.
    %
    %This technique is much more scalable in terms of memory-usage, but 
    %slightly
    % slower at evaluation, than a plain for-loop. The effect is 
    %similar to that
    % of a for-loop with a check-pointing instruction after 
    %each chunk of 
    %iterations with size base.
    %
    %Set base to -1 to unroll all the way; no gains in memory efficiency 
    %here.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1wi
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L758
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L749-L777
    %
    %
    %
    %.............
    %
    %
      [varargout{1:nargout}] = casadiMEX(799, self, varargin{:});
    end
    function varargout = fold(self,varargin)
    %FOLD [INTERNAL] 
    %
    %  Function = FOLD(self, int N, struct opts)
    %
    %Create a mapaccumulated version of this function.
    %
    %Suppose the function has a signature of:
    %
    %::
    %
    %     f: (x, u) -> (x_next , y )
    %  
    %
    %
    %
    %The the mapaccumulated version has the signature:
    %
    %::
    %
    %     F: (x0, U) -> (X , Y )
    %  
    %      with
    %          U: horzcat([u0, u1, ..., u_(N-1)])
    %          X: horzcat([x1, x2, ..., x_N])
    %          Y: horzcat([y0, y1, ..., y_(N-1)])
    %  
    %      and
    %          x1, y0 <- f(x0, u0)
    %          x2, y1 <- f(x1, u1)
    %          ...
    %          x_N, y_(N-1) <- f(x_(N-1), u_(N-1))
    %  
    %
    %
    %
    %Mapaccum has the following benefits over writing an equivalent for-
    %loop:
    %
    %much faster at construction time
    %
    %potentially much faster compilation times (for codegen)
    %
    %offers a trade-off between memory and evaluation time
    %
    %The base (settable through the options dictionary, default 10), is 
    %used to 
    %create a tower of function calls, containing unrolled for-
    %loops of length 
    %maximum base.
    %
    %This technique is much more scalable in terms of memory-usage, but 
    %slightly
    % slower at evaluation, than a plain for-loop. The effect is 
    %similar to that
    % of a for-loop with a check-pointing instruction after 
    %each chunk of 
    %iterations with size base.
    %
    %Set base to -1 to unroll all the way; no gains in memory efficiency 
    %here.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1wi
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L767
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L661-L667
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(800, self, varargin{:});
    end
    function varargout = map(self,varargin)
    %MAP [INTERNAL] 
    %
    %  Function = MAP(self, int n, char parallelization)
    %  Function = MAP(self, int n, [bool] reduce_in, [bool] reduce_out, struct opts)
    %  Function = MAP(self, int n, char parallelization, int max_num_threads)
    %  Function = MAP(self, char name, char parallelization, int n, {char} reduce_in, {char} reduce_out, struct opts)
    %  Function = MAP(self, char name, char parallelization, int n, [int] reduce_in, [int] reduce_out, struct opts)
    %
    %Map with reduction.
    %
    %A subset of the inputs are non-repeated and a subset of the outputs 
    %summed 
    %up.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1wk
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L814
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L789-L795
    %
    %
    %
    %.......
    %
    %::
    %
    %  MAP(self, int n, char parallelization)
    %
    %
    %
    %[INTERNAL] 
    %Create a mapped version of this function.
    %
    %Suppose the function has a signature of:
    %
    %::
    %
    %     f: (a, p) -> ( s )
    %  
    %
    %
    %
    %The the mapped version has the signature:
    %
    %::
    %
    %     F: (A, P) -> (S )
    %  
    %      with
    %          A: horzcat([a0, a1, ..., a_(N-1)])
    %          P: horzcat([p0, p1, ..., p_(N-1)])
    %          S: horzcat([s0, s1, ..., s_(N-1)])
    %      and
    %          s0 <- f(a0, p0)
    %          s1 <- f(a1, p1)
    %          ...
    %          s_(N-1) <- f(a_(N-1), p_(N-1))
    %  
    %
    %
    %
    %Parameters:
    %-----------
    %
    %parallelization: 
    %Type of parallelization used: unroll|serial|openmp
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1wj
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L795
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L861-L896
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
    %  MAP(self, int n, [bool] reduce_in, [bool] reduce_out, struct opts)
    %
    %
    %
    %[INTERNAL] 
    %Map with reduction.
    %
    %A subset of the inputs are non-repeated and a subset of the outputs 
    %summed 
    %up.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1wk
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L814
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L789-L795
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
    %  MAP(self, int n, char parallelization, int max_num_threads)
    %
    %
    %
    %[INTERNAL] 
    %
    %.............
    %
    %
    %.......
    %
    %::
    %
    %  MAP(self, char name, char parallelization, int n, {char} reduce_in, {char} reduce_out, struct opts)
    %
    %
    %
    %[INTERNAL] 
    %Map with reduction.
    %
    %A subset of the inputs are non-repeated and a subset of the outputs 
    %summed 
    %up.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1wk
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L810
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L820-L827
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
    %  MAP(self, char name, char parallelization, int n, [int] reduce_in, [int] reduce_out, struct opts)
    %
    %
    %
    %[INTERNAL] 
    %Map with reduction.
    %
    %A subset of the inputs are non-repeated and a subset of the outputs 
    %summed 
    %up.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1wk
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L806
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L797-L818
    %
    %
    %
    %.............
    %
    %
      [varargout{1:nargout}] = casadiMEX(801, self, varargin{:});
    end
    function varargout = slice(self,varargin)
    %SLICE [INTERNAL] 
    %
    %  Function = SLICE(self, char name, [int] order_in, [int] order_out, struct opts)
    %
    %returns a new function with a selection of inputs/outputs of the
    % 
    %original
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1wl
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L823
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L899-L906
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(802, self, varargin{:});
    end
    function varargout = forward(self,varargin)
    %FORWARD [INTERNAL] 
    %
    %  Function = FORWARD(self, int nfwd)
    %
    %Get a function that calculates  nfwd forward derivatives.
    %
    %
    %
    %::
    %
    %     Returns a function with <tt>n_in + n_out + n_in</tt> inputs
    %     and <tt>nfwd</tt> outputs.
    %     The first <tt>n_in</tt> inputs correspond to nondifferentiated inputs.
    %     The next <tt>n_out</tt> inputs correspond to nondifferentiated outputs.
    %     and the last <tt>n_in</tt> inputs correspond to forward seeds,
    %     stacked horizontally
    %     The  <tt>n_out</tt> outputs correspond to forward sensitivities,
    %     stacked horizontally.     *
    %     <tt>(n_in = n_in(), n_out = n_out())</tt>
    %  
    %    The functions returned are cached, meaning that if called multiple timed
    %    with the same value, then multiple references to the same function will be returned.
    %  
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1wq
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L869
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L1324-L1330
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(806, self, varargin{:});
    end
    function varargout = reverse(self,varargin)
    %REVERSE [INTERNAL] 
    %
    %  Function = REVERSE(self, int nadj)
    %
    %Get a function that calculates  nadj adjoint derivatives.
    %
    %
    %
    %::
    %
    %     Returns a function with <tt>n_in + n_out + n_out</tt> inputs
    %     and <tt>n_in</tt> outputs.
    %     The first <tt>n_in</tt> inputs correspond to nondifferentiated inputs.
    %     The next <tt>n_out</tt> inputs correspond to nondifferentiated outputs.
    %     and the last <tt>n_out</tt> inputs correspond to adjoint seeds,
    %     stacked horizontally
    %     The  <tt>n_in</tt> outputs correspond to adjoint sensitivities,
    %     stacked horizontally.     *
    %     <tt>(n_in = n_in(), n_out = n_out())</tt>
    %  
    %     <tt>(n_in = n_in(), n_out = n_out())</tt>
    %  
    %    The functions returned are cached, meaning that if called multiple timed
    %    with the same value, then multiple references to the same function will be returned.
    %  
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1wr
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L889
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L1332-L1338
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(807, self, varargin{:});
    end
    function varargout = jac_sparsity(self,varargin)
    %JAC_SPARSITY [INTERNAL] 
    %
    %  {Sparsity} = JAC_SPARSITY(self, bool compact)
    %  Sparsity = JAC_SPARSITY(self, int oind, int iind, bool compact)
    %
    %Get, if necessary generate, the sparsity of a single Jacobian 
    %block.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1wt
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L899
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L1103-L1111
    %
    %
    %
    %.......
    %
    %::
    %
    %  JAC_SPARSITY(self, bool compact)
    %
    %
    %
    %[INTERNAL] 
    %Get, if necessary generate, the sparsity of all Jacobian blocks.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1ws
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L894
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L1092-L1101
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
    %  JAC_SPARSITY(self, int oind, int iind, bool compact)
    %
    %
    %
    %[INTERNAL] 
    %Get, if necessary generate, the sparsity of a single Jacobian 
    %block.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1wt
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L899
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L1103-L1111
    %
    %
    %
    %.............
    %
    %
      [varargout{1:nargout}] = casadiMEX(808, self, varargin{:});
    end
    function varargout = generate(self,varargin)
    %GENERATE [INTERNAL] 
    %
    %  char = GENERATE(self, struct opts)
    %  char = GENERATE(self, char fname, struct opts)
    %
    %Export / Generate C code for the function.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1wv
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L909
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L1386-L1388
    %
    %
    %
    %.......
    %
    %::
    %
    %  GENERATE(self, struct opts)
    %
    %
    %
    %[INTERNAL] 
    %Export / Generate C code for the function.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1wv
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L909
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L1386-L1388
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
    %  GENERATE(self, char fname, struct opts)
    %
    %
    %
    %[INTERNAL] 
    %Export / Generate C code for the function.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1wu
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L904
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L1390-L1394
    %
    %
    %
    %.............
    %
    %
      [varargout{1:nargout}] = casadiMEX(809, self, varargin{:});
    end
    function varargout = generate_dependencies(self,varargin)
    %GENERATE_DEPENDENCIES [INTERNAL] 
    %
    %  char = GENERATE_DEPENDENCIES(self, char fname, struct opts)
    %
    %Export / Generate C code for the dependency function.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1ww
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L914
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L1396-L1398
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(810, self, varargin{:});
    end
    function varargout = generate_in(self,varargin)
    %GENERATE_IN [INTERNAL] 
    %
    %  {DM} = GENERATE_IN(self, char fname)
    %  GENERATE_IN(self, char fname, {DM} arg)
    %
    %Export an input file that can be passed to generate C code with 
    %a 
    %main.
    %
    %See: 
    % generate_out
    %
    %See: 
    % convert_in to convert between dict/map and vector
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1wx
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L924
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L1430-L1440
    %
    %
    %
    %.......
    %
    %::
    %
    %  GENERATE_IN(self, char fname)
    %
    %
    %
    %[INTERNAL] 
    %Export an input file that can be passed to generate C code with 
    %a 
    %main.
    %
    %See: 
    % generate_out
    %
    %See: 
    % convert_in to convert between dict/map and vector
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1wx
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L924
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L1430-L1440
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
    %  GENERATE_IN(self, char fname, {DM} arg)
    %
    %
    %
    %[INTERNAL] 
    %Export an input file that can be passed to generate C code with 
    %a 
    %main.
    %
    %See: 
    % generate_out
    %
    %See: 
    % convert_in to convert between dict/map and vector
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1wx
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L923
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L1400-L1413
    %
    %
    %
    %.............
    %
    %
      [varargout{1:nargout}] = casadiMEX(811, self, varargin{:});
    end
    function varargout = generate_out(self,varargin)
    %GENERATE_OUT [INTERNAL] 
    %
    %  {DM} = GENERATE_OUT(self, char fname)
    %  GENERATE_OUT(self, char fname, {DM} arg)
    %
    %Export an output file that can be checked with generated C code
    % 
    %output.
    %
    %See: 
    % generate_in
    %
    %See: 
    % convert_out to convert between dict/map and vector
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1wy
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L935
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L1442-L1452
    %
    %
    %
    %.......
    %
    %::
    %
    %  GENERATE_OUT(self, char fname)
    %
    %
    %
    %[INTERNAL] 
    %Export an output file that can be checked with generated C code
    % 
    %output.
    %
    %See: 
    % generate_in
    %
    %See: 
    % convert_out to convert between dict/map and vector
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1wy
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L935
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L1442-L1452
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
    %  GENERATE_OUT(self, char fname, {DM} arg)
    %
    %
    %
    %[INTERNAL] 
    %Export an output file that can be checked with generated C code
    % 
    %output.
    %
    %See: 
    % generate_in
    %
    %See: 
    % convert_out to convert between dict/map and vector
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1wy
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L934
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L1415-L1428
    %
    %
    %
    %.............
    %
    %
      [varargout{1:nargout}] = casadiMEX(812, self, varargin{:});
    end
    function varargout = serialize(self,varargin)
    %SERIALIZE [INTERNAL] 
    %
    %  char = SERIALIZE(self, struct opts)
    %
    %Serialize.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1x2
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L962
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L1471-L1475
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(813, self, varargin{:});
    end
    function varargout = save(self,varargin)
    %SAVE [INTERNAL] 
    %
    %  SAVE(self, char fname, struct opts)
    %
    %Save  Function to a file.
    %
    %See: 
    % load
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_240
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L969
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L1466-L1469
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(814, self, varargin{:});
    end
    function varargout = export_code(self,varargin)
    %EXPORT_CODE [INTERNAL] 
    %
    %  char = EXPORT_CODE(self, char lang, struct options)
    %  EXPORT_CODE(self, char lang, char fname, struct options)
    %
    %Export function in specific language.
    %
    %Only allowed for (a subset of) SX/MX Functions
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1wz
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L971
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L1498-L1502
    %
    %
    %
    %.......
    %
    %::
    %
    %  EXPORT_CODE(self, char lang, struct options)
    %
    %
    %
    %[INTERNAL] 
    %Export function in specific language.
    %
    %Only allowed for (a subset of) SX/MX Functions
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1wz
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L971
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L1498-L1502
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
    %  EXPORT_CODE(self, char lang, char fname, struct options)
    %
    %
    %
    %[INTERNAL] 
    %Export function in specific language.
    %
    %Only allowed for (a subset of) SX/MX Functions
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1wz
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L944
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L1459-L1463
    %
    %
    %
    %.............
    %
    %
      [varargout{1:nargout}] = casadiMEX(815, self, varargin{:});
    end
    function varargout = stats(self,varargin)
    %STATS [INTERNAL] 
    %
    %  struct = STATS(self, int mem)
    %
    %Get all statistics obtained at the end of the last evaluate 
    %call.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L1001
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L1080-L1090
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(816, self, varargin{:});
    end
    function varargout = sx_in(self,varargin)
    %SX_IN [INTERNAL] 
    %
    %  {SX} = SX_IN(self)
    %  SX = SX_IN(self, int iind)
    %  SX = SX_IN(self, char iname)
    %
    %Get symbolic primitives equivalent to the input expressions.
    %
    %There is no guarantee that subsequent calls return unique answers
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1x4
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L1013
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L1765-L1771
    %
    %
    %
    %.......
    %
    %::
    %
    %  SX_IN(self)
    %
    %
    %
    %[INTERNAL] 
    %Get symbolic primitives equivalent to the input expressions.
    %
    %There is no guarantee that subsequent calls return unique answers
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1x4
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L1013
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L1765-L1771
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
    %  SX_IN(self, int iind)
    %
    %
    %
    %[INTERNAL] 
    %Get symbolic primitives equivalent to the input expressions.
    %
    %There is no guarantee that subsequent calls return unique answers
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1x4
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L1009
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L1749-L1755
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
    %  SX_IN(self, char iname)
    %
    %
    %
    %[INTERNAL] 
    %Get symbolic primitives equivalent to the input expressions.
    %
    %There is no guarantee that subsequent calls return unique answers
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1x4
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L1010
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L1010-L1012
    %
    %
    %
    %.............
    %
    %
      [varargout{1:nargout}] = casadiMEX(817, self, varargin{:});
    end
    function varargout = mx_in(self,varargin)
    %MX_IN [INTERNAL] 
    %
    %  {MX} = MX_IN(self)
    %  MX = MX_IN(self, int ind)
    %  MX = MX_IN(self, char iname)
    %
    %Get symbolic primitives equivalent to the input expressions.
    %
    %There is no guarantee that subsequent calls return unique answers
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1x4
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L1018
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L1789-L1791
    %
    %
    %
    %.......
    %
    %::
    %
    %  MX_IN(self)
    %
    %
    %
    %[INTERNAL] 
    %Get symbolic primitives equivalent to the input expressions.
    %
    %There is no guarantee that subsequent calls return unique answers
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1x4
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L1018
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L1789-L1791
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
    %  MX_IN(self, int ind)
    %
    %
    %
    %[INTERNAL] 
    %Get symbolic primitives equivalent to the input expressions.
    %
    %There is no guarantee that subsequent calls return unique answers
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1x4
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L1014
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L1781-L1783
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
    %  MX_IN(self, char iname)
    %
    %
    %
    %[INTERNAL] 
    %Get symbolic primitives equivalent to the input expressions.
    %
    %There is no guarantee that subsequent calls return unique answers
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1x4
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L1015
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L1015-L1017
    %
    %
    %
    %.............
    %
    %
      [varargout{1:nargout}] = casadiMEX(818, self, varargin{:});
    end
    function varargout = sx_out(self,varargin)
    %SX_OUT [INTERNAL] 
    %
    %  {SX} = SX_OUT(self)
    %  SX = SX_OUT(self, int oind)
    %  SX = SX_OUT(self, char oname)
    %
    %Get symbolic primitives equivalent to the output expressions.
    %
    %There is no guarantee that subsequent calls return unique answers
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1x5
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L1041
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L1773-L1779
    %
    %
    %
    %.......
    %
    %::
    %
    %  SX_OUT(self)
    %
    %
    %
    %[INTERNAL] 
    %Get symbolic primitives equivalent to the output expressions.
    %
    %There is no guarantee that subsequent calls return unique answers
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1x5
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L1041
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L1773-L1779
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
    %  SX_OUT(self, int oind)
    %
    %
    %
    %[INTERNAL] 
    %Get symbolic primitives equivalent to the output expressions.
    %
    %There is no guarantee that subsequent calls return unique answers
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1x5
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L1037
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L1757-L1763
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
    %  SX_OUT(self, char oname)
    %
    %
    %
    %[INTERNAL] 
    %Get symbolic primitives equivalent to the output expressions.
    %
    %There is no guarantee that subsequent calls return unique answers
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1x5
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L1038
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L1038-L1040
    %
    %
    %
    %.............
    %
    %
      [varargout{1:nargout}] = casadiMEX(819, self, varargin{:});
    end
    function varargout = mx_out(self,varargin)
    %MX_OUT [INTERNAL] 
    %
    %  {MX} = MX_OUT(self)
    %  MX = MX_OUT(self, int ind)
    %  MX = MX_OUT(self, char oname)
    %
    %Get symbolic primitives equivalent to the output expressions.
    %
    %There is no guarantee that subsequent calls return unique answers
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1x5
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L1046
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L1793-L1795
    %
    %
    %
    %.......
    %
    %::
    %
    %  MX_OUT(self)
    %
    %
    %
    %[INTERNAL] 
    %Get symbolic primitives equivalent to the output expressions.
    %
    %There is no guarantee that subsequent calls return unique answers
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1x5
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L1046
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L1793-L1795
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
    %  MX_OUT(self, int ind)
    %
    %
    %
    %[INTERNAL] 
    %Get symbolic primitives equivalent to the output expressions.
    %
    %There is no guarantee that subsequent calls return unique answers
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1x5
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L1042
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L1785-L1787
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
    %  MX_OUT(self, char oname)
    %
    %
    %
    %[INTERNAL] 
    %Get symbolic primitives equivalent to the output expressions.
    %
    %There is no guarantee that subsequent calls return unique answers
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1x5
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L1043
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L1043-L1045
    %
    %
    %
    %.............
    %
    %
      [varargout{1:nargout}] = casadiMEX(820, self, varargin{:});
    end
    function varargout = nz_from_in(self,varargin)
    %NZ_FROM_IN [INTERNAL] 
    %
    %  [double] = NZ_FROM_IN(self, {DM} arg)
    %
    %Convert from/to flat vector of input/output nonzeros.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1x6
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L1053
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L1797-L1799
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(821, self, varargin{:});
    end
    function varargout = nz_from_out(self,varargin)
    %NZ_FROM_OUT [INTERNAL] 
    %
    %  [double] = NZ_FROM_OUT(self, {DM} arg)
    %
    %Convert from/to flat vector of input/output nonzeros.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1x6
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L1054
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L1801-L1803
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(822, self, varargin{:});
    end
    function varargout = nz_to_in(self,varargin)
    %NZ_TO_IN [INTERNAL] 
    %
    %  {DM} = NZ_TO_IN(self, [double] arg)
    %
    %Convert from/to flat vector of input/output nonzeros.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1x6
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L1055
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L1805-L1807
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(823, self, varargin{:});
    end
    function varargout = nz_to_out(self,varargin)
    %NZ_TO_OUT [INTERNAL] 
    %
    %  {DM} = NZ_TO_OUT(self, [double] arg)
    %
    %Convert from/to flat vector of input/output nonzeros.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1x6
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L1056
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L1809-L1811
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(824, self, varargin{:});
    end
    function varargout = convert_in(self,varargin)
    %CONVERT_IN [INTERNAL] 
    %
    %  {DM} = CONVERT_IN(self, struct:DM arg)
    %  struct:DM = CONVERT_IN(self, {DM} arg)
    %  struct:SX = CONVERT_IN(self, {SX} arg)
    %  {SX} = CONVERT_IN(self, struct:SX arg)
    %  {MX} = CONVERT_IN(self, struct:MX arg)
    %  struct:MX = CONVERT_IN(self, {MX} arg)
    %
    %Convert from/to input/output lists/map.
    %
    %Will raise an error when an unknown key is used or a list has 
    %incorrect 
    %size. Does not perform sparsity checking.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1x7
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L1075
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L1849-L1851
    %
    %
    %
    %.......
    %
    %::
    %
    %  CONVERT_IN(self, struct:DM arg)
    %
    %
    %
    %[INTERNAL] 
    %Convert from/to input/output lists/map.
    %
    %Will raise an error when an unknown key is used or a list has 
    %incorrect 
    %size. Does not perform sparsity checking.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1x7
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L1067
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L1817-L1819
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
    %  CONVERT_IN(self, {DM} arg)
    %
    %
    %
    %[INTERNAL] 
    %Convert from/to input/output lists/map.
    %
    %Will raise an error when an unknown key is used or a list has 
    %incorrect 
    %size. Does not perform sparsity checking.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1x7
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L1066
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L1813-L1815
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
    %  CONVERT_IN(self, {SX} arg)
    %
    %
    %
    %[INTERNAL] 
    %Convert from/to input/output lists/map.
    %
    %Will raise an error when an unknown key is used or a list has 
    %incorrect 
    %size. Does not perform sparsity checking.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1x7
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L1070
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L1829-L1831
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
    %  CONVERT_IN(self, struct:SX arg)
    %
    %
    %
    %[INTERNAL] 
    %Convert from/to input/output lists/map.
    %
    %Will raise an error when an unknown key is used or a list has 
    %incorrect 
    %size. Does not perform sparsity checking.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1x7
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L1071
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L1833-L1835
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
    %  CONVERT_IN(self, struct:MX arg)
    %
    %
    %
    %[INTERNAL] 
    %Convert from/to input/output lists/map.
    %
    %Will raise an error when an unknown key is used or a list has 
    %incorrect 
    %size. Does not perform sparsity checking.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1x7
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L1075
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L1849-L1851
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
    %  CONVERT_IN(self, {MX} arg)
    %
    %
    %
    %[INTERNAL] 
    %Convert from/to input/output lists/map.
    %
    %Will raise an error when an unknown key is used or a list has 
    %incorrect 
    %size. Does not perform sparsity checking.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1x7
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L1074
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L1845-L1847
    %
    %
    %
    %.............
    %
    %
      [varargout{1:nargout}] = casadiMEX(825, self, varargin{:});
    end
    function varargout = convert_out(self,varargin)
    %CONVERT_OUT [INTERNAL] 
    %
    %  {DM} = CONVERT_OUT(self, struct:DM arg)
    %  struct:DM = CONVERT_OUT(self, {DM} arg)
    %  struct:SX = CONVERT_OUT(self, {SX} arg)
    %  {SX} = CONVERT_OUT(self, struct:SX arg)
    %  {MX} = CONVERT_OUT(self, struct:MX arg)
    %  struct:MX = CONVERT_OUT(self, {MX} arg)
    %
    %Convert from/to input/output lists/map.
    %
    %Will raise an error when an unknown key is used or a list has 
    %incorrect 
    %size. Does not perform sparsity checking.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1x7
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L1077
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L1857-L1859
    %
    %
    %
    %.......
    %
    %::
    %
    %  CONVERT_OUT(self, struct:DM arg)
    %
    %
    %
    %[INTERNAL] 
    %Convert from/to input/output lists/map.
    %
    %Will raise an error when an unknown key is used or a list has 
    %incorrect 
    %size. Does not perform sparsity checking.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1x7
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L1069
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L1825-L1827
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
    %  CONVERT_OUT(self, {DM} arg)
    %
    %
    %
    %[INTERNAL] 
    %Convert from/to input/output lists/map.
    %
    %Will raise an error when an unknown key is used or a list has 
    %incorrect 
    %size. Does not perform sparsity checking.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1x7
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L1068
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L1821-L1823
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
    %  CONVERT_OUT(self, {SX} arg)
    %
    %
    %
    %[INTERNAL] 
    %Convert from/to input/output lists/map.
    %
    %Will raise an error when an unknown key is used or a list has 
    %incorrect 
    %size. Does not perform sparsity checking.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1x7
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L1072
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L1837-L1839
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
    %  CONVERT_OUT(self, struct:SX arg)
    %
    %
    %
    %[INTERNAL] 
    %Convert from/to input/output lists/map.
    %
    %Will raise an error when an unknown key is used or a list has 
    %incorrect 
    %size. Does not perform sparsity checking.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1x7
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L1073
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L1841-L1843
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
    %  CONVERT_OUT(self, struct:MX arg)
    %
    %
    %
    %[INTERNAL] 
    %Convert from/to input/output lists/map.
    %
    %Will raise an error when an unknown key is used or a list has 
    %incorrect 
    %size. Does not perform sparsity checking.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1x7
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L1077
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L1857-L1859
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
    %  CONVERT_OUT(self, {MX} arg)
    %
    %
    %
    %[INTERNAL] 
    %Convert from/to input/output lists/map.
    %
    %Will raise an error when an unknown key is used or a list has 
    %incorrect 
    %size. Does not perform sparsity checking.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1x7
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L1076
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L1853-L1855
    %
    %
    %
    %.............
    %
    %
      [varargout{1:nargout}] = casadiMEX(826, self, varargin{:});
    end
    function varargout = has_free(self,varargin)
    %HAS_FREE [INTERNAL] 
    %
    %  bool = HAS_FREE(self)
    %
    %Does the function have free variables.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1x8
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L1083
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L1894-L1896
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(827, self, varargin{:});
    end
    function varargout = get_free(self,varargin)
    %GET_FREE [INTERNAL] 
    %
    %  {char} = GET_FREE(self)
    %
    %Get free variables as a string.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1x9
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L1088
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L1382-L1384
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(828, self, varargin{:});
    end
    function varargout = free_sx(self,varargin)
    %FREE_SX [INTERNAL] 
    %
    %  {SX} = FREE_SX(self)
    %
    %Get all the free variables of the function.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1xa
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L1093
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L1870-L1876
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(829, self, varargin{:});
    end
    function varargout = free_mx(self,varargin)
    %FREE_MX [INTERNAL] 
    %
    %  {MX} = FREE_MX(self)
    %
    %Get all the free variables of the function.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1xb
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L1098
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L1878-L1884
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(830, self, varargin{:});
    end
    function varargout = generate_lifted(self,varargin)
    %GENERATE_LIFTED [INTERNAL] 
    %
    %  [Function OUTPUT, Function OUTPUT] = GENERATE_LIFTED(self)
    %
    %Extract the functions needed for the Lifted  Newton method.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1xc
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L1103
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L1898-L1904
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(831, self, varargin{:});
    end
    function varargout = n_nodes(self,varargin)
    %N_NODES [INTERNAL] 
    %
    %  int = N_NODES(self)
    %
    %Number of nodes in the algorithm.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1xd
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L1109
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L1962-L1968
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(832, self, varargin{:});
    end
    function varargout = n_instructions(self,varargin)
    %N_INSTRUCTIONS [INTERNAL] 
    %
    %  int = N_INSTRUCTIONS(self)
    %
    %Number of instruction in the algorithm (SXFunction/MXFunction)
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1xe
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L1114
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L1906-L1912
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(833, self, varargin{:});
    end
    function varargout = instruction_id(self,varargin)
    %INSTRUCTION_ID [INTERNAL] 
    %
    %  int = INSTRUCTION_ID(self, int k)
    %
    %Identifier index of the instruction (SXFunction/MXFunction)
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1xf
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L1119
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L1930-L1936
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(834, self, varargin{:});
    end
    function varargout = instruction_input(self,varargin)
    %INSTRUCTION_INPUT [INTERNAL] 
    %
    %  [int] = INSTRUCTION_INPUT(self, int k)
    %
    %Locations in the work vector for the inputs of the instruction.
    %
    %(SXFunction/MXFunction)
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1xg
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L1126
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L1938-L1944
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(835, self, varargin{:});
    end
    function varargout = instruction_constant(self,varargin)
    %INSTRUCTION_CONSTANT [INTERNAL] 
    %
    %  double = INSTRUCTION_CONSTANT(self, int k)
    %
    %Get the floating point output argument of an instruction 
    %(SXFunction)
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1xh
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L1131
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L1946-L1952
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(836, self, varargin{:});
    end
    function varargout = instruction_output(self,varargin)
    %INSTRUCTION_OUTPUT [INTERNAL] 
    %
    %  [int] = INSTRUCTION_OUTPUT(self, int k)
    %
    %Location in the work vector for the output of the instruction.
    %
    %(SXFunction/MXFunction)
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1xi
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L1138
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L1954-L1960
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(837, self, varargin{:});
    end
    function varargout = instruction_MX(self,varargin)
    %INSTRUCTION_MX [INTERNAL] 
    %
    %  MX = INSTRUCTION_MX(self, int k)
    %
    %Get the  MX node corresponding to an instruction (MXFunction)
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1xj
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L1143
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L1914-L1920
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(838, self, varargin{:});
    end
    function varargout = instructions_sx(self,varargin)
    %INSTRUCTIONS_SX [INTERNAL] 
    %
    %  SX = INSTRUCTIONS_SX(self)
    %
    %Get the SX node corresponding to all instructions (SXFunction)
    %
    %Note: input and output instructions have no SX representation. This 
    %method 
    %returns nan for those instructions.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1xk
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L1151
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L1922-L1928
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(839, self, varargin{:});
    end
    function varargout = has_spfwd(self,varargin)
    %HAS_SPFWD [INTERNAL] 
    %
    %  bool = HAS_SPFWD(self)
    %
    %Is the class able to propagate seeds through the algorithm?
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1xl
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L1157
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L1886-L1888
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(840, self, varargin{:});
    end
    function varargout = has_sprev(self,varargin)
    %HAS_SPREV [INTERNAL] 
    %
    %  bool = HAS_SPREV(self)
    %
    %Is the class able to propagate seeds through the algorithm?
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1xl
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L1158
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L1890-L1892
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(841, self, varargin{:});
    end
    function varargout = sz_arg(self,varargin)
    %SZ_ARG [INTERNAL] 
    %
    %  size_t = SZ_ARG(self)
    %
    %Get required length of arg field.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1xm
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L1164
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L1235-L1235
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(842, self, varargin{:});
    end
    function varargout = sz_res(self,varargin)
    %SZ_RES [INTERNAL] 
    %
    %  size_t = SZ_RES(self)
    %
    %Get required length of res field.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1xn
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L1169
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L1237-L1237
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(843, self, varargin{:});
    end
    function varargout = sz_iw(self,varargin)
    %SZ_IW [INTERNAL] 
    %
    %  size_t = SZ_IW(self)
    %
    %Get required length of iw field.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1xo
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L1174
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L1239-L1239
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(844, self, varargin{:});
    end
    function varargout = sz_w(self,varargin)
    %SZ_W [INTERNAL] 
    %
    %  size_t = SZ_W(self)
    %
    %Get required length of w field.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1xp
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L1179
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L1241-L1241
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(845, self, varargin{:});
    end
    function varargout = name(self,varargin)
    %NAME [INTERNAL] 
    %
    %  char = NAME(self)
    %
    %Name of the function.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1xv
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L1222
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L1504-L1511
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(846, self, varargin{:});
    end
    function varargout = is_a(self,varargin)
    %IS_A [INTERNAL] 
    %
    %  bool = IS_A(self, char type, bool recursive)
    %
    %Check if the function is of a particular type.
    %
    %Optionally check if name matches one of the base classes (default 
    %true)
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1xw
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L1229
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L1861-L1863
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(847, self, varargin{:});
    end
    function varargout = assert_size_in(self,varargin)
    %ASSERT_SIZE_IN [INTERNAL] 
    %
    %  ASSERT_SIZE_IN(self, int i, int nrow, int ncol)
    %
    %Assert that an input dimension is equal so some given value.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L1274
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L1982-L1988
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(852, self, varargin{:});
    end
    function varargout = assert_size_out(self,varargin)
    %ASSERT_SIZE_OUT [INTERNAL] 
    %
    %  ASSERT_SIZE_OUT(self, int i, int nrow, int ncol)
    %
    %Assert that an output dimension is equal so some given value.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L1277
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L1990-L1995
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(853, self, varargin{:});
    end
    function varargout = assert_sparsity_out(self,varargin)
    %ASSERT_SPARSITY_OUT [INTERNAL] 
    %
    %  ASSERT_SPARSITY_OUT(self, int i, Sparsity sp, int n, bool allow_all_zero_sparse)
    %
    %Assert that an output sparsity is a multiple of some given 
    %sparsity.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L1280
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L1997-L2006
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(854, self, varargin{:});
    end
    function varargout = checkout(self,varargin)
    %CHECKOUT [INTERNAL] 
    %
    %  int = CHECKOUT(self)
    %
    %Checkout a memory object.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L1284
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L1970-L1972
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(855, self, varargin{:});
    end
    function varargout = release(self,varargin)
    %RELEASE [INTERNAL] 
    %
    %  RELEASE(self, int mem)
    %
    %Release a memory object.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L1287
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L1974-L1976
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(856, self, varargin{:});
    end
    function varargout = cache(self,varargin)
    %CACHE [INTERNAL] 
    %
    %  struct = CACHE(self)
    %
    %Get all functions in the cache.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_26i
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L1300
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L2032-L2039
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(857, self, varargin{:});
    end
    function varargout = get_function(self,varargin)
    %GET_FUNCTION [INTERNAL] 
    %
    %  {char} = GET_FUNCTION(self)
    %  Function = GET_FUNCTION(self, char name)
    %
    %Get a dependency function.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1y4
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L1310
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L2050-L2056
    %
    %
    %
    %.......
    %
    %::
    %
    %  GET_FUNCTION(self)
    %
    %
    %
    %[INTERNAL] 
    %Get a list of all functions.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1y3
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L1305
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L2041-L2048
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
    %  GET_FUNCTION(self, char name)
    %
    %
    %
    %[INTERNAL] 
    %Get a dependency function.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1y4
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L1310
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L2050-L2056
    %
    %
    %
    %.............
    %
    %
      [varargout{1:nargout}] = casadiMEX(858, self, varargin{:});
    end
    function varargout = has_function(self,varargin)
    %HAS_FUNCTION [INTERNAL] 
    %
    %  bool = HAS_FUNCTION(self, char fname)
    %
    %Check if a particular dependency exists.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1y5
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L1315
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L2058-L2065
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(859, self, varargin{:});
    end
    function varargout = find_functions(self,varargin)
    %FIND_FUNCTIONS [INTERNAL] 
    %
    %  {Function} = FIND_FUNCTIONS(self, int max_depth)
    %
    %Get all functions embedded in the expression graphs.
    %
    %Parameters:
    %-----------
    %
    %max_depth: 
    %Maximum depth - a negative number indicates no maximum
    %
    %depth-first ordered, unique, list of dependencies
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1y6
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L1323
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L2067-L2082
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(860, self, varargin{:});
    end
    function varargout = find_function(self,varargin)
    %FIND_FUNCTION [INTERNAL] 
    %
    %  Function = FIND_FUNCTION(self, char name, int max_depth)
    %
    %Get a specific function embedded in the expression graphs.
    %
    %Parameters:
    %-----------
    %
    %name: 
    %Name of function needed
    %
    %max_depth: 
    %Maximum depth - a negative number indicates no maximum
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1y7
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L1331
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L2084-L2101
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(861, self, varargin{:});
    end
    function varargout = info(self,varargin)
    %INFO [INTERNAL] 
    %
    %  struct = INFO(self)
    %
    %Obtain information about function
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L1334
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L2138-L2140
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(862, self, varargin{:});
    end

     function s = saveobj(obj)
        try
            s.serialization = obj.serialize();
        catch exception
            warning(['Serializing of CasADi Function failed:' getReport(exception) ]);
            s = struct;
        end
     end
  
    function varargout = subsref(self,s)
      if numel(s)==1 && strcmp(s.type,'()')
        [varargout{1:nargout}]= paren(self, s.subs{:});
      else
        [varargout{1:nargout}] = builtin('subsref',self,s);
      end
   end
   function varargout = paren(self, varargin)
      if nargin==1 || (nargin>=2 && ischar(varargin{1}))
        % Named inputs: return struct
        assert(nargout<2, 'Syntax error');
        assert(mod(nargin,2)==1, 'Syntax error');
        arg = struct;
        for i=1:2:nargin-1
          assert(ischar(varargin{i}), 'Syntax error');
          arg.(varargin{i}) = varargin{i+1};
        end
        res = self.call(arg);
        varargout{1} = res;
      else
        % Ordered inputs: return variable number of outputs
        res = self.call(varargin);
        assert(nargout<=numel(res), 'Too many outputs');
        for i=1:max(min(1,numel(res)),nargout)
          varargout{i} = res{i};
        end
      end
    end
      function self = Function(varargin)
    %FUNCTION 
    %
    %  new_obj = FUNCTION()
    %  new_obj = FUNCTION(char fname)
    %  new_obj = FUNCTION(char name, {SX} ex_in, {SX} ex_out, struct opts)
    %  new_obj = FUNCTION(char name, {MX} ex_in, {MX} ex_out, struct opts)
    %  new_obj = FUNCTION(char name, struct:SX dict, {char} name_in, {char} name_out, struct opts)
    %  new_obj = FUNCTION(char name, struct:MX dict, {char} name_in, {char} name_out, struct opts)
    %  new_obj = FUNCTION(char name, {SX} ex_in, {SX} ex_out, {char} name_in, {char} name_out, struct opts)
    %  new_obj = FUNCTION(char name, {MX} ex_in, {MX} ex_out, {char} name_in, {char} name_out, struct opts)
    %
    %
    %.......
    %
    %::
    %
    %  FUNCTION()
    %
    %
    %
    %[INTERNAL] 
    %Default constructor, null pointer.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1uy
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L70
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L58-L59
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
    %  FUNCTION(char fname)
    %
    %
    %
    %[INTERNAL] 
    %Construct from a file.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1uz
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L75
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L92-L94
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
    %  FUNCTION(char name, {SX} ex_in, {SX} ex_out, struct opts)
    %
    %
    %
    %[INTERNAL] 
    %Construct an SX function.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1v0
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L81
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L96-L100
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
    %  FUNCTION(char name, {MX} ex_in, {MX} ex_out, struct opts)
    %
    %
    %
    %[INTERNAL] 
    %Construct an  MX function.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1v1
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L101
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L110-L114
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
    %  FUNCTION(char name, struct:SX dict, {char} name_in, {char} name_out, struct opts)
    %
    %
    %
    %[INTERNAL] 
    %Construct an SX function.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1v0
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L91
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L183-L187
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
    %  FUNCTION(char name, struct:MX dict, {char} name_in, {char} name_out, struct opts)
    %
    %
    %
    %[INTERNAL] 
    %Construct an  MX function.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1v1
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L111
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L189-L193
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
    %  FUNCTION(char name, {SX} ex_in, {SX} ex_out, {char} name_in, {char} name_out, struct opts)
    %
    %
    %
    %[INTERNAL] 
    %Construct an SX function.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1v0
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L85
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L102-L108
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
    %  FUNCTION(char name, {MX} ex_in, {MX} ex_out, {char} name_in, {char} name_out, struct opts)
    %
    %
    %
    %[INTERNAL] 
    %Construct an  MX function.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1v1
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L105
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L116-L122
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
        tmp = casadiMEX(863, varargin{:});
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
     [varargout{1:nargout}] = casadiMEX(748, varargin{:});
    end
    function varargout = jit(varargin)
    %JIT [INTERNAL] 
    %
    %  Function = JIT(char name, char body, {char} name_in, {char} name_out, struct opts)
    %  Function = JIT(char name, char body, {char} name_in, {char} name_out, {Sparsity} sparsity_in, {Sparsity} sparsity_out, struct opts)
    %
    %Create a just-in-time compiled function from a C language 
    %string.
    %
    %The names and sparsity patterns of all the inputs and outputs must be 
    %
    %provided. If sparsities are not provided, all inputs and outputs are 
    %
    %assumed to be scalar. Only specify the function body, assuming that 
    %input 
    %and output nonzeros are stored in arrays with the specified 
    %naming 
    %convension. The data type used is 'casadi_real', which is 
    %typically equal 
    %to 'double or another data type with the same API as 'double.
    %
    %Inputs may be null pointers. This means that the all entries are zero.
    % 
    %Outputs may be null points. This means that the corresponding result 
    %can be
    % ignored.
    %
    %If an error occurs in the evaluation, issue "return 1;";
    %
    %The final generated function will have a structure similar to:
    %
    %casadi_int fname(const casadi_real** arg, casadi_real** res, 
    %casadi_int* 
    %iw, casadi_real* w, void* mem) { const casadi_real *x1, 
    %*x2; casadi_real 
    %*r1, *r2; x1 = *arg++; x2 = *arg++; r1 = *res++; r2 =
    % *res++; 
    %<FUNCTION_BODY> return 0; }
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1v3
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L189
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L298-L310
    %
    %
    %
    %.......
    %
    %::
    %
    %  JIT(char name, char body, {char} name_in, {char} name_out, struct opts)
    %
    %
    %
    %[INTERNAL] 
    %Create a just-in-time compiled function from a C language 
    %string.
    %
    %The names and sparsity patterns of all the inputs and outputs must be 
    %
    %provided. If sparsities are not provided, all inputs and outputs are 
    %
    %assumed to be scalar. Only specify the function body, assuming that 
    %input 
    %and output nonzeros are stored in arrays with the specified 
    %naming 
    %convension. The data type used is 'casadi_real', which is 
    %typically equal 
    %to 'double or another data type with the same API as 'double.
    %
    %Inputs may be null pointers. This means that the all entries are zero.
    % 
    %Outputs may be null points. This means that the corresponding result 
    %can be
    % ignored.
    %
    %If an error occurs in the evaluation, issue "return 1;";
    %
    %The final generated function will have a structure similar to:
    %
    %casadi_int fname(const casadi_real** arg, casadi_real** res, 
    %casadi_int* 
    %iw, casadi_real* w, void* mem) { const casadi_real *x1, 
    %*x2; casadi_real 
    %*r1, *r2; x1 = *arg++; x2 = *arg++; r1 = *res++; r2 =
    % *res++; 
    %<FUNCTION_BODY> return 0; }
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1v3
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L185
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L289-L296
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
    %  JIT(char name, char body, {char} name_in, {char} name_out, {Sparsity} sparsity_in, {Sparsity} sparsity_out, struct opts)
    %
    %
    %
    %[INTERNAL] 
    %Create a just-in-time compiled function from a C language 
    %string.
    %
    %The names and sparsity patterns of all the inputs and outputs must be 
    %
    %provided. If sparsities are not provided, all inputs and outputs are 
    %
    %assumed to be scalar. Only specify the function body, assuming that 
    %input 
    %and output nonzeros are stored in arrays with the specified 
    %naming 
    %convension. The data type used is 'casadi_real', which is 
    %typically equal 
    %to 'double or another data type with the same API as 'double.
    %
    %Inputs may be null pointers. This means that the all entries are zero.
    % 
    %Outputs may be null points. This means that the corresponding result 
    %can be
    % ignored.
    %
    %If an error occurs in the evaluation, issue "return 1;";
    %
    %The final generated function will have a structure similar to:
    %
    %casadi_int fname(const casadi_real** arg, casadi_real** res, 
    %casadi_int* 
    %iw, casadi_real* w, void* mem) { const casadi_real *x1, 
    %*x2; casadi_real 
    %*r1, *r2; x1 = *arg++; x2 = *arg++; r1 = *res++; r2 =
    % *res++; 
    %<FUNCTION_BODY> return 0; }
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1v3
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.hpp#L189
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/function.cpp#L298-L310
    %
    %
    %
    %.............
    %
    %
     [varargout{1:nargout}] = casadiMEX(749, varargin{:});
    end
    function varargout = conditional(varargin)
    %CONDITIONAL 
    %
    %  Function = CONDITIONAL(char name, Function f, struct opts)
    %  Function = CONDITIONAL(char name, {Function} f, Function f_def, struct opts)
    %
    %
     [varargout{1:nargout}] = casadiMEX(803, varargin{:});
    end
    function varargout = bspline(varargin)
    %BSPLINE 
    %
    %  Function = BSPLINE(char name, {[double]} knots, [double] coeffs, [int] degree, int m, struct opts)
    %
    %
     [varargout{1:nargout}] = casadiMEX(804, varargin{:});
    end
    function varargout = if_else(varargin)
    %IF_ELSE 
    %
    %  Function = IF_ELSE(char name, Function f_true, Function f_false, struct opts)
    %
    %
     [varargout{1:nargout}] = casadiMEX(805, varargin{:});
    end
    function varargout = check_name(varargin)
    %CHECK_NAME 
    %
    %  bool = CHECK_NAME(char name)
    %
    %
     [varargout{1:nargout}] = casadiMEX(848, varargin{:});
    end
    function varargout = fix_name(varargin)
    %FIX_NAME 
    %
    %  char = FIX_NAME(char name)
    %
    %
     [varargout{1:nargout}] = casadiMEX(849, varargin{:});
    end
    function varargout = load(varargin)
    %LOAD 
    %
    %  Function = LOAD(char filename)
    %
    %
     [varargout{1:nargout}] = casadiMEX(850, varargin{:});
    end
    function varargout = deserialize(varargin)
    %DESERIALIZE 
    %
    %  Function = DESERIALIZE(std::istream & stream)
    %  Function = DESERIALIZE(casadi::DeserializingStream & s)
    %  Function = DESERIALIZE(char s)
    %
    %
     [varargout{1:nargout}] = casadiMEX(851, varargin{:});
    end

     function obj = loadobj(s)
        try
          if isstruct(s)
             obj = casadi.Function.deserialize(s.serialization);
          else
             obj = s;
          end
        catch exception
            warning(['Serializing of CasADi Function failed:' getReport(exception) ]);
            s = struct;
        end
     end
    end
end
