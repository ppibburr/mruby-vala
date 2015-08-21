[CCode (cprefix = "mrb_", cheader_filename = "mruby.h", gir_namespace = "MRb", gir_version = "0.1")]
namespace MRb {
  [CCode (has_target = false, cname="mrb_func_t")]
  public delegate Value mrb_func(Context mrb, Value self);

  [SimpleType]
  [CCode (cname = "mrb_value")]
  public struct Value {}

  [SimpleType]
  [CCode (cname = "mrb_sym")]
  public struct mrb_sym {}

  [Compact]
  [CCode (cprefix = "mrb_", cname = "mrb_state", free_function = "")]
  public class Context {
    public void* object_class;
    public int get_args(string fmt, ...);

    public Value float_value(float val);

    public Value cptr_value(void* val);

    [CCode (cname = "mrb_open")]
    public Context();

    [CCode (cheader_filename = "mruby/variable.h")]
    public Value vm_special_get(mrb_sym foo1);

    [CCode (cheader_filename = "mruby/variable.h")]
    public void vm_special_set(mrb_sym foo1, Value foo2);

    [CCode (cheader_filename = "mruby/variable.h")]
    public Value vm_iv_get(mrb_sym foo1);

    [CCode (cheader_filename = "mruby/variable.h")]
    public void vm_iv_set(mrb_sym foo1, Value foo2);

    [CCode (cheader_filename = "mruby/variable.h")]
    public Value vm_cv_get(mrb_sym foo1);

    [CCode (cheader_filename = "mruby/variable.h")]
    public void vm_cv_set(mrb_sym foo1, Value foo2);

    [CCode (cheader_filename = "mruby/variable.h")]
    public Value vm_const_get(mrb_sym foo1);

    [CCode (cheader_filename = "mruby/variable.h")]
    public void vm_const_set(mrb_sym foo1, Value foo2);

    [CCode (cheader_filename = "mruby/variable.h")]
    public Value const_get(Value foo1, mrb_sym foo2);

    [CCode (cheader_filename = "mruby/variable.h")]
    public void const_set(Value foo1, mrb_sym foo2, Value foo3);

    [CCode (cheader_filename = "mruby/variable.h")]
    public bool const_defined(Value foo1, mrb_sym foo2);

    [CCode (cheader_filename = "mruby/variable.h")]
    public void const_remove(Value foo1, mrb_sym foo2);

    [CCode (cheader_filename = "mruby/variable.h")]
    public bool iv_p(mrb_sym sym);

    [CCode (cheader_filename = "mruby/variable.h")]
    public void iv_check(mrb_sym sym);

    [CCode (cheader_filename = "mruby/variable.h")]
    public Value iv_get(Value obj, mrb_sym sym);

    [CCode (cheader_filename = "mruby/variable.h")]
    public void iv_set(Value obj, mrb_sym sym, Value v);

    [CCode (cheader_filename = "mruby/variable.h")]
    public bool iv_defined(Value foo1, mrb_sym foo2);

    [CCode (cheader_filename = "mruby/variable.h")]
    public Value iv_remove(Value obj, mrb_sym sym);

    [CCode (cheader_filename = "mruby/variable.h")]
    public void iv_copy(Value dst, Value src);

    [CCode (cheader_filename = "mruby/variable.h")]
    public bool const_defined_at(Value mod, mrb_sym id);

    [CCode (cheader_filename = "mruby/variable.h")]
    public Value gv_get(mrb_sym sym);

    [CCode (cheader_filename = "mruby/variable.h")]
    public void gv_set(mrb_sym sym, Value val);

    [CCode (cheader_filename = "mruby/variable.h")]
    public void gv_remove(mrb_sym sym);

    [CCode (cheader_filename = "mruby/variable.h")]
    public Value cv_get(Value mod, mrb_sym sym);

    [CCode (cheader_filename = "mruby/variable.h")]
    public void cv_set(Value mod, mrb_sym sym, Value v);

    [CCode (cheader_filename = "mruby/variable.h")]
    public bool cv_defined(Value mod, mrb_sym sym);

