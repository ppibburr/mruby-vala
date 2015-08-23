
void main() {
	var mrb = new MRuby.Context();
	mrb.define_method("foo", (mrb)=> {
		var a = new MRuby.Array.create(mrb);
		var m = new MRuby.ArrayWithContext(mrb, a.actual);

		m[0] = mrb.str_new_cstr("foo");
		m[1] = MRuby.true_value();
		
		print("%s\n", (string)m.to_native()[0]);
		
		return m;
	});
	mrb.load_string("p foo();");
}
