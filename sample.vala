using MRb;

public class Foo : Object {
  public int bar {get;set;}
  public Foo(int bar) {
    Object(bar:bar);
  }
}

void main() {
  // Create a context
  var mrb = new Context();
  
  // Define an instance method for instances of Object
  mrb.define_method(mrb.object_class, "hello", (mrb, self)=>{ 
    // pointer to hold passed argument
    int vp;
    
    // get the arguments
    print("GET_ARGS: got %d args\n", mrb.get_args("|i", out vp));
    
    // Do something interesting with the args
    print("Passed argument was: %d\n", vp);    

    // Return something
    return mrb.str_new("world!", 6);
  }, args_none());
  
  mrb.define_method(mrb.object_class, "bool", () => {
      return bool_value(true);
  }, args_none());
  
  mrb.define_method(mrb.object_class, "fixnum", () => {
      return fixnum_value(44);
  }, args_none());  
  
  mrb.define_method(mrb.object_class, "nil_val", () => {
      return nil_value();
  }, args_none());  
  
  mrb.define_method(mrb.object_class, "float_val", (mrb) => {
      return mrb.float_value(88.34f);
  }, args_none());    
  
  mrb.define_method(mrb.object_class, "data", (mrb) => {
      return mrb.cptr_value(new Foo(5)); 
  }, args_none());   
  

  
  mrb.define_method(mrb.object_class, "add", (mrb, self)=>{ 
    int ap, bp;
    
     mrb.get_args("ii", out ap, out bp);

    return fixnum_value(ap + bp);
  }, args_none());   
  
  // Execute a string (calls out custom method)  
  mrb.load_string("""
    puts hello(4)

    if bool() == true
      puts "bool() was true."
    end

    if fixnum() == 44
      puts "fixnum() was 44."
    end

    if nil_val() == nil
      puts "nil_val() was nil"
    end

    if float_val().round(2) == 88.34
      puts "float_val() was 88.34"
    end
    
    if add(3, 9) == 12
      puts "add(3,9) was 12"
    end
  """);

  var v = mrb.load_string("data()");
  print("%d\n", ((Foo)cptr(v)).bar);
  
  mrb.close();
}
