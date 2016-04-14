
namespace MRuby {
  using MRb;
  public class Context : MRb.Context {
    public unowned MRb.Context _base_ {
      get {
		return (MRb.Context)this;
      }
    }
  
    public MRuby.Value[] args(out int len) {
	  MRb.Value* a;
	  int ac = 0;
	  MRb.Value b;
	  get_args("*&", out a, out ac, out b);
	  
	  var args = new MRuby.Value[ac+1];
	  
	  for (var i=0; i < ac; i++) {
		  args[i] = new MRuby.Value(((MRb.Value[])a)[i], this);
	  }
	  
	  args[ac] = new MRuby.Value(b, this);
	  
	  len = ac+1;
	  
	  return args;
	}
  
    public new void define_method(string name, FuncCB cb) {
      new Class(object_class).define_method(this, name, cb);
    }
    
    public new Class class_get(string name) {
      return new Class.get(this, name);
    }

    public new Module module_get(string name) {
      return new Module.get(this, name);
    }
    
    public new MRuby.Object float_value(float val) {
      return new MRuby.Object.from(((MRb.Context)this).float_value(val), this);
    }
    
    public new MRuby.Object cptr_value(void* val) {
      return new MRuby.Object.from(((MRb.Context)this).cptr_value(val), this);
    }  
    
    public new int ary_len(MRuby.Value val) {
      return ((MRb.Context)this).ary_len(val.actual);
    }         
    
    public new MRuby.Object obj_new(void* cls, MRuby.Value[] argv = {}) {
      return new MRuby.Object.from(((MRb.Context)this).obj_new(cls, (MRb.Value[])argv), this);
    }
    
    public new MRuby.Object? load_string(string str) {
      return new MRuby.Object.from(((MRb.Context)this).load_string(str), this);
    }  
       
    public new void sys_fail(string mesg) {
      _base_.sys_fail(mesg);

    }

    public new MRuby.Object exc_new_str(void* c, MRuby.Value str) {
      return new MRuby.Object.from(_base_.exc_new_str(c, str.actual), this);

    }

    public new MRuby.Object exc_backtrace(MRuby.Value exc) {
      return new MRuby.Object.from(_base_.exc_backtrace(exc.actual), this);

    }

    public new MRuby.Object get_backtrace() {
      return new MRuby.Object.from(_base_.get_backtrace(), this);

    }

    public new MRuby.Object f_raise(MRuby.Value foo1) {
      return new MRuby.Object.from(_base_.f_raise(foo1.actual), this);

    }

    public new void str_concat(MRuby.Value foo1, MRuby.Value foo2) {
      _base_.str_concat(foo1.actual, foo2.actual);

    }

    public new MRuby.Object str_plus(MRuby.Value foo1, MRuby.Value foo2) {
      return new MRuby.Object.from(_base_.str_plus(foo1.actual, foo2.actual), this);

    }

    public new MRuby.Object ptr_to_str(void* foo1) {
      return new MRuby.Object.from(_base_.ptr_to_str(foo1), this);

    }

    public new MRuby.String obj_as_string(MRuby.Value obj) {
      var ret = _base_.obj_as_string(obj.actual);

      return new MRuby.String.from(ret, this);

    }

    public new MRuby.Object str_resize(MRuby.Value str, int len) {
      return new MRuby.Object.from(_base_.str_resize(str.actual, len), this);

    }

    public new MRuby.Object str_substr(MRuby.Value str, int beg, int len) {
      return new MRuby.Object.from(_base_.str_substr(str.actual, beg, len), this);

    }

    public new MRuby.Object string_type(MRuby.Value str) {
      return new MRuby.Object.from(_base_.string_type(str.actual), this);

    }

    public new MRuby.Object check_string_type(MRuby.Value str) {
      return new MRuby.Object.from(_base_.check_string_type(str.actual), this);

    }

    public new MRuby.Object str_buf_new(size_t capa) {
      return new MRuby.Object.from(_base_.str_buf_new(capa), this);

    }

