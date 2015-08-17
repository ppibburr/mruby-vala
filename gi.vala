using GI;
void tree() {
  print("tt\n");	
	
}
void main() {
	var repo = Repository.get_default();
	var namespace = "Gtk";
    repo.require(namespace, null, 0);

      BaseInfo info = repo.find_by_name(namespace, "main");
      void* foo;
      info.get_typelib().symbol(((FunctionInfo)info).get_symbol(), out foo);
      Argument?[] ia = {};
      var ret = Argument();
      ((FunctionInfo)info).invoke( ia, ia, out ret, null);
	
}
