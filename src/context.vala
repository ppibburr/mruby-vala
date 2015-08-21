
namespace MRuby {
  using MRb;
  public class Context : MRb.Context {
    public new void define_method(string name, Module.FuncCB cb) {
      new Class(object_class).define_method(this, name, cb);
    }
    
    public new Class class_get(string name) {
      return new Class.get(this, name);
    }

    public new Module module_get(string name) {
      return new Module.get(this, name);
    }
    
    public new MRuby.Value float_value(float val) {
      return (MRuby.Value)((MRb.Context)this).float_value(val);
    }
    
    public new MRuby.Value cptr_value(void* val) {
      return (MRuby.Value)((MRb.Context)this).cptr_value(val);
    }    
    
    public new MRuby.Value obj_new(void* cls, MRuby.Value[] argv = {}) {
      return (MRuby.Value)((MRb.Context)this).obj_new(cls, (MRb.Value[])argv);
    }
    
    public new unowned MRuby.Value? load_string(string str) {
      return (MRuby.Value)((MRb.Context)this).load_string(str);
    }
    
    public new MRuby.Value vm_special_get(MRuby.Symbol foo1) {

      return  (MRuby.Value)((MRb.Context)this).vm_special_get(foo1);
    }

    public new void vm_special_set(MRuby.Symbol foo1, MRuby.Value foo2) {

       ((MRb.Context)this).vm_special_set(foo1, foo2);
    }

    public new MRuby.Value vm_iv_get(MRuby.Symbol foo1) {

      return  (MRuby.Value)((MRb.Context)this).vm_iv_get(foo1);
    }

    public new void vm_iv_set(MRuby.Symbol foo1, MRuby.Value foo2) {

       ((MRb.Context)this).vm_iv_set(foo1, foo2);
    }

    public new MRuby.Value vm_cv_get(MRuby.Symbol foo1) {

      return  (MRuby.Value)((MRb.Context)this).vm_cv_get(foo1);
    }

    public new void vm_cv_set(MRuby.Symbol foo1, MRuby.Value foo2) {

       ((MRb.Context)this).vm_cv_set(foo1, foo2);
    }

    public new MRuby.Value vm_const_get(MRuby.Symbol foo1) {

      return  (MRuby.Value)((MRb.Context)this).vm_const_get(foo1);
    }

    public new void vm_const_set(MRuby.Symbol foo1, MRuby.Value foo2) {

       ((MRb.Context)this).vm_const_set(foo1, foo2);
    }

    public new MRuby.Value const_get(MRuby.Value foo1, MRuby.Symbol foo2) {

      return  (MRuby.Value)((MRb.Context)this).const_get(foo1, foo2);
    }

    public new void const_set(MRuby.Value foo1, MRuby.Symbol foo2, MRuby.Value foo3) {

       ((MRb.Context)this).const_set(foo1, foo2, foo3);
    }

    public new bool const_defined(MRuby.Value foo1, MRuby.Symbol foo2) {

      return  ((MRb.Context)this).const_defined(foo1, foo2);
    }

    public new void const_remove(MRuby.Value foo1, MRuby.Symbol foo2) {

       ((MRb.Context)this).const_remove(foo1, foo2);
    }

    public new bool iv_p(MRuby.Symbol sym) {

      return  ((MRb.Context)this).iv_p(sym);
    }

    public new void iv_check(MRuby.Symbol sym) {

       ((MRb.Context)this).iv_check(sym);
    }

    public new MRuby.Value iv_get(MRuby.Value obj, MRuby.Symbol sym) {

      return  (MRuby.Value)((MRb.Context)this).iv_get(obj, sym);
    }

    public new void iv_set(MRuby.Value obj, MRuby.Symbol sym, MRuby.Value v) {

       ((MRb.Context)this).iv_set(obj, sym, v);
    }

    public new bool iv_defined(MRuby.Value foo1, MRuby.Symbol foo2) {

      return  ((MRb.Context)this).iv_defined(foo1, foo2);
    }