    public new string string_value_ptr(MRuby.Value ptr) {
      return (string)_base_.string_value_ptr(ptr.actual);

    }

    public new MRuby.Object str_dup(MRuby.Value str) {
      return new MRuby.Object.from(_base_.str_dup(str.actual), this);

    }

    public new MRuby.Object str_intern(MRuby.Value self) {
      return new MRuby.Object.from(_base_.str_intern(self.actual), this);

    }

    public new MRuby.Object str_to_inum(MRuby.Value str, int _base, bool badcheck) {
      return new MRuby.Object.from(_base_.str_to_inum(str.actual, _base, badcheck), this);

    }

    public new MRuby.Object str_to_str(MRuby.Value str) {
      return new MRuby.Object.from(_base_.str_to_str(str.actual), this);

    }

    public new bool str_equal(MRuby.Value str1, MRuby.Value str2) {
      return (bool)_base_.str_equal(str1.actual, str2.actual);

    }

    public new MRuby.Object str_cat(MRuby.Value str, string ptr, size_t len) {
      return new MRuby.Object.from(_base_.str_cat(str.actual, ptr, len), this);

    }

    public new MRuby.Object str_cat_cstr(MRuby.Value str, string ptr) {
      return new MRuby.Object.from(_base_.str_cat_cstr(str.actual, ptr), this);

    }

    public new MRuby.Object str_cat_str(MRuby.Value str, MRuby.Value str2) {
      return new MRuby.Object.from(_base_.str_cat_str(str.actual, str2.actual), this);

    }

    public new MRuby.Object str_append(MRuby.Value str, MRuby.Value str2) {
      return new MRuby.Object.from(_base_.str_append(str.actual, str2.actual), this);

    }

    public new char* str_to_cstr(MRuby.Value str) {
      return (char*)_base_.str_to_cstr(str.actual);

    }

    public new MRuby.Object str_pool(MRuby.Value str) {
      return new MRuby.Object.from(_base_.str_pool(str.actual), this);

    }

    public new int str_hash(MRuby.Value str) {
      return (int)_base_.str_hash(str.actual);

    }

    public new MRuby.Object str_dump(MRuby.Value str) {
      return new MRuby.Object.from(_base_.str_dump(str.actual), this);

    }

    public new MRuby.Object str_inspect(MRuby.Value str) {
      return new MRuby.Object.from(_base_.str_inspect(str.actual), this);

    }

    public new void noregexp(MRuby.Value self) {
      _base_.noregexp(self.actual);

    }

    public new void regexp_check(MRuby.Value obj) {
      _base_.regexp_check(obj.actual);

    }

    public new MRuby.Object range_new(MRuby.Value foo1, MRuby.Value foo2, bool foo3) {
      return new MRuby.Object.from(_base_.range_new(foo1.actual, foo2.actual, foo3), this);

    }

    public new void* define_class_id(MRuby.Symbol foo1, void* foo2) {
      return (void*)_base_.define_class_id(foo1, foo2);

    }

    public new void* define_module_id(MRuby.Symbol foo1) {
      return (void*)_base_.define_module_id(foo1);

    }

    public new void* vm_define_class(MRuby.Value foo1, MRuby.Value foo2, MRuby.Symbol foo3) {
      return (void*)_base_.vm_define_class(foo1.actual, foo2.actual, foo3);

    }

    public new void* vm_define_module(MRuby.Value foo1, MRuby.Symbol foo2) {
      return (void*)_base_.vm_define_module(foo1.actual, foo2);

    }

    public new void define_method_raw(void* foo1, MRuby.Symbol foo2, void* foo3) {
      _base_.define_method_raw(foo1, foo2, foo3);

    }

    public new void define_method_id(void* c, MRuby.Symbol mid, mrb_func func, uint32 aspec) {
      _base_.define_method_id(c, mid, func, aspec);

    }

    public new void alias_method(void* c, MRuby.Symbol a, MRuby.Symbol b) {
      _base_.alias_method(c, a, b);

    }