    [CCode (cheader_filename = "mruby/variable.h")]
    public Value mod_constants(Value mod);

    [CCode (cheader_filename = "mruby/variable.h")]
    public Value f_global_variables(Value self);

    [CCode (cheader_filename = "mruby/variable.h")]
    public Value obj_instance_variables(Value foo1);

    [CCode (cheader_filename = "mruby/variable.h")]
    public Value mod_class_variables(Value foo1);

    [CCode (cheader_filename = "mruby/variable.h")]
    public mrb_sym class_sym(void* c, void* outer);

    [CCode (cheader_filename = "mruby/variable.h")]
    public void gc_mark_gv();

    [CCode (cheader_filename = "mruby/variable.h")]
    public void gc_free_gv();

    [CCode (cheader_filename = "mruby/hash.h")]
    public Value hash_new();

    [CCode (cheader_filename = "mruby/hash.h")]
    public void hash_set(Value hash, Value key, Value val);

    [CCode (cheader_filename = "mruby/hash.h")]
    public Value hash_get(Value hash, Value key);

    [CCode (cheader_filename = "mruby/hash.h")]
    public Value hash_fetch(Value hash, Value key, Value def);

    [CCode (cheader_filename = "mruby/hash.h")]
    public Value hash_delete_key(Value hash, Value key);

    [CCode (cheader_filename = "mruby/hash.h")]
    public Value hash_keys(Value hash);

    [CCode (cheader_filename = "mruby/hash.h")]
    public Value check_hash_type(Value hash);

    [CCode (cheader_filename = "mruby/hash.h")]
    public Value hash_empty_p(Value self);

    [CCode (cheader_filename = "mruby/hash.h")]
    public Value hash_clear(Value hash);

    [CCode (cheader_filename = "mruby/compile.h")]
    public unowned Value load_string(string s);

    [CCode (cheader_filename = "mruby/numeric.h")]
    public Value flo_to_fixnum(Value val);

    [CCode (cheader_filename = "mruby/numeric.h")]
    public Value float_to_str(Value x, string fmt);

    [CCode (cheader_filename = "mruby/numeric.h")]
    public Value fixnum_plus(Value x, Value y);

    [CCode (cheader_filename = "mruby/numeric.h")]
    public Value fixnum_minus(Value x, Value y);

    [CCode (cheader_filename = "mruby/numeric.h")]
    public Value fixnum_mul(Value x, Value y);

    [CCode (cheader_filename = "mruby/numeric.h")]
    public Value num_div(Value x, Value y);

    [CCode (cheader_filename = "mruby/proc.h")]
    public void* proc_new_cfunc(mrb_func foo1);

    [CCode (cheader_filename = "mruby/proc.h")]
    public Value f_send(Value self);

    [CCode (cheader_filename = "mruby/proc.h")]
    public void* proc_new_cfunc_with_env(mrb_func func, [CCode (array_length_pos=1)] Value[] env);

    [CCode (cheader_filename = "mruby/proc.h")]
    public Value proc_cfunc_env_get(int foo1);

    [CCode (cheader_filename = "mruby/array.h")]
    public Value ary_new_capa(int foo1);

    [CCode (cheader_filename = "mruby/array.h")]
    public Value ary_new();

    [CCode (cheader_filename = "mruby/array.h")]
    public Value ary_new_from_values(int size,  [CCode (array_length=false)] Value[] vals);

    [CCode (cheader_filename = "mruby/array.h")]
    public Value assoc_new(Value car, Value cdr);

    [CCode (cheader_filename = "mruby/array.h")]
    public void ary_concat(Value foo1, Value foo2);

    [CCode (cheader_filename = "mruby/array.h")]
    public Value ary_splat(Value foo1);

    [CCode (cheader_filename = "mruby/array.h")]
    public void ary_push(Value foo1, Value foo2);

    [CCode (cheader_filename = "mruby/array.h")]
    public Value ary_pop(Value ary);

    [CCode (cheader_filename = "mruby/array.h")]
    public Value ary_ref(Value ary, int n);