    public new MRuby.Value iv_remove(MRuby.Value obj, MRuby.Symbol sym) {

      return  (MRuby.Value)((MRb.Context)this).iv_remove(obj, sym);
    }

    public new void iv_copy(MRuby.Value dst, MRuby.Value src) {

       ((MRb.Context)this).iv_copy(dst, src);
    }

    public new bool const_defined_at(MRuby.Value mod, MRuby.Symbol id) {

      return  ((MRb.Context)this).const_defined_at(mod, id);
    }

    public new MRuby.Value gv_get(MRuby.Symbol sym) {

      return  (MRuby.Value)((MRb.Context)this).gv_get(sym);
    }

    public new void gv_set(MRuby.Symbol sym, MRuby.Value val) {

       ((MRb.Context)this).gv_set(sym, val);
    }

    public new void gv_remove(MRuby.Symbol sym) {

       ((MRb.Context)this).gv_remove(sym);
    }

    public new MRuby.Value cv_get(MRuby.Value mod, MRuby.Symbol sym) {

      return  (MRuby.Value)((MRb.Context)this).cv_get(mod, sym);
    }

    public new void cv_set(MRuby.Value mod, MRuby.Symbol sym, MRuby.Value v) {

       ((MRb.Context)this).cv_set(mod, sym, v);
    }

    public new bool cv_defined(MRuby.Value mod, MRuby.Symbol sym) {

      return  ((MRb.Context)this).cv_defined(mod, sym);
    }

    public new MRuby.Value mod_constants(MRuby.Value mod) {

      return  (MRuby.Value)((MRb.Context)this).mod_constants(mod);
    }

    public new MRuby.Value f_global_variables(MRuby.Value self) {

      return  (MRuby.Value)((MRb.Context)this).f_global_variables(self);
    }

    public new MRuby.Value obj_instance_variables(MRuby.Value foo1) {

      return  (MRuby.Value)((MRb.Context)this).obj_instance_variables(foo1);
    }

    public new MRuby.Value mod_class_variables(MRuby.Value foo1) {

      return  (MRuby.Value)((MRb.Context)this).mod_class_variables(foo1);
    }

    public new MRuby.Symbol class_sym(void* c, void* outer) {

      return  (MRuby.Symbol)((MRb.Context)this).class_sym(c, outer);
    }

    public new void gc_mark_gv() {

       ((MRb.Context)this).gc_mark_gv();
    }

    public new void gc_free_gv() {

       ((MRb.Context)this).gc_free_gv();
    }

    public new MRuby.Value hash_new() {

      return  (MRuby.Value)((MRb.Context)this).hash_new();
    }

    public new void hash_set(MRuby.Value hash, MRuby.Value key, MRuby.Value val) {

       ((MRb.Context)this).hash_set(hash, key, val);
    }

    public new MRuby.Value hash_get(MRuby.Value hash, MRuby.Value key) {

      return  (MRuby.Value)((MRb.Context)this).hash_get(hash, key);
    }

    public new MRuby.Value hash_fetch(MRuby.Value hash, MRuby.Value key, MRuby.Value def) {

      return  (MRuby.Value)((MRb.Context)this).hash_fetch(hash, key, def);
    }

    public new MRuby.Value hash_delete_key(MRuby.Value hash, MRuby.Value key) {

      return  (MRuby.Value)((MRb.Context)this).hash_delete_key(hash, key);
    }

    public new MRuby.Value hash_keys(MRuby.Value hash) {

      return  (MRuby.Value)((MRb.Context)this).hash_keys(hash);
    }

    public new MRuby.Value check_hash_type(MRuby.Value hash) {

      return  (MRuby.Value)((MRb.Context)this).check_hash_type(hash);
    }

    public new MRuby.Value hash_empty_p(MRuby.Value self) {

      return  (MRuby.Value)((MRb.Context)this).hash_empty_p(self);
    }

    public new MRuby.Value hash_clear(MRuby.Value hash) {

      return  (MRuby.Value)((MRb.Context)this).hash_clear(hash);
    }