    public new void* class_outer_module(void* foo1) {
      return (void*)_base_.class_outer_module(foo1);

    }

    public new void* method_search(void* foo1, MRuby.Symbol foo2) {
      return (void*)_base_.method_search(foo1, foo2);

    }

    public new void gc_mark_mt(void* foo1) {
      _base_.gc_mark_mt(foo1);

    }

    public new size_t gc_mark_mt_size(void* foo1) {
      return (size_t)_base_.gc_mark_mt_size(foo1);

    }

    public new void gc_free_mt(void* foo1) {
      _base_.gc_free_mt(foo1);

    }

    public new MRuby.Object flo_to_fixnum(MRuby.Value val) {
      return new MRuby.Object.from(_base_.flo_to_fixnum(val.actual), this);

    }

    public new MRuby.Object float_to_str(MRuby.Value x, string fmt) {
      return new MRuby.Object.from(_base_.float_to_str(x.actual, fmt), this);

    }

    public new float to_flo(MRuby.Value x) {
      return (float)_base_.to_flo(x.actual);

    }

    public new MRuby.Object fixnum_plus(MRuby.Value x, MRuby.Value y) {
      return new MRuby.Object.from(_base_.fixnum_plus(x.actual, y.actual), this);

    }

    public new MRuby.Object fixnum_minus(MRuby.Value x, MRuby.Value y) {
      return new MRuby.Object.from(_base_.fixnum_minus(x.actual, y.actual), this);

    }

    public new MRuby.Object fixnum_mul(MRuby.Value x, MRuby.Value y) {
      return new MRuby.Object.from(_base_.fixnum_mul(x.actual, y.actual), this);

    }

    public new MRuby.Object num_div(MRuby.Value x, MRuby.Value y) {
      return new MRuby.Object.from(_base_.num_div(x.actual, y.actual), this);

    }

    public new void* proc_new_cfunc(mrb_func foo1) {
      return (void*)_base_.proc_new_cfunc(foo1);

    }

    public new MRuby.Object f_send(MRuby.Value self) {
      return new MRuby.Object.from(_base_.f_send(self.actual), this);

    }

    public new MRuby.Object proc_cfunc_env_get(int foo1) {
      return new MRuby.Object.from(_base_.proc_cfunc_env_get(foo1), this);

    }

    public new MRuby.Object ary_new_capa(int foo1) {
      return new MRuby.Object.from(_base_.ary_new_capa(foo1), this);

    }

    public new MRuby.Array ary_new() {
      var ret = _base_.ary_new();

      return new MRuby.Array.from(ret, this);

    }

    public new MRuby.Array ary_new_from_values(int size, MRuby.Value[] vals) {
      var ret = _base_.ary_new_from_values(size, (vary2mrb(vals)));

      return new MRuby.Array.from(ret, this);

    }

    public new MRuby.Object assoc_new(MRuby.Value car, MRuby.Value cdr) {
      return new MRuby.Object.from(_base_.assoc_new(car.actual, cdr.actual), this);

    }

    public new void ary_concat(MRuby.Value foo1, MRuby.Value foo2) {
      _base_.ary_concat(foo1.actual, foo2.actual);

    }

    public new MRuby.Object ary_splat(MRuby.Value foo1) {
      return new MRuby.Object.from(_base_.ary_splat(foo1.actual), this);

    }

    public new void ary_push(MRuby.Value foo1, MRuby.Value foo2) {
      _base_.ary_push(foo1.actual, foo2.actual);

    }

    public new MRuby.Object ary_pop(MRuby.Value ary) {
      return new MRuby.Object.from(_base_.ary_pop(ary.actual), this);

    }

    public new MRuby.Object ary_ref(MRuby.Value ary, int n) {
      return new MRuby.Object.from(_base_.ary_ref(ary.actual, n), this);

    }

    public new void ary_set(MRuby.Value ary, int n, MRuby.Value val) {
      _base_.ary_set(ary.actual, n, val.actual);

    }

