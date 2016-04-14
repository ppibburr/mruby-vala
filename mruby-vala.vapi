/* mruby-vala.vapi generated by valac 0.28.1, do not modify. */

namespace MRuby {
	[CCode (cheader_filename = "mruby_vala.h")]
	public class Array : MRuby.Object {
		public Array (MRuby.Context mrb);
		public MRuby.Object clear (MRuby.Context? ctx = null);
		public void concat (MRuby.Object foo2, MRuby.Context? ctx = null);
		public MRuby.Object context_get (int idx, MRuby.Context? c = null);
		public void context_set (int i, MRuby.Value val, MRuby.Context? ctx = null);
		public Array.from (MRb.Value act, MRuby.Context? c = null);
		public new MRuby.Object @get (int i);
		public MRuby.Object join (MRuby.Object sep, MRuby.Context? ctx = null);
		public MRuby.Object pop (MRuby.Context? ctx = null);
		public void push (MRuby.Object foo2, MRuby.Context? ctx = null);
		public void replace (MRuby.Object b, MRuby.Context? ctx = null);
		public MRuby.Object resize (int len, MRuby.Context? ctx = null);
		public new void @set (int i, MRuby.Value v);
		public MRuby.Object shift (MRuby.Context? ctx = null);
		public MRuby.Object splat (MRuby.Context? ctx = null);
		public MRuby.Object unshift (MRuby.Object item, MRuby.Context? ctx = null);
		public int length { get; }
		public int size { get; }
	}
	[CCode (cheader_filename = "mruby_vala.h")]
	public class Class : MRuby.Module {
		public Class (void* pointer);
		public Class.create (MRuby.Context mrb, MRuby.Class? super = null);
		public Class.define (MRuby.Context mrb, string name, MRuby.Class? super = null, MRuby.Module? under = null);
		public Class.@get (MRuby.Context mrb, string name);
	}
	[CCode (cheader_filename = "mruby_vala.h")]
	public class Context : MRb.Context {
		public Context ();
		public new MRuby.Object Float (MRuby.Value val);
		public new MRuby.Object Integer (MRuby.Value val);
		public new void alias_method (void* c, MRuby.Symbol a, MRuby.Symbol b);
		public new void* alloca (size_t foo1);
		public new MRuby.Object any_to_s (MRuby.Value obj);
		public MRuby.Value[] args (out int len);
		public new MRuby.Object ary_clear (MRuby.Value self);
		public new void ary_concat (MRuby.Value foo1, MRuby.Value foo2);
		public new MRuby.Object ary_join (MRuby.Value ary, MRuby.Value sep);
		public new int ary_len (MRuby.Value val);
		public new MRuby.Array ary_new ();
		public new MRuby.Object ary_new_capa (int foo1);
		public new MRuby.Array ary_new_from_values (int size, MRuby.Value[] vals);
		public new MRuby.Object ary_pop (MRuby.Value ary);
		public new void ary_push (MRuby.Value foo1, MRuby.Value foo2);
		public new MRuby.Object ary_ref (MRuby.Value ary, int n);
		public new void ary_replace (MRuby.Value a, MRuby.Value b);
		public new MRuby.Object ary_resize (MRuby.Value ary, int len);
		public new void ary_set (MRuby.Value ary, int n, MRuby.Value val);
		public new MRuby.Object ary_shift (MRuby.Value self);
		public new MRuby.Object ary_splat (MRuby.Value foo1);
		public new MRuby.Object ary_unshift (MRuby.Value self, MRuby.Value item);
		public new MRuby.Object assoc_new (MRuby.Value car, MRuby.Value cdr);
		public new MRuby.Object attr_get (MRuby.Value obj, MRuby.Symbol id);
		public new void* calloc (size_t foo1, size_t foo2);
		public new MRuby.Object check_array_type (MRuby.Value self);
		public new MRuby.Object check_hash_type (MRuby.Value hash);
		public new MRuby.Object check_intern (string foo1, size_t foo2);
		public new MRuby.Object check_intern_cstr (string foo1);
		public new MRuby.Object check_intern_str (MRuby.Value foo1);
		public new MRuby.Object check_string_type (MRuby.Value str);
		public new MRuby.Object check_to_integer (MRuby.Value val, string method);
		public new bool class_defined (string name);
		public new MRuby.Class class_get (string name);
		public new void* class_get_under (void* outer, string name);
		public new string class_name (void* klass);
		public new void* class_new (void* super);
		public new void* class_outer_module (void* foo1);
		public new MRuby.Object class_path (void* c);
		public new MRuby.Symbol class_sym (void* c, void* outer);
		public new void close ();
		public new bool const_defined (MRuby.Value foo1, MRuby.Symbol foo2);
		public new bool const_defined_at (MRuby.Value mod, MRuby.Symbol id);
		public new MRuby.Object const_get (MRuby.Value foo1, MRuby.Symbol foo2);
		public new void const_remove (MRuby.Value foo1, MRuby.Symbol foo2);
		public new void const_set (MRuby.Value foo1, MRuby.Symbol foo2, MRuby.Value foo3);
		public new MRuby.Object cptr_value (void* val);
		public new bool cv_defined (MRuby.Value mod, MRuby.Symbol sym);
		public new MRuby.Object cv_get (MRuby.Value mod, MRuby.Symbol sym);
		public new void cv_set (MRuby.Value mod, MRuby.Symbol sym, MRuby.Value v);
		public new void* default_allocf (void* foo1, size_t foo2, void* foo3);
		public new void define_alias (void* klass, string name1, string name2);
		public new void* define_class (string foo1, void* foo2);
		public new void* define_class_id (MRuby.Symbol foo1, void* foo2);
		public new void define_class_method (void* foo1, string foo2, MRb.mrb_func foo3, uint32 foo4);
		public new void* define_class_under (void* outer, string name, void* super);
		public new void define_const (void* foo1, string name, MRuby.Value foo2);
		public new void define_global_const (string name, MRuby.Value val);
		public new void define_method (string name, MRuby.FuncCB cb);
		public new void define_method_id (void* c, MRuby.Symbol mid, MRb.mrb_func func, uint32 aspec);
		public new void define_method_raw (void* foo1, MRuby.Symbol foo2, void* foo3);
		public new void* define_module (string foo1);
		public new void define_module_function (void* foo1, string foo2, MRb.mrb_func foo3, uint32 foo4);
		public new void* define_module_id (MRuby.Symbol foo1);
		public new void* define_module_under (void* outer, string name);
		public new bool eql (MRuby.Value obj1, MRuby.Value obj2);
		public new bool equal (MRuby.Value obj1, MRuby.Value obj2);
		public new MRuby.Object exc_backtrace (MRuby.Value exc);
		public new MRuby.Object exc_new (void* c, string ptr, size_t len);
		public new MRuby.Object exc_new_str (void* c, MRuby.Value str);
		public new MRuby.Object f_global_variables (MRuby.Value self);
		public new MRuby.Object f_raise (MRuby.Value foo1);
		public new MRuby.Object f_send (MRuby.Value self);
		public new MRuby.Object fiber_resume (MRuby.Value fib, int argc, MRuby.Value[] argv);
		public new MRuby.Object fiber_yield (int argc, MRuby.Value[] argv);
		public new MRuby.Object fixnum_minus (MRuby.Value x, MRuby.Value y);
		public new MRuby.Object fixnum_mul (MRuby.Value x, MRuby.Value y);
		public new MRuby.Object fixnum_plus (MRuby.Value x, MRuby.Value y);
		public new MRuby.Object flo_to_fixnum (MRuby.Value val);
		public new MRuby.Object float_to_str (MRuby.Value x, string fmt);
		public new MRuby.Object float_value (float val);
		public new void free (void* foo1);
		public new void full_gc ();
		public new MRuby.Object funcall_argv (MRuby.Value foo1, MRuby.Symbol foo2, int foo3, MRuby.Value[] foo4);
		public new MRuby.Object funcall_with_block (MRuby.Value foo1, MRuby.Symbol foo2, int foo3, MRuby.Value[] foo4, MRuby.Value foo5);
		public new void garbage_collect ();
		public new void gc_free_gv ();
		public new void gc_free_mt (void* foo1);
		public new void gc_mark_gv ();
		public new void gc_mark_mt (void* foo1);
		public new size_t gc_mark_mt_size (void* foo1);
		public new void gc_protect (MRuby.Value obj);
		public new MRuby.Object get_backtrace ();
		public new MRuby.Object gv_get (MRuby.Symbol sym);
		public new void gv_remove (MRuby.Symbol sym);
		public new void gv_set (MRuby.Symbol sym, MRuby.Value val);
		public new MRuby.Object hash_clear (MRuby.Value hash);
		public new MRuby.Object hash_delete_key (MRuby.Value hash, MRuby.Value key);
		public new MRuby.Object hash_empty_p (MRuby.Value self);
		public new MRuby.Object hash_fetch (MRuby.Value hash, MRuby.Value key, MRuby.Value def);
		public new MRuby.Object hash_get (MRuby.Value hash, MRuby.Value key);
		public new MRuby.Object hash_keys (MRuby.Value hash);
		public new MRuby.Object hash_new ();
		public new void hash_set (MRuby.Value hash, MRuby.Value key, MRuby.Value val);
		public new void include_module (void* foo1, void* foo2);
		public new void incremental_gc ();
		public new MRuby.Object inspect (MRuby.Value obj);
		public new MRuby.Object instance_new (MRuby.Value cv);
		public new MRuby.Symbol intern (string foo1, size_t foo2);
		public new MRuby.Symbol intern_cstr (string foo1);
		public new MRuby.Symbol intern_static (string foo1, size_t foo2);
		public new MRuby.Symbol intern_str (MRuby.Value foo1);
		public new void iv_check (MRuby.Symbol sym);
		public new void iv_copy (MRuby.Value dst, MRuby.Value src);
		public new bool iv_defined (MRuby.Value foo1, MRuby.Symbol foo2);
		public new MRuby.Object iv_get (MRuby.Value obj, MRuby.Symbol sym);
		public new bool iv_p (MRuby.Symbol sym);
		public new MRuby.Object iv_remove (MRuby.Value obj, MRuby.Symbol sym);
		public new void iv_set (MRuby.Value obj, MRuby.Symbol sym, MRuby.Value v);
		public new MRuby.Object? load_string (string str);
		public new void* malloc (size_t foo1);
		public new void* malloc_simple (size_t foo1);
		public new void* method_search (void* foo1, MRuby.Symbol foo2);
		public new MRuby.Object mod_class_variables (MRuby.Value foo1);
		public new MRuby.Object mod_constants (MRuby.Value mod);
		public new MRuby.Module module_get (string name);
		public new void* module_get_under (void* outer, string name);
		public new void* module_new ();
		public new void noregexp (MRuby.Value self);
		public new MRuby.Object notimplement_m (MRuby.Value foo1);
		public new MRuby.Object num_div (MRuby.Value x, MRuby.Value y);
		public new MRuby.String obj_as_string (MRuby.Value obj);
		public new void* obj_class (MRuby.Value obj);
		public new string obj_classname (MRuby.Value obj);
		public new MRuby.Object obj_clone (MRuby.Value self);
		public new MRuby.Object obj_dup (MRuby.Value obj);
		public new bool obj_eq (MRuby.Value foo1, MRuby.Value foo2);
		public new bool obj_equal (MRuby.Value foo1, MRuby.Value foo2);
		public new MRuby.Object obj_inspect (MRuby.Value self);
		public new MRuby.Object obj_instance_variables (MRuby.Value foo1);
		public new bool obj_is_instance_of (MRuby.Value obj, void* c);
		public new bool obj_is_kind_of (MRuby.Value obj, void* c);
		public new MRuby.Object obj_new (void* cls, MRuby.Value[] argv = new MRuby.Value[0] { });
		public new bool obj_respond_to (void* c, MRuby.Symbol mid);
		public new MRuby.Symbol obj_to_sym (MRuby.Value name);
		public new void p (MRuby.Value foo1);
		public new void print_backtrace ();
		public new void print_error ();
		public new MRuby.Object proc_cfunc_env_get (int foo1);
		public new void* proc_new_cfunc (MRb.mrb_func foo1);
		public new MRuby.Object ptr_to_str (void* foo1);
		public new MRuby.Object range_new (MRuby.Value foo1, MRuby.Value foo2, bool foo3);
		public new void* realloc (void* foo1, size_t foo2);
		public new void* realloc_simple (void* foo1, size_t foo2);
		public new void regexp_check (MRuby.Value obj);
		public new bool respond_to (MRuby.Value obj, MRuby.Symbol mid);
		public new MRuby.Object run (void* foo1, MRuby.Value foo2);
		public new void show_copyright ();
		public new void show_version ();
		public new MRuby.Object singleton_class (MRuby.Value foo1);
		public new MRuby.Object str_append (MRuby.Value str, MRuby.Value str2);
		public new MRuby.Object str_buf_new (size_t capa);
		public new MRuby.Object str_cat (MRuby.Value str, string ptr, size_t len);
		public new MRuby.Object str_cat_cstr (MRuby.Value str, string ptr);
		public new MRuby.Object str_cat_str (MRuby.Value str, MRuby.Value str2);
		public new void str_concat (MRuby.Value foo1, MRuby.Value foo2);
		public new MRuby.Object str_dump (MRuby.Value str);
		public new MRuby.Object str_dup (MRuby.Value str);
		public new bool str_equal (MRuby.Value str1, MRuby.Value str2);
		public new int str_hash (MRuby.Value str);
		public new MRuby.Object str_inspect (MRuby.Value str);
		public new MRuby.Object str_intern (MRuby.Value self);
		public new MRuby.Object str_new (string p, size_t len);
		public new MRuby.String str_new_cstr (string foo1);
		public new MRuby.Object str_new_static (string p, size_t len);
		public new MRuby.Object str_plus (MRuby.Value foo1, MRuby.Value foo2);
		public new MRuby.Object str_pool (MRuby.Value str);
		public new MRuby.Object str_resize (MRuby.Value str, int len);
		public new MRuby.Object str_substr (MRuby.Value str, int beg, int len);
		public new char* str_to_cstr (MRuby.Value str);
		public new MRuby.Object str_to_inum (MRuby.Value str, int _base, bool badcheck);
		public new MRuby.Object str_to_str (MRuby.Value str);
		public new MRuby.Object string_type (MRuby.Value str);
		public new string string_value_ptr (MRuby.Value ptr);
		public new string sym2name (MRuby.Symbol foo1);
		public new MRuby.Object sym2str (MRuby.Symbol foo1);
		public new void sys_fail (string mesg);
		public new float to_flo (MRuby.Value x);
		public new MRuby.Object to_int (MRuby.Value val);
		public new MRuby.Object top_self ();
		public new MRuby.Object toplevel_run (void* foo1);
		public new void undef_class_method (void* foo1, string foo2);
		public new void undef_method (void* foo1, string foo2);
		public new MRuby.Object vm_const_get (MRuby.Symbol foo1);
		public new void vm_const_set (MRuby.Symbol foo1, MRuby.Value foo2);
		public new MRuby.Object vm_cv_get (MRuby.Symbol foo1);
		public new void vm_cv_set (MRuby.Symbol foo1, MRuby.Value foo2);
		public new void* vm_define_class (MRuby.Value foo1, MRuby.Value foo2, MRuby.Symbol foo3);
		public new void* vm_define_module (MRuby.Value foo1, MRuby.Symbol foo2);
		public new MRuby.Object vm_iv_get (MRuby.Symbol foo1);
		public new void vm_iv_set (MRuby.Symbol foo1, MRuby.Value foo2);
		public new MRuby.Object vm_special_get (MRuby.Symbol foo1);
		public new void vm_special_set (MRuby.Symbol foo1, MRuby.Value foo2);
		public new MRuby.Object @yield (MRuby.Value b, MRuby.Value arg);
		public new MRuby.Object yield_argv (MRuby.Value b, int argc, MRuby.Value[] argv);
		public new MRuby.Object yield_with_class (MRuby.Value b, int argc, MRuby.Value[] argv, MRuby.Value self, void* c);
		public MRb.Context _base_ { get; }
	}
	[CCode (cheader_filename = "mruby_vala.h")]
	public class MRbFuncEnv : GLib.Object {
		public MRuby.FuncCB fun;
		public MRbFuncEnv (MRuby.FuncCB cb);
	}
	[CCode (cheader_filename = "mruby_vala.h")]
	public class Module : GLib.Object {
		public Module (void* pointer);
		public Module.create (MRuby.Context mrb);
		public Module.define (MRuby.Context mrb, string name, MRuby.Module? under = null);
		public void define_method (MRuby.Context mrb, string name, MRuby.FuncCB cb);
		public void define_static_method (MRuby.Context mrb, string name, MRuby.FuncCB cb);
		public Module.from_value (MRuby.Value value);
		public Module.@get (MRuby.Context mrb, string name);
		public MRuby.Value get_value ();
		public static MRuby.Value invoke_func_with_env (MRuby.Context mrb, MRuby.Value self);
		public void* pointer { get; set construct; }
	}
	[CCode (cheader_filename = "mruby_vala.h")]
	public class Object : MRuby.Value {
		public Object (MRuby.Context mrb, void* cls, MRuby.Value[] argv);
		public MRuby.String as_string (MRuby.Context? ctx = null);
		public void* @class (MRuby.Context? ctx = null);
		public string classname (MRuby.Context? ctx = null);
		public MRuby.Object clone (MRuby.Context? c = null);
		public MRuby.Object dup (MRuby.Context? c = null);
		public bool eq (MRuby.Object foo2, MRuby.Context? ctx = null);
		public bool equal (MRuby.Object foo2, MRuby.Context? ctx = null);
		public Object.from (MRb.Value act, MRuby.Context? mrb = null);
		public MRuby.Object inspect (MRuby.Context? ctx = null);
		public MRuby.Object instance_variables (MRuby.Context? ctx = null);
		public bool is_instance_of (void* c, MRuby.Context? ctx = null);
		public bool is_kind_of (void* c, MRuby.Context? ctx = null);
		public bool respond_to (MRuby.Symbol mid, MRuby.Context? ctx = null);
		public MRuby.Symbol to_sym (MRuby.Context? ctx = null);
	}
	[CCode (cheader_filename = "mruby_vala.h")]
	public class String : MRuby.Object {
		public String (MRuby.Context mrb, string cstr);
		public String.from (MRb.Value act, MRuby.Context? mrb = null);
	}
	[CCode (cheader_filename = "mruby_vala.h")]
	public class Value : GLib.Object {
		public MRb.Value actual;
		public weak MRuby.Context mrb;
		public Value (MRb.Value act, MRuby.Context? mrb = null);
		public unowned MRuby.Context? get_context (MRuby.Context? c);
		public string to_string (MRuby.Context? c = null);
	}
	[CCode (cheader_filename = "mruby_vala.h")]
	public struct Symbol : MRb.mrb_sym {
	}
	[CCode (cheader_filename = "mruby_vala.h")]
	public enum TT {
		FALSE,
		FREE,
		TRUE,
		FIXNUM,
		SYMBOL,
		UNDEF,
		FLOAT,
		CPTR,
		OBJECT,
		CLASS,
		MODULE,
		ICLASS,
		SCLASS,
		PROC,
		ARRAY,
		HASH,
		STRING,
		RANGE,
		EXCEPTION,
		FILE,
		ENV,
		DATA,
		FIBER,
		MAXDEFINE
	}
	[CCode (cheader_filename = "mruby_vala.h")]
	public delegate unowned GLib.Value? FuncCB (MRuby.Context mrb, MRuby.Value self);
	[CCode (cheader_filename = "mruby_vala.h")]
	public static MRuby.Value bool_value (bool val);
	[CCode (cheader_filename = "mruby_vala.h")]
	public static void* class_ptr (MRuby.Value kls);
	[CCode (cheader_filename = "mruby_vala.h")]
	public static void* cptr (MRuby.Value val);
	[CCode (cheader_filename = "mruby_vala.h")]
	public static MRuby.Value false_value ();
	[CCode (cheader_filename = "mruby_vala.h")]
	public static int fixnum (MRuby.Value v);
	[CCode (cheader_filename = "mruby_vala.h")]
	public static MRuby.Value fixnum_value (int val);
	[CCode (cheader_filename = "mruby_vala.h")]
	public static MRuby.Value? gval2mrb (MRuby.Context mrb, GLib.Value? val);
	[CCode (cheader_filename = "mruby_vala.h")]
	public static GLib.Value? mrb2gval (MRuby.Context mrb, MRuby.Value m);
	[CCode (cheader_filename = "mruby_vala.h")]
	public static MRuby.Value[] mrb2vary (MRb.Value[] m, int? a = null);
	[CCode (cheader_filename = "mruby_vala.h")]
	public static void* nil_p (MRuby.Value v);
	[CCode (cheader_filename = "mruby_vala.h")]
	public static MRuby.Value nil_value ();
	[CCode (cheader_filename = "mruby_vala.h")]
	public static void* obj_ptr (MRuby.Value obj);
	[CCode (cheader_filename = "mruby_vala.h")]
	public static MRuby.Object obj_value (void* obj);
	[CCode (cheader_filename = "mruby_vala.h")]
	public static bool test (MRuby.Value v);
	[CCode (cheader_filename = "mruby_vala.h")]
	public static MRuby.Value true_value ();
	[CCode (cheader_filename = "mruby_vala.h")]
	public static MRuby.TT type (MRuby.Value v);
	[CCode (cheader_filename = "mruby_vala.h")]
	public static MRb.Value[] vary2mrb (MRuby.Value[] a);
}