    public new MRuby.Value flo_to_fixnum(MRuby.Value val) {

      return  (MRuby.Value)((MRb.Context)this).flo_to_fixnum(val);
    }

    public new MRuby.Value float_to_str(MRuby.Value x, string fmt) {

      return  (MRuby.Value)((MRb.Context)this).float_to_str(x, fmt);
    }

    public new MRuby.Value fixnum_plus(MRuby.Value x, MRuby.Value y) {

      return  (MRuby.Value)((MRb.Context)this).fixnum_plus(x, y);
    }

    public new MRuby.Value fixnum_minus(MRuby.Value x, MRuby.Value y) {

      return  (MRuby.Value)((MRb.Context)this).fixnum_minus(x, y);
    }

    public new MRuby.Value fixnum_mul(MRuby.Value x, MRuby.Value y) {

      return  (MRuby.Value)((MRb.Context)this).fixnum_mul(x, y);
    }

    public new MRuby.Value num_div(MRuby.Value x, MRuby.Value y) {

      return  (MRuby.Value)((MRb.Context)this).num_div(x, y);
    }

    public new void* proc_new_cfunc(mrb_func foo1) {

      return  ((MRb.Context)this).proc_new_cfunc(foo1);
    }

    public new MRuby.Value f_send(MRuby.Value self) {

      return  (MRuby.Value)((MRb.Context)this).f_send(self);
    }

    public new MRuby.Value proc_cfunc_env_get(int foo1) {

      return  (MRuby.Value)((MRb.Context)this).proc_cfunc_env_get(foo1);
    }

    public new MRuby.Value ary_new_capa(int foo1) {

      return  (MRuby.Value)((MRb.Context)this).ary_new_capa(foo1);
    }

    public new MRuby.Value ary_new() {

      return  (MRuby.Value)((MRb.Context)this).ary_new();
    }

    public new MRuby.Value ary_new_from_values(int size, MRuby.Value[] vals) {

      return  (MRuby.Value)((MRb.Context)this).ary_new_from_values(size, (MRb.Value[])vals);
    }

    public new MRuby.Value assoc_new(MRuby.Value car, MRuby.Value cdr) {

      return  (MRuby.Value)((MRb.Context)this).assoc_new(car, cdr);
    }

    public new void ary_concat(MRuby.Value foo1, MRuby.Value foo2) {

       ((MRb.Context)this).ary_concat(foo1, foo2);
    }

    public new MRuby.Value ary_splat(MRuby.Value foo1) {

      return  (MRuby.Value)((MRb.Context)this).ary_splat(foo1);
    }

    public new void ary_push(MRuby.Value foo1, MRuby.Value foo2) {

       ((MRb.Context)this).ary_push(foo1, foo2);
    }

    public new MRuby.Value ary_pop(MRuby.Value ary) {

      return  (MRuby.Value)((MRb.Context)this).ary_pop(ary);
    }

    public new MRuby.Value ary_ref(MRuby.Value ary, int n) {

      return  (MRuby.Value)((MRb.Context)this).ary_ref(ary, n);
    }

    public new void ary_set(MRuby.Value ary, int n, MRuby.Value val) {

       ((MRb.Context)this).ary_set(ary, n, val);
    }

    public new void ary_replace(MRuby.Value a, MRuby.Value b) {

       ((MRb.Context)this).ary_replace(a, b);
    }

    public new MRuby.Value check_array_type(MRuby.Value self) {

      return  (MRuby.Value)((MRb.Context)this).check_array_type(self);
    }

    public new MRuby.Value ary_unshift(MRuby.Value self, MRuby.Value item) {

      return  (MRuby.Value)((MRb.Context)this).ary_unshift(self, item);
    }

    public new MRuby.Value ary_shift(MRuby.Value self) {

      return  (MRuby.Value)((MRb.Context)this).ary_shift(self);
    }