    public new void ary_replace(MRuby.Value a, MRuby.Value b) {
      _base_.ary_replace(a.actual, b.actual);

    }

    public new MRuby.Object check_array_type(MRuby.Value self) {
      return new MRuby.Object.from(_base_.check_array_type(self.actual), this);

    }

    public new MRuby.Object ary_unshift(MRuby.Value self, MRuby.Value item) {
      return new MRuby.Object.from(_base_.ary_unshift(self.actual, item.actual), this);

    }

    public new MRuby.Object ary_shift(MRuby.Value self) {
      return new MRuby.Object.from(_base_.ary_shift(self.actual), this);

    }

    public new MRuby.Object ary_clear(MRuby.Value self) {
      return new MRuby.Object.from(_base_.ary_clear(self.actual), this);

    }

    public new MRuby.Object ary_join(MRuby.Value ary, MRuby.Value sep) {
      return new MRuby.Object.from(_base_.ary_join(ary.actual, sep.actual), this);

    }

    public new MRuby.Object ary_resize(MRuby.Value ary, int len) {
      return new MRuby.Object.from(_base_.ary_resize(ary.actual, len), this);

    }

    public new MRuby.Object hash_new() {
      return new MRuby.Object.from(_base_.hash_new(), this);

    }

    public new void hash_set(MRuby.Value hash, MRuby.Value key, MRuby.Value val) {
      _base_.hash_set(hash.actual, key.actual, val.actual);

    }

    public new MRuby.Object hash_get(MRuby.Value hash, MRuby.Value key) {
      return new MRuby.Object.from(_base_.hash_get(hash.actual, key.actual), this);

    }

    public new MRuby.Object hash_fetch(MRuby.Value hash, MRuby.Value key, MRuby.Value def) {
      return new MRuby.Object.from(_base_.hash_fetch(hash.actual, key.actual, def.actual), this);

    }

    public new MRuby.Object hash_delete_key(MRuby.Value hash, MRuby.Value key) {
      return new MRuby.Object.from(_base_.hash_delete_key(hash.actual, key.actual), this);

    }

    public new MRuby.Object hash_keys(MRuby.Value hash) {
      return new MRuby.Object.from(_base_.hash_keys(hash.actual), this);

    }

    public new MRuby.Object check_hash_type(MRuby.Value hash) {
      return new MRuby.Object.from(_base_.check_hash_type(hash.actual), this);

    }

    public new MRuby.Object hash_empty_p(MRuby.Value self) {
      return new MRuby.Object.from(_base_.hash_empty_p(self.actual), this);

    }

    public new MRuby.Object hash_clear(MRuby.Value hash) {
      return new MRuby.Object.from(_base_.hash_clear(hash.actual), this);

    }

    public new MRuby.Object vm_special_get(MRuby.Symbol foo1) {
      return new MRuby.Object.from(_base_.vm_special_get(foo1), this);

    }

    public new void vm_special_set(MRuby.Symbol foo1, MRuby.Value foo2) {
      _base_.vm_special_set(foo1, foo2.actual);

    }

    public new MRuby.Object vm_iv_get(MRuby.Symbol foo1) {
      return new MRuby.Object.from(_base_.vm_iv_get(foo1), this);

    }

    public new void vm_iv_set(MRuby.Symbol foo1, MRuby.Value foo2) {
      _base_.vm_iv_set(foo1, foo2.actual);

    }

    public new MRuby.Object vm_cv_get(MRuby.Symbol foo1) {
      return new MRuby.Object.from(_base_.vm_cv_get(foo1), this);

    }

    public new void vm_cv_set(MRuby.Symbol foo1, MRuby.Value foo2) {
      _base_.vm_cv_set(foo1, foo2.actual);

    }

    public new MRuby.Object vm_const_get(MRuby.Symbol foo1) {
      return new MRuby.Object.from(_base_.vm_const_get(foo1), this);

    }

