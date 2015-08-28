
namespace MRuby {
  public class String : MRuby.Object {
    public String.from(MRb.Value act, MRuby.Context? mrb = null) {
      base.from(act, mrb);
    }
    
    public String(Context mrb, string cstr) {
	  base.from(mrb._base_.str_new_cstr(cstr), mrb);
    }



  }
}