    public new MRuby.Value ary_clear(MRuby.Value self) {

      return  (MRuby.Value)((MRb.Context)this).ary_clear(self);
    }

    public new MRuby.Value ary_join(MRuby.Value ary, MRuby.Value sep) {

      return  (MRuby.Value)((MRb.Context)this).ary_join(ary, sep);
    }

    public new MRuby.Value ary_resize(MRuby.Value ary, int len) {

      return  (MRuby.Value)((MRb.Context)this).ary_resize(ary, len);
    }

    public new void str_concat(MRuby.Value foo1, MRuby.Value foo2) {

       ((MRb.Context)this).str_concat(foo1, foo2);
    }

    public new MRuby.Value str_plus(MRuby.Value foo1, MRuby.Value foo2) {

      return  (MRuby.Value)((MRb.Context)this).str_plus(foo1, foo2);
    }

    public new MRuby.Value ptr_to_str(void* foo1) {

      return  (MRuby.Value)((MRb.Context)this).ptr_to_str(foo1);
    }

    public new MRuby.Value obj_as_string(MRuby.Value obj) {

      return  (MRuby.Value)((MRb.Context)this).obj_as_string(obj);
    }

    public new MRuby.Value str_resize(MRuby.Value str, int len) {

      return  (MRuby.Value)((MRb.Context)this).str_resize(str, len);
    }

    public new MRuby.Value str_substr(MRuby.Value str, int beg, int len) {

      return  (MRuby.Value)((MRb.Context)this).str_substr(str, beg, len);
    }

    public new MRuby.Value string_type(MRuby.Value str) {

      return  (MRuby.Value)((MRb.Context)this).string_type(str);
    }

    public new MRuby.Value check_string_type(MRuby.Value str) {

      return  (MRuby.Value)((MRb.Context)this).check_string_type(str);
    }

    public new MRuby.Value str_buf_new(size_t capa) {

      return  (MRuby.Value)((MRb.Context)this).str_buf_new(capa);
    }

    public new string string_value_ptr(MRuby.Value ptr) {

      return  ((MRb.Context)this).string_value_ptr(ptr);
    }

    public new MRuby.Value str_dup(MRuby.Value str) {

      return  (MRuby.Value)((MRb.Context)this).str_dup(str);
    }

    public new MRuby.Value str_intern(MRuby.Value self) {

      return  (MRuby.Value)((MRb.Context)this).str_intern(self);
    }

    public new MRuby.Value str_to_inum(MRuby.Value str, int _base, bool badcheck) {

      return  (MRuby.Value)((MRb.Context)this).str_to_inum(str, _base, badcheck);
    }

    public new MRuby.Value str_to_str(MRuby.Value str) {

      return  (MRuby.Value)((MRb.Context)this).str_to_str(str);
    }

    public new bool str_equal(MRuby.Value str1, MRuby.Value str2) {

      return  ((MRb.Context)this).str_equal(str1, str2);
    }

    public new MRuby.Value str_cat(MRuby.Value str, string ptr, size_t len) {

      return  (MRuby.Value)((MRb.Context)this).str_cat(str, ptr, len);
    }

    public new MRuby.Value str_cat_cstr(MRuby.Value str, string ptr) {

      return  (MRuby.Value)((MRb.Context)this).str_cat_cstr(str, ptr);
    }

    public new MRuby.Value str_cat_str(MRuby.Value str, MRuby.Value str2) {

      return  (MRuby.Value)((MRb.Context)this).str_cat_str(str, str2);
    }

    public new MRuby.Value str_append(MRuby.Value str, MRuby.Value str2) {

      return  (MRuby.Value)((MRb.Context)this).str_append(str, str2);
    }

    public new char* str_to_cstr(MRuby.Value str) {

      return  ((MRb.Context)this).str_to_cstr(str);
    }

    public new MRuby.Value str_pool(MRuby.Value str) {

      return  (MRuby.Value)((MRb.Context)this).str_pool(str);
    }

    public new int str_hash(MRuby.Value str) {

      return  ((MRb.Context)this).str_hash(str);
    }