    [CCode (cheader_filename = "mruby/array.h")]
    public void ary_set(Value ary, int n, Value val);

    [CCode (cheader_filename = "mruby/array.h")]
    public void ary_replace(Value a, Value b);

    [CCode (cheader_filename = "mruby/array.h")]
    public Value check_array_type(Value self);

    [CCode (cheader_filename = "mruby/array.h")]
    public Value ary_unshift(Value self, Value item);

    [CCode (cheader_filename = "mruby/array.h")]
    public Value ary_shift(Value self);

    [CCode (cheader_filename = "mruby/array.h")]
    public Value ary_clear(Value self);

    [CCode (cheader_filename = "mruby/array.h")]
    public Value ary_join(Value ary, Value sep);

    [CCode (cheader_filename = "mruby/array.h")]
    public Value ary_resize(Value ary, int len);

    [CCode (cheader_filename = "mruby/string.h")]
    public void str_concat(Value foo1, Value foo2);

    [CCode (cheader_filename = "mruby/string.h")]
    public Value str_plus(Value foo1, Value foo2);

    [CCode (cheader_filename = "mruby/string.h")]
    public Value ptr_to_str(void* foo1);

    [CCode (cheader_filename = "mruby/string.h")]
    public Value obj_as_string(Value obj);

    [CCode (cheader_filename = "mruby/string.h")]
    public Value str_resize(Value str, int len);

    [CCode (cheader_filename = "mruby/string.h")]
    public Value str_substr(Value str, int beg, int len);

    [CCode (cheader_filename = "mruby/string.h")]
    public Value string_type(Value str);

    [CCode (cheader_filename = "mruby/string.h")]
    public Value check_string_type(Value str);

    [CCode (cheader_filename = "mruby/string.h")]
    public Value str_buf_new(size_t capa);

    [CCode (cheader_filename = "mruby/string.h")]
    public string string_value_ptr(Value ptr);

    [CCode (cheader_filename = "mruby/string.h")]
    public Value str_dup(Value str);

    [CCode (cheader_filename = "mruby/string.h")]
    public Value str_intern(Value self);

    [CCode (cheader_filename = "mruby/string.h")]
    public Value str_to_inum(Value str, int _base, bool badcheck);

    [CCode (cheader_filename = "mruby/string.h")]
    public Value str_to_str(Value str);

    [CCode (cheader_filename = "mruby/string.h")]
    public bool str_equal(Value str1, Value str2);

    [CCode (cheader_filename = "mruby/string.h")]
    public Value str_cat(Value str, string ptr, size_t len);

    [CCode (cheader_filename = "mruby/string.h")]
    public Value str_cat_cstr(Value str, string ptr);

    [CCode (cheader_filename = "mruby/string.h")]
    public Value str_cat_str(Value str, Value str2);

    [CCode (cheader_filename = "mruby/string.h")]
    public Value str_append(Value str, Value str2);

    [CCode (cheader_filename = "mruby/string.h")]
    public char* str_to_cstr(Value str);

    [CCode (cheader_filename = "mruby/string.h")]
    public Value str_pool(Value str);

    [CCode (cheader_filename = "mruby/string.h")]
    public int str_hash(Value str);

    [CCode (cheader_filename = "mruby/string.h")]
    public Value str_dump(Value str);

    [CCode (cheader_filename = "mruby/string.h")]
    public Value str_inspect(Value str);

    [CCode (cheader_filename = "mruby/string.h")]
    public void noregexp(Value self);

    [CCode (cheader_filename = "mruby/string.h")]
    public void regexp_check(Value obj);

    [CCode (cheader_filename = "mruby/class.h")]
    public void* define_class_id(mrb_sym foo1, void* foo2);

    [CCode (cheader_filename = "mruby/class.h")]
    public void* define_module_id(mrb_sym foo1);

    [CCode (cheader_filename = "mruby/class.h")]
    public void* vm_define_class(Value foo1, Value foo2, mrb_sym foo3);

    [CCode (cheader_filename = "mruby/class.h")]
    public void* vm_define_module(Value foo1, mrb_sym foo2);