    public new void vm_const_set(MRuby.Symbol foo1, MRuby.Value foo2) {
      _base_.vm_const_set(foo1, foo2.actual);

    }

    public new MRuby.Object const_get(MRuby.Value foo1, MRuby.Symbol foo2) {
      return new MRuby.Object.from(_base_.const_get(foo1.actual, foo2), this);

    }

    public new void const_set(MRuby.Value foo1, MRuby.Symbol foo2, MRuby.Value foo3) {
      _base_.const_set(foo1.actual, foo2, foo3.actual);

    }

    public new bool const_defined(MRuby.Value foo1, MRuby.Symbol foo2) {
      return (bool)_base_.const_defined(foo1.actual, foo2);

    }

    public new void const_remove(MRuby.Value foo1, MRuby.Symbol foo2) {
      _base_.const_remove(foo1.actual, foo2);

    }

    public new bool iv_p(MRuby.Symbol sym) {
      return (bool)_base_.iv_p(sym);

    }

    public new void iv_check(MRuby.Symbol sym) {
      _base_.iv_check(sym);

    }

    public new MRuby.Object iv_get(MRuby.Value obj, MRuby.Symbol sym) {
      return new MRuby.Object.from(_base_.iv_get(obj.actual, sym), this);

    }

    public new void iv_set(MRuby.Value obj, MRuby.Symbol sym, MRuby.Value v) {
      _base_.iv_set(obj.actual, sym, v.actual);

    }

    public new bool iv_defined(MRuby.Value foo1, MRuby.Symbol foo2) {
      return (bool)_base_.iv_defined(foo1.actual, foo2);

    }

    public new MRuby.Object iv_remove(MRuby.Value obj, MRuby.Symbol sym) {
      return new MRuby.Object.from(_base_.iv_remove(obj.actual, sym), this);

    }

    public new void iv_copy(MRuby.Value dst, MRuby.Value src) {
      _base_.iv_copy(dst.actual, src.actual);

    }

    public new bool const_defined_at(MRuby.Value mod, MRuby.Symbol id) {
      return (bool)_base_.const_defined_at(mod.actual, id);

    }

    public new MRuby.Object gv_get(MRuby.Symbol sym) {
      return new MRuby.Object.from(_base_.gv_get(sym), this);

    }

    public new void gv_set(MRuby.Symbol sym, MRuby.Value val) {
      _base_.gv_set(sym, val.actual);

    }

    public new void gv_remove(MRuby.Symbol sym) {
      _base_.gv_remove(sym);

    }

    public new MRuby.Object cv_get(MRuby.Value mod, MRuby.Symbol sym) {
      return new MRuby.Object.from(_base_.cv_get(mod.actual, sym), this);

    }

    public new void cv_set(MRuby.Value mod, MRuby.Symbol sym, MRuby.Value v) {
      _base_.cv_set(mod.actual, sym, v.actual);

    }

    public new bool cv_defined(MRuby.Value mod, MRuby.Symbol sym) {
      return (bool)_base_.cv_defined(mod.actual, sym);

    }

    public new MRuby.Object mod_constants(MRuby.Value mod) {
      return new MRuby.Object.from(_base_.mod_constants(mod.actual), this);

    }

    public new MRuby.Object f_global_variables(MRuby.Value self) {
      return new MRuby.Object.from(_base_.f_global_variables(self.actual), this);

    }

    public new MRuby.Object obj_instance_variables(MRuby.Value foo1) {
      return new MRuby.Object.from(_base_.obj_instance_variables(foo1.actual), this);

    }

    public new MRuby.Object mod_class_variables(MRuby.Value foo1) {
      return new MRuby.Object.from(_base_.mod_class_variables(foo1.actual), this);

    }

    public new MRuby.Symbol class_sym(void* c, void* outer) {
      return (MRuby.Symbol)_base_.class_sym(c, outer);

    }

    public new void gc_mark_gv() {
      _base_.gc_mark_gv();

    }

    public new void gc_free_gv() {
      _base_.gc_free_gv();

    }