    public new MRuby.Value str_dump(MRuby.Value str) {

      return  (MRuby.Value)((MRb.Context)this).str_dump(str);
    }

    public new MRuby.Value str_inspect(MRuby.Value str) {

      return  (MRuby.Value)((MRb.Context)this).str_inspect(str);
    }

    public new void noregexp(MRuby.Value self) {

       ((MRb.Context)this).noregexp(self);
    }

    public new void regexp_check(MRuby.Value obj) {

       ((MRb.Context)this).regexp_check(obj);
    }

    public new void* define_class_id(MRuby.Symbol foo1, void* foo2) {

      return  ((MRb.Context)this).define_class_id(foo1, foo2);
    }

    public new void* define_module_id(MRuby.Symbol foo1) {

      return  ((MRb.Context)this).define_module_id(foo1);
    }

    public new void* vm_define_class(MRuby.Value foo1, MRuby.Value foo2, MRuby.Symbol foo3) {

      return  ((MRb.Context)this).vm_define_class(foo1, foo2, foo3);
    }

    public new void* vm_define_module(MRuby.Value foo1, MRuby.Symbol foo2) {

      return  ((MRb.Context)this).vm_define_module(foo1, foo2);
    }

    public new void define_method_raw(void* foo1, MRuby.Symbol foo2, void* foo3) {

       ((MRb.Context)this).define_method_raw(foo1, foo2, foo3);
    }

    public new void define_method_id(void* c, MRuby.Symbol mid, mrb_func func, uint32 aspec) {

       ((MRb.Context)this).define_method_id(c, mid, func, aspec);
    }

    public new void alias_method(void* c, MRuby.Symbol a, MRuby.Symbol b) {

       ((MRb.Context)this).alias_method(c, a, b);
    }

    public new void* class_outer_module(void* foo1) {

      return  ((MRb.Context)this).class_outer_module(foo1);
    }

    public new void* method_search(void* foo1, MRuby.Symbol foo2) {

      return  ((MRb.Context)this).method_search(foo1, foo2);
    }

    public new void gc_mark_mt(void* foo1) {

       ((MRb.Context)this).gc_mark_mt(foo1);
    }

    public new size_t gc_mark_mt_size(void* foo1) {

      return  ((MRb.Context)this).gc_mark_mt_size(foo1);
    }

    public new void gc_free_mt(void* foo1) {

       ((MRb.Context)this).gc_free_mt(foo1);
    }

    public new MRuby.Value range_new(MRuby.Value foo1, MRuby.Value foo2, bool foo3) {

      return  (MRuby.Value)((MRb.Context)this).range_new(foo1, foo2, foo3);
    }

    public new void sys_fail(string mesg) {

       ((MRb.Context)this).sys_fail(mesg);
    }

    public new MRuby.Value exc_new_str(void* c, MRuby.Value str) {

      return  (MRuby.Value)((MRb.Context)this).exc_new_str(c, str);
    }

    public new MRuby.Value exc_backtrace(MRuby.Value exc) {

      return  (MRuby.Value)((MRb.Context)this).exc_backtrace(exc);
    }

    public new MRuby.Value get_backtrace() {

      return  (MRuby.Value)((MRb.Context)this).get_backtrace();
    }

    public new MRuby.Value f_raise(MRuby.Value foo1) {

      return  (MRuby.Value)((MRb.Context)this).f_raise(foo1);
    }

    public new void* define_class(string foo1, void* foo2) {

      return  ((MRb.Context)this).define_class(foo1, foo2);
    }

    public new void* define_module(string foo1) {

      return  ((MRb.Context)this).define_module(foo1);
    }

    public new MRuby.Value singleton_class(MRuby.Value foo1) {

      return  (MRuby.Value)((MRb.Context)this).singleton_class(foo1);
    }

    public new void include_module(void* foo1, void* foo2) {

       ((MRb.Context)this).include_module(foo1, foo2);
    }