    [CCode (cheader_filename = "mruby/class.h")]
    public void define_method_raw(void* foo1, mrb_sym foo2, void* foo3);

    [CCode (cheader_filename = "mruby/class.h")]
    public void define_method_id(void* c, mrb_sym mid, mrb_func func, uint32 aspec);

    [CCode (cheader_filename = "mruby/class.h")]
    public void alias_method(void* c, mrb_sym a, mrb_sym b);

    [CCode (cheader_filename = "mruby/class.h")]
    public void* class_outer_module(void* foo1);

    [CCode (cheader_filename = "mruby/class.h")]
    public void* method_search(void* foo1, mrb_sym foo2);

    [CCode (cheader_filename = "mruby/class.h")]
    public void gc_mark_mt(void* foo1);

    [CCode (cheader_filename = "mruby/class.h")]
    public size_t gc_mark_mt_size(void* foo1);

    [CCode (cheader_filename = "mruby/class.h")]
    public void gc_free_mt(void* foo1);

    [CCode (cheader_filename = "mruby/range.h")]
    public Value range_new(Value foo1, Value foo2, bool foo3);

    [CCode (cheader_filename = "mruby/error.h")]
    public void sys_fail(string mesg);

    [CCode (cheader_filename = "mruby/error.h")]
    public Value exc_new_str(void* c, Value str);

    [CCode (cheader_filename = "mruby/error.h")]
    public Value exc_backtrace(Value exc);

    [CCode (cheader_filename = "mruby/error.h")]
    public Value get_backtrace();

    [CCode (cheader_filename = "mruby/error.h")]
    public Value f_raise(Value foo1);

    [CCode (cheader_filename = "mruby.h")]
    public void* define_class(string foo1, void* foo2);

    [CCode (cheader_filename = "mruby.h")]
    public void* define_module(string foo1);

    [CCode (cheader_filename = "mruby.h")]
    public Value singleton_class(Value foo1);

    [CCode (cheader_filename = "mruby.h")]
    public void include_module(void* foo1, void* foo2);

    [CCode (cheader_filename = "mruby.h")]
    public void define_method(void* foo1, string foo2, mrb_func foo3, uint32 foo4);

    [CCode (cheader_filename = "mruby.h")]
    public void define_class_method(void* foo1, string foo2, mrb_func foo3, uint32 foo4);

    [CCode (cheader_filename = "mruby.h")]
    public void define_module_function(void* foo1, string foo2, mrb_func foo3, uint32 foo4);

    [CCode (cheader_filename = "mruby.h")]
    public void define_const(void* foo1, string name, Value foo2);

    [CCode (cheader_filename = "mruby.h")]
    public void undef_method(void* foo1, string foo2);

    [CCode (cheader_filename = "mruby.h")]
    public void undef_class_method(void* foo1, string foo2);

    [CCode (cheader_filename = "mruby.h")]
    public Value obj_new(void* c, [CCode (array_length_pos=1)] Value[] argv);

    [CCode (cheader_filename = "mruby.h")]
    public Value instance_new(Value cv);

    [CCode (cheader_filename = "mruby.h")]
    public void* class_new(void* super);

    [CCode (cheader_filename = "mruby.h")]
    public void* module_new();

    [CCode (cheader_filename = "mruby.h")]
    public bool class_defined(string name);

    [CCode (cheader_filename = "mruby.h")]
    public void* class_get(string name);

    [CCode (cheader_filename = "mruby.h")]
    public void* class_get_under(void* outer, string name);

    [CCode (cheader_filename = "mruby.h")]
    public void* module_get(string name);

    [CCode (cheader_filename = "mruby.h")]
    public void* module_get_under(void* outer, string name);

    [CCode (cheader_filename = "mruby.h")]
    public Value notimplement_m(Value foo1);

    [CCode (cheader_filename = "mruby.h")]
    public Value obj_dup(Value obj);

    [CCode (cheader_filename = "mruby.h")]
    public Value check_to_integer(Value val, string method);

    [CCode (cheader_filename = "mruby.h")]
    public bool obj_respond_to(void* c, mrb_sym mid);

