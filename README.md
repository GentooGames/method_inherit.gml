# method_inherit.gml
a custom gamemaker script to implement method_inheritance

# about
method_inherit can be used to inherit the logic of a previously declared object method.
this implementation does not preserve "static" functionality, and should primarily be used for non-static-methods declared in gml.objects.

# how-to-use
```
Example 1:

hello = function() {
  show_debug_message("hello");
};
world = method_inherit(hello, function() {
  show_debug_message("world");
});
world();
```

# credit
original method-inherit concept created by Gleb Tsereteli. expanded and extra features added by __gentoo__