    public new void* define_class(string foo1, void* foo2) {
      return (void*)_base_.define_class(foo1, foo2);

    }

    public new void* define_module(string foo1) {
      return (void*)_base_.define_module(foo1);

    }

    public new MRuby.Object singleton_class(MRuby.Value foo1) {
      return new MRuby.Object.from(_base_.singleton_class(foo1.actual), this);

    }

    public new void include_module(void* foo1, void* foo2) {
      _base_.include_module(foo1, foo2);

    }

    public new void define_class_method(void* foo1, string foo2, mrb_func foo3, uint32 foo4) {
      _base_.define_class_method(foo1, foo2, foo3, foo4);

    }

    public new void define_module_function(void* foo1, string foo2, mrb_func foo3, uint32 foo4) {
      _base_.define_module_function(foo1, foo2, foo3, foo4);

    }

    public new void define_const(void* foo1, string name, MRuby.Value foo2) {
      _base_.define_const(foo1, name, foo2.actual);

    }

    public new void undef_method(void* foo1, string foo2) {
      _base_.undef_method(foo1, foo2);

    }

    public new void undef_class_method(void* foo1, string foo2) {
      _base_.undef_class_method(foo1, foo2);

    }

    public new MRuby.Object instance_new(MRuby.Value cv) {
      return new MRuby.Object.from(_base_.instance_new(cv.actual), this);

    }

    public new void* class_new(void* super) {
      return (void*)_base_.class_new(super);

    }

    public new void* module_new() {
      return (void*)_base_.module_new();

    }

    public new bool class_defined(string name) {
      return (bool)_base_.class_defined(name);

    }

    public new void* class_get_under(void* outer, string name) {
      return (void*)_base_.class_get_under(outer, name);

    }

    public new void* module_get_under(void* outer, string name) {
      return (void*)_base_.module_get_under(outer, name);

    }

    public new MRuby.Object notimplement_m(MRuby.Value foo1) {
      return new MRuby.Object.from(_base_.notimplement_m(foo1.actual), this);

    }

    public new MRuby.Object obj_dup(MRuby.Value obj) {
      return new MRuby.Object.from(_base_.obj_dup(obj.actual), this);

    }

    public new MRuby.Object check_to_integer(MRuby.Value val, string method) {
      return new MRuby.Object.from(_base_.check_to_integer(val.actual, method), this);

    }

    public new bool obj_respond_to(void* c, MRuby.Symbol mid) {
      return (bool)_base_.obj_respond_to(c, mid);

    }

    public new void* define_class_under(void* outer, string name, void* super) {
      return (void*)_base_.define_class_under(outer, name, super);

    }

    public new void* define_module_under(void* outer, string name) {
      return (void*)_base_.define_module_under(outer, name);

    }

    public new MRuby.Object funcall_argv(MRuby.Value foo1, MRuby.Symbol foo2, int foo3, MRuby.Value[] foo4) {
      return new MRuby.Object.from(_base_.funcall_argv(foo1.actual, foo2, foo3, (vary2mrb(foo4))), this);

    }

    public new MRuby.Object funcall_with_block(MRuby.Value foo1, MRuby.Symbol foo2, int foo3, MRuby.Value[] foo4, MRuby.Value foo5) {
      return new MRuby.Object.from(_base_.funcall_with_block(foo1.actual, foo2, foo3, (vary2mrb(foo4)), foo5.actual), this);

    }

    public new MRuby.Symbol intern_cstr(string foo1) {
      return (MRuby.Symbol)_base_.intern_cstr(foo1);

    }

    public new MRuby.Symbol intern(string foo1, size_t foo2) {
      return (MRuby.Symbol)_base_.intern(foo1, foo2);

    }

    public new MRuby.Symbol intern_static(string foo1, size_t foo2) {
      return (MRuby.Symbol)_base_.intern_static(foo1, foo2);

    }