    public new void define_class_method(void* foo1, string foo2, mrb_func foo3, uint32 foo4) {

       ((MRb.Context)this).define_class_method(foo1, foo2, foo3, foo4);
    }

    public new void define_module_function(void* foo1, string foo2, mrb_func foo3, uint32 foo4) {

       ((MRb.Context)this).define_module_function(foo1, foo2, foo3, foo4);
    }

    public new void define_const(void* foo1, string name, MRuby.Value foo2) {

       ((MRb.Context)this).define_const(foo1, name, foo2);
    }

    public new void undef_method(void* foo1, string foo2) {

       ((MRb.Context)this).undef_method(foo1, foo2);
    }

    public new void undef_class_method(void* foo1, string foo2) {

       ((MRb.Context)this).undef_class_method(foo1, foo2);
    }

    public new MRuby.Value instance_new(MRuby.Value cv) {

      return  (MRuby.Value)((MRb.Context)this).instance_new(cv);
    }

    public new void* class_new(void* super) {

      return  ((MRb.Context)this).class_new(super);
    }

    public new void* module_new() {

      return  ((MRb.Context)this).module_new();
    }

    public new bool class_defined(string name) {

      return  ((MRb.Context)this).class_defined(name);
    }

    public new void* class_get_under(void* outer, string name) {

      return  ((MRb.Context)this).class_get_under(outer, name);
    }

    public new void* module_get_under(void* outer, string name) {

      return  ((MRb.Context)this).module_get_under(outer, name);
    }

    public new MRuby.Value notimplement_m(MRuby.Value foo1) {

      return  (MRuby.Value)((MRb.Context)this).notimplement_m(foo1);
    }

    public new MRuby.Value obj_dup(MRuby.Value obj) {

      return  (MRuby.Value)((MRb.Context)this).obj_dup(obj);
    }

    public new MRuby.Value check_to_integer(MRuby.Value val, string method) {

      return  (MRuby.Value)((MRb.Context)this).check_to_integer(val, method);
    }

    public new bool obj_respond_to(void* c, MRuby.Symbol mid) {

      return  ((MRb.Context)this).obj_respond_to(c, mid);
    }

    public new void* define_class_under(void* outer, string name, void* super) {

      return  ((MRb.Context)this).define_class_under(outer, name, super);
    }

    public new void* define_module_under(void* outer, string name) {

      return  ((MRb.Context)this).define_module_under(outer, name);
    }

    public new MRuby.Value funcall_argv(MRuby.Value foo1, MRuby.Symbol foo2, int foo3, MRuby.Value[] foo4) {

      return  (MRuby.Value)((MRb.Context)this).funcall_argv(foo1, foo2, foo3, (MRb.Value[])foo4);
    }

    public new MRuby.Value funcall_with_block(MRuby.Value foo1, MRuby.Symbol foo2, int foo3, MRuby.Value[] foo4, MRuby.Value foo5) {

      return  (MRuby.Value)((MRb.Context)this).funcall_with_block(foo1, foo2, foo3, (MRb.Value[])foo4, foo5);
    }

    public new MRuby.Symbol intern_cstr(string foo1) {

      return  (MRuby.Symbol)((MRb.Context)this).intern_cstr(foo1);
    }

    public new MRuby.Symbol intern(string foo1, size_t foo2) {

      return  (MRuby.Symbol)((MRb.Context)this).intern(foo1, foo2);
    }

    public new MRuby.Symbol intern_static(string foo1, size_t foo2) {

      return  (MRuby.Symbol)((MRb.Context)this).intern_static(foo1, foo2);
    }

    public new MRuby.Symbol intern_str(MRuby.Value foo1) {

      return  (MRuby.Symbol)((MRb.Context)this).intern_str(foo1);
    }

    public new MRuby.Value check_intern_cstr(string foo1) {

      return  (MRuby.Value)((MRb.Context)this).check_intern_cstr(foo1);
    }

    public new MRuby.Value check_intern(string foo1, size_t foo2) {

      return  (MRuby.Value)((MRb.Context)this).check_intern(foo1, foo2);
    }