    [CCode (cheader_filename = "mruby.h")]
    public void* define_class_under(void* outer, string name, void* super);

    [CCode (cheader_filename = "mruby.h")]
    public void* define_module_under(void* outer, string name);

    [CCode (cheader_filename = "mruby.h")]
    public Value funcall_argv(Value foo1, mrb_sym foo2, int foo3,  [CCode (array_length=false)] Value[] foo4);

    [CCode (cheader_filename = "mruby.h")]
    public Value funcall_with_block(Value foo1, mrb_sym foo2, int foo3,  [CCode (array_length=false)] Value[] foo4, Value foo5);

    [CCode (cheader_filename = "mruby.h")]
    public mrb_sym intern_cstr(string foo1);

    [CCode (cheader_filename = "mruby.h")]
    public mrb_sym intern(string foo1, size_t foo2);

    [CCode (cheader_filename = "mruby.h")]
    public mrb_sym intern_static(string foo1, size_t foo2);

    [CCode (cheader_filename = "mruby.h")]
    public mrb_sym intern_str(Value foo1);

    [CCode (cheader_filename = "mruby.h")]
    public Value check_intern_cstr(string foo1);

    [CCode (cheader_filename = "mruby.h")]
    public Value check_intern(string foo1, size_t foo2);

    [CCode (cheader_filename = "mruby.h")]
    public Value check_intern_str(Value foo1);

    [CCode (cheader_filename = "mruby.h")]
    public string sym2name(mrb_sym foo1);

    [CCode (cheader_filename = "mruby.h")]
    public Value sym2str(mrb_sym foo1);

    [CCode (cheader_filename = "mruby.h")]
    public void* malloc(size_t foo1);

    [CCode (cheader_filename = "mruby.h")]
    public void* calloc(size_t foo1, size_t foo2);

    [CCode (cheader_filename = "mruby.h")]
    public void* realloc(void* foo1, size_t foo2);

    [CCode (cheader_filename = "mruby.h")]
    public void* realloc_simple(void* foo1, size_t foo2);

    [CCode (cheader_filename = "mruby.h")]
    public void* malloc_simple(size_t foo1);

    [CCode (cheader_filename = "mruby.h")]
    public void free(void* foo1);

    [CCode (cheader_filename = "mruby.h")]
    public Value str_new(string p, size_t len);

    [CCode (cheader_filename = "mruby.h")]
    public Value str_new_cstr(string foo1);

    [CCode (cheader_filename = "mruby.h")]
    public Value str_new_static(string p, size_t len);

    [CCode (cheader_filename = "mruby.h")]
    public void close();

    [CCode (cheader_filename = "mruby.h")]
    public void* default_allocf(void* foo1, size_t foo2, void* foo3);

    [CCode (cheader_filename = "mruby.h")]
    public Value top_self();

    [CCode (cheader_filename = "mruby.h")]
    public Value run(void* foo1, Value foo2);

    [CCode (cheader_filename = "mruby.h")]
    public Value toplevel_run(void* foo1);

    [CCode (cheader_filename = "mruby.h")]
    public void p(Value foo1);

    [CCode (cheader_filename = "mruby.h")]
    public mrb_sym obj_to_sym(Value name);

    [CCode (cheader_filename = "mruby.h")]
    public bool obj_eq(Value foo1, Value foo2);

    [CCode (cheader_filename = "mruby.h")]
    public bool obj_equal(Value foo1, Value foo2);

    [CCode (cheader_filename = "mruby.h")]
    public bool equal(Value obj1, Value obj2);

    [CCode (cheader_filename = "mruby.h")]
    public Value Integer(Value val);

    [CCode (cheader_filename = "mruby.h")]
    public Value Float(Value val);

    [CCode (cheader_filename = "mruby.h")]
    public Value inspect(Value obj);

    [CCode (cheader_filename = "mruby.h")]
    public bool eql(Value obj1, Value obj2);

    [CCode (cheader_filename = "mruby.h")]
    public void garbage_collect();

    [CCode (cheader_filename = "mruby.h")]
    public void full_gc();