    public new MRuby.Symbol intern_str(MRuby.Value foo1) {
      return (MRuby.Symbol)_base_.intern_str(foo1.actual);

    }

    public new MRuby.Object check_intern_cstr(string foo1) {
      return new MRuby.Object.from(_base_.check_intern_cstr(foo1), this);

    }

    public new MRuby.Object check_intern(string foo1, size_t foo2) {
      return new MRuby.Object.from(_base_.check_intern(foo1, foo2), this);

    }

    public new MRuby.Object check_intern_str(MRuby.Value foo1) {
      return new MRuby.Object.from(_base_.check_intern_str(foo1.actual), this);

    }

    public new string sym2name(MRuby.Symbol foo1) {
      return (string)_base_.sym2name(foo1);

    }

    public new MRuby.Object sym2str(MRuby.Symbol foo1) {
      return new MRuby.Object.from(_base_.sym2str(foo1), this);

    }

    public new void* malloc(size_t foo1) {
      return (void*)_base_.malloc(foo1);

    }

    public new void* calloc(size_t foo1, size_t foo2) {
      return (void*)_base_.calloc(foo1, foo2);

    }

    public new void* realloc(void* foo1, size_t foo2) {
      return (void*)_base_.realloc(foo1, foo2);

    }

    public new void* realloc_simple(void* foo1, size_t foo2) {
      return (void*)_base_.realloc_simple(foo1, foo2);

    }

    public new void* malloc_simple(size_t foo1) {
      return (void*)_base_.malloc_simple(foo1);

    }

    public new void free(void* foo1) {
      _base_.free(foo1);

    }

    public new MRuby.Object str_new(string p, size_t len) {
      return new MRuby.Object.from(_base_.str_new(p, len), this);

    }

    public new MRuby.String str_new_cstr(string foo1) {
      var ret = _base_.str_new_cstr(foo1);

      return new MRuby.String.from(ret, this);

    }

    public new MRuby.Object str_new_static(string p, size_t len) {
      return new MRuby.Object.from(_base_.str_new_static(p, len), this);

    }

    public new void close() {
      _base_.close();

    }

    public new void* default_allocf(void* foo1, size_t foo2, void* foo3) {
      return (void*)_base_.default_allocf(foo1, foo2, foo3);

    }

    public new MRuby.Object top_self() {
      return new MRuby.Object.from(_base_.top_self(), this);

    }

    public new MRuby.Object run(void* foo1, MRuby.Value foo2) {
      return new MRuby.Object.from(_base_.run(foo1, foo2.actual), this);

    }

    public new MRuby.Object toplevel_run(void* foo1) {
      return new MRuby.Object.from(_base_.toplevel_run(foo1), this);

    }

    public new void p(MRuby.Value foo1) {
      _base_.p(foo1.actual);

    }

    public new MRuby.Symbol obj_to_sym(MRuby.Value name) {
      return (MRuby.Symbol)_base_.obj_to_sym(name.actual);

    }

    public new bool obj_eq(MRuby.Value foo1, MRuby.Value foo2) {
      return (bool)_base_.obj_eq(foo1.actual, foo2.actual);

    }

    public new bool obj_equal(MRuby.Value foo1, MRuby.Value foo2) {
      return (bool)_base_.obj_equal(foo1.actual, foo2.actual);

    }

    public new bool equal(MRuby.Value obj1, MRuby.Value obj2) {
      return (bool)_base_.equal(obj1.actual, obj2.actual);

    }

    public new MRuby.Object Integer(MRuby.Value val) {
      return new MRuby.Object.from(_base_.Integer(val.actual), this);

    }

    public new MRuby.Object Float(MRuby.Value val) {
      return new MRuby.Object.from(_base_.Float(val.actual), this);

    }

    public new MRuby.Object inspect(MRuby.Value obj) {
      return new MRuby.Object.from(_base_.inspect(obj.actual), this);

    }

    public new bool eql(MRuby.Value obj1, MRuby.Value obj2) {
      return (bool)_base_.eql(obj1.actual, obj2.actual);

    }

