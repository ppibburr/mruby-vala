
void main() {
	var mrb = new MRuby.Context();
	mrb.define_method("foo", (mrb)=> {
		var a = new MRuby.Array(mrb);

		a[0] = new MRuby.String(mrb, "foo");
		a[1] = new MRuby.Object.from(MRb.true_value(), mrb);
		
		foreach (var v in a) {
			print("%s\n", v.to_string());
		}
		
		return a;
	});
	mrb.load_string("p foo();");
}