    public new MRuby.Value check_intern_str(MRuby.Value foo1) {

      return  (MRuby.Value)((MRb.Context)this).check_intern_str(foo1);
    }

    public new string sym2name(MRuby.Symbol foo1) {

      return  ((MRb.Context)this).sym2name(foo1);
    }

    public new MRuby.Value sym2str(MRuby.Symbol foo1) {

      return  (MRuby.Value)((MRb.Context)this).sym2str(foo1);
    }

    public new void* malloc(size_t foo1) {

      return  ((MRb.Context)this).malloc(foo1);
    }

    public new void* calloc(size_t foo1, size_t foo2) {

      return  ((MRb.Context)this).calloc(foo1, foo2);
    }

    public new void* realloc(void* foo1, size_t foo2) {

      return  ((MRb.Context)this).realloc(foo1, foo2);
    }

    public new void* realloc_simple(void* foo1, size_t foo2) {

      return  ((MRb.Context)this).realloc_simple(foo1, foo2);
    }

    public new void* malloc_simple(size_t foo1) {

      return  ((MRb.Context)this).malloc_simple(foo1);
    }

    public new void free(void* foo1) {

       ((MRb.Context)this).free(foo1);
    }

    public new MRuby.Value str_new(string p, size_t len) {

      return  (MRuby.Value)((MRb.Context)this).str_new(p, len);
    }

    public new MRuby.Value str_new_cstr(string foo1) {

      return  (MRuby.Value)((MRb.Context)this).str_new_cstr(foo1);
    }

    public new MRuby.Value str_new_static(string p, size_t len) {

      return  (MRuby.Value)((MRb.Context)this).str_new_static(p, len);
    }

    public new void close() {

       ((MRb.Context)this).close();
    }

    public new void* default_allocf(void* foo1, size_t foo2, void* foo3) {

      return  ((MRb.Context)this).default_allocf(foo1, foo2, foo3);
    }

    public new MRuby.Value top_self() {

      return  (MRuby.Value)((MRb.Context)this).top_self();
    }

    public new MRuby.Value run(void* foo1, MRuby.Value foo2) {

      return  (MRuby.Value)((MRb.Context)this).run(foo1, foo2);
    }

    public new MRuby.Value toplevel_run(void* foo1) {

      return  (MRuby.Value)((MRb.Context)this).toplevel_run(foo1);
    }

    public new void p(MRuby.Value foo1) {

       ((MRb.Context)this).p(foo1);
    }

    public new MRuby.Symbol obj_to_sym(MRuby.Value name) {

      return  (MRuby.Symbol)((MRb.Context)this).obj_to_sym(name);
    }

    public new bool obj_eq(MRuby.Value foo1, MRuby.Value foo2) {

      return  ((MRb.Context)this).obj_eq(foo1, foo2);
    }

    public new bool obj_equal(MRuby.Value foo1, MRuby.Value foo2) {

      return  ((MRb.Context)this).obj_equal(foo1, foo2);
    }

    public new bool equal(MRuby.Value obj1, MRuby.Value obj2) {

      return  ((MRb.Context)this).equal(obj1, obj2);
    }

    public new MRuby.Value Integer(MRuby.Value val) {

      return  (MRuby.Value)((MRb.Context)this).Integer(val);
    }

    public new MRuby.Value Float(MRuby.Value val) {

      return  (MRuby.Value)((MRb.Context)this).Float(val);
    }

    public new MRuby.Value inspect(MRuby.Value obj) {

      return  (MRuby.Value)((MRb.Context)this).inspect(obj);
    }

    public new bool eql(MRuby.Value obj1, MRuby.Value obj2) {

      return  ((MRb.Context)this).eql(obj1, obj2);
    }

    public new void garbage_collect() {

       ((MRb.Context)this).garbage_collect();
    }

    public new void full_gc() {

       ((MRb.Context)this).full_gc();
    }