    public new void garbage_collect() {
      _base_.garbage_collect();

    }

    public new void full_gc() {
      _base_.full_gc();

    }

    public new void incremental_gc() {
      _base_.incremental_gc();

    }

    public new MRuby.Object any_to_s(MRuby.Value obj) {
      return new MRuby.Object.from(_base_.any_to_s(obj.actual), this);

    }

    public new string obj_classname(MRuby.Value obj) {
      return (string)_base_.obj_classname(obj.actual);

    }

    public new void* obj_class(MRuby.Value obj) {
      return (void*)_base_.obj_class(obj.actual);

    }

    public new MRuby.Object class_path(void* c) {
      return new MRuby.Object.from(_base_.class_path(c), this);

    }

    public new bool obj_is_kind_of(MRuby.Value obj, void* c) {
      return (bool)_base_.obj_is_kind_of(obj.actual, c);

    }

    public new MRuby.Object obj_inspect(MRuby.Value self) {
      return new MRuby.Object.from(_base_.obj_inspect(self.actual), this);

    }

    public new MRuby.Object obj_clone(MRuby.Value self) {
      return new MRuby.Object.from(_base_.obj_clone(self.actual), this);

    }

    public new MRuby.Object exc_new(void* c, string ptr, size_t len) {
      return new MRuby.Object.from(_base_.exc_new(c, ptr, len), this);

    }

    public new void print_backtrace() {
      _base_.print_backtrace();

    }

    public new void print_error() {
      _base_.print_error();

    }

    public new MRuby.Object yield(MRuby.Value b, MRuby.Value arg) {
      return new MRuby.Object.from(_base_.yield(b.actual, arg.actual), this);

    }

    public new MRuby.Object yield_argv(MRuby.Value b, int argc, MRuby.Value[] argv) {
      return new MRuby.Object.from(_base_.yield_argv(b.actual, argc, (vary2mrb(argv))), this);

    }

    public new MRuby.Object yield_with_class(MRuby.Value b, int argc, MRuby.Value[] argv, MRuby.Value self, void* c) {
      return new MRuby.Object.from(_base_.yield_with_class(b.actual, argc, (vary2mrb(argv)), self.actual, c), this);

    }

    public new void gc_protect(MRuby.Value obj) {
      _base_.gc_protect(obj.actual);

    }

    public new MRuby.Object to_int(MRuby.Value val) {
      return new MRuby.Object.from(_base_.to_int(val.actual), this);

    }

    public new void define_alias(void* klass, string name1, string name2) {
      _base_.define_alias(klass, name1, name2);

    }

    public new string class_name(void* klass) {
      return (string)_base_.class_name(klass);

    }

    public new void define_global_const(string name, MRuby.Value val) {
      _base_.define_global_const(name, val.actual);

    }

    public new MRuby.Object attr_get(MRuby.Value obj, MRuby.Symbol id) {
      return new MRuby.Object.from(_base_.attr_get(obj.actual, id), this);

    }

    public new bool respond_to(MRuby.Value obj, MRuby.Symbol mid) {
      return (bool)_base_.respond_to(obj.actual, mid);

    }

    public new bool obj_is_instance_of(MRuby.Value obj, void* c) {
      return (bool)_base_.obj_is_instance_of(obj.actual, c);

    }

    public new MRuby.Object fiber_resume(MRuby.Value fib, int argc, MRuby.Value[] argv) {
      return new MRuby.Object.from(_base_.fiber_resume(fib.actual, argc, (vary2mrb(argv))), this);

    }

    public new MRuby.Object fiber_yield(int argc, MRuby.Value[] argv) {
      return new MRuby.Object.from(_base_.fiber_yield(argc, (vary2mrb(argv))), this);

    }

    public new void* alloca(size_t foo1) {
      return (void*)_base_.alloca(foo1);

    }

    public new void show_version() {
      _base_.show_version();

    }

    public new void show_copyright() {
      _base_.show_copyright();

    }

  }
}