    [CCode (cheader_filename = "mruby.h")]
    public void incremental_gc();

    [CCode (cheader_filename = "mruby.h")]
    public Value any_to_s(Value obj);

    [CCode (cheader_filename = "mruby.h")]
    public string obj_classname(Value obj);

    [CCode (cheader_filename = "mruby.h")]
    public void* obj_class(Value obj);

    [CCode (cheader_filename = "mruby.h")]
    public Value class_path(void* c);

    [CCode (cheader_filename = "mruby.h")]
    public bool obj_is_kind_of(Value obj, void* c);

    [CCode (cheader_filename = "mruby.h")]
    public Value obj_inspect(Value self);

    [CCode (cheader_filename = "mruby.h")]
    public Value obj_clone(Value self);

    [CCode (cheader_filename = "mruby.h")]
    public Value exc_new(void* c, string ptr, size_t len);

    [CCode (cheader_filename = "mruby.h")]
    public void print_backtrace();

    [CCode (cheader_filename = "mruby.h")]
    public void print_error();

    [CCode (cheader_filename = "mruby.h")]
    public Value yield(Value b, Value arg);

    [CCode (cheader_filename = "mruby.h")]
    public Value yield_argv(Value b, int argc,  [CCode (array_length=false)] Value[] argv);

    [CCode (cheader_filename = "mruby.h")]
    public Value yield_with_class(Value b, int argc,  [CCode (array_length=false)] Value[] argv, Value self, void* c);

    [CCode (cheader_filename = "mruby.h")]
    public void gc_protect(Value obj);

    [CCode (cheader_filename = "mruby.h")]
    public Value to_int(Value val);

    [CCode (cheader_filename = "mruby.h")]
    public void define_alias(void* klass, string name1, string name2);

    [CCode (cheader_filename = "mruby.h")]
    public string class_name(void* klass);

    [CCode (cheader_filename = "mruby.h")]
    public void define_global_const(string name, Value val);

    [CCode (cheader_filename = "mruby.h")]
    public Value attr_get(Value obj, mrb_sym id);

    [CCode (cheader_filename = "mruby.h")]
    public bool respond_to(Value obj, mrb_sym mid);

    [CCode (cheader_filename = "mruby.h")]
    public bool obj_is_instance_of(Value obj, void* c);

    [CCode (cheader_filename = "mruby.h")]
    public Value fiber_resume(Value fib, int argc,  [CCode (array_length=false)] Value[] argv);

    [CCode (cheader_filename = "mruby.h")]
    public Value fiber_yield(int argc,  [CCode (array_length=false)] Value[] argv);

    [CCode (cheader_filename = "mruby.h")]
    public void* alloca(size_t foo1);

    [CCode (cheader_filename = "mruby.h")]
    public void show_version();

    [CCode (cheader_filename = "mruby.h")]
    public void show_copyright();
  }

  public Value bool_value(bool val);
  public Value fixnum_value(int val);
  public Value float_value(Context mrb, float val);
  public Value nil_value();
  public Value true_value();
  public Value false_value();
  public Value obj_value(void* obj);
  
  public void* cptr(Value obj);
  public mrb_sym sym(Value val);
  [CCode (cname="mrb_ptr")]
  public void* class_ptr(Value kls);
  public void* obj_ptr(Value o);

  [CCode (cname = "MRB_ARGS_NONE")]
  public uint32 args_none();

  [CCode (cname = "MRB_ARGS_REST")]
  public uint32 args_rest();

  [CCode (cname = "MRB_ARGS_BLOCK")]
  public uint32 args_block();

  [CCode (cname = "MRB_ARGS_ANY")]
  public uint32 args_any();

  [CCode (cname = "MRB_ARGS_POST")]
  public uint32 args_post(int n);

  [CCode (cname = "MRB_ARGS_REQ")]
  public uint32 args_req(int n);

  [CCode (cname = "MRB_ARGS_OPT")]
  public uint32 args_opt(int n);
  [CCode (cname = "MRB_ARGS_ARG")]
  public uint32 args_arg(int n1, int n2);
}