    public new void incremental_gc() {

       ((MRb.Context)this).incremental_gc();
    }

    public new MRuby.Value any_to_s(MRuby.Value obj) {

      return  (MRuby.Value)((MRb.Context)this).any_to_s(obj);
    }

    public new string obj_classname(MRuby.Value obj) {

      return  ((MRb.Context)this).obj_classname(obj);
    }

    public new void* obj_class(MRuby.Value obj) {

      return  ((MRb.Context)this).obj_class(obj);
    }

    public new MRuby.Value class_path(void* c) {

      return  (MRuby.Value)((MRb.Context)this).class_path(c);
    }

    public new bool obj_is_kind_of(MRuby.Value obj, void* c) {

      return  ((MRb.Context)this).obj_is_kind_of(obj, c);
    }

    public new MRuby.Value obj_inspect(MRuby.Value self) {

      return  (MRuby.Value)((MRb.Context)this).obj_inspect(self);
    }

    public new MRuby.Value obj_clone(MRuby.Value self) {

      return  (MRuby.Value)((MRb.Context)this).obj_clone(self);
    }

    public new MRuby.Value exc_new(void* c, string ptr, size_t len) {

      return  (MRuby.Value)((MRb.Context)this).exc_new(c, ptr, len);
    }

    public new void print_backtrace() {

       ((MRb.Context)this).print_backtrace();
    }

    public new void print_error() {

       ((MRb.Context)this).print_error();
    }

    public new MRuby.Value yield(MRuby.Value b, MRuby.Value arg) {

      return  (MRuby.Value)((MRb.Context)this).yield(b, arg);
    }

    public new MRuby.Value yield_argv(MRuby.Value b, int argc, MRuby.Value[] argv) {

      return  (MRuby.Value)((MRb.Context)this).yield_argv(b, argc, (MRb.Value[])argv);
    }

    public new MRuby.Value yield_with_class(MRuby.Value b, int argc, MRuby.Value[] argv, MRuby.Value self, void* c) {

      return  (MRuby.Value)((MRb.Context)this).yield_with_class(b, argc, (MRb.Value[])argv, self, c);
    }

    public new void gc_protect(MRuby.Value obj) {

       ((MRb.Context)this).gc_protect(obj);
    }

    public new MRuby.Value to_int(MRuby.Value val) {

      return  (MRuby.Value)((MRb.Context)this).to_int(val);
    }

    public new void define_alias(void* klass, string name1, string name2) {

       ((MRb.Context)this).define_alias(klass, name1, name2);
    }

    public new string class_name(void* klass) {

      return  ((MRb.Context)this).class_name(klass);
    }

    public new void define_global_const(string name, MRuby.Value val) {

       ((MRb.Context)this).define_global_const(name, val);
    }

    public new MRuby.Value attr_get(MRuby.Value obj, MRuby.Symbol id) {

      return  (MRuby.Value)((MRb.Context)this).attr_get(obj, id);
    }

    public new bool respond_to(MRuby.Value obj, MRuby.Symbol mid) {

      return  ((MRb.Context)this).respond_to(obj, mid);
    }

    public new bool obj_is_instance_of(MRuby.Value obj, void* c) {

      return  ((MRb.Context)this).obj_is_instance_of(obj, c);
    }

    public new MRuby.Value fiber_resume(MRuby.Value fib, int argc, MRuby.Value[] argv) {

      return  (MRuby.Value)((MRb.Context)this).fiber_resume(fib, argc, (MRb.Value[])argv);
    }

    public new MRuby.Value fiber_yield(int argc, MRuby.Value[] argv) {

      return  (MRuby.Value)((MRb.Context)this).fiber_yield(argc, (MRb.Value[])argv);
    }

    public new void* alloca(size_t foo1) {

      return  ((MRb.Context)this).alloca(foo1);
    }

    public new void show_version() {

       ((MRb.Context)this).show_version();
    }

    public new void show_copyright() {

       ((MRb.Context)this).show_copyright();
    }

  }
}

