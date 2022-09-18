# method_inherit.gml
a custom gamemaker script to implement method_inheritance

# about
method_inherit can be used to inherit the logic of a previously declared object method.
this implementation does not preserve "static" functionality, and should primarily be used for non-static-methods declared in gml.objects.

# credit
original method-inherit implemented by Gleb Tsereteli. expanded by GentooGames

# how-to-use
Example 1: (standard use)
```
hello = function() {
  show_debug_message("hello");
};
world = method_inherit(hello, function() {
  show_debug_message("world");
});
world();

-------
OUTPUT:
-------
"hello"
"world"
```
Example 2: (using method_inherit with no parent declared)
```
hello = method_inherit(,function() {
  show_debug_message("hello");
});
world = method_inherit(hello, function() {
  show_debug_message("world");
});
world();

-------
OUTPUT:
-------
"hello"
"world"
```
Example 3: (callback example)
```
hello = method_inherit(,function() {
  show_debug_message("hello");
}, 
function() {
  show_debug_message("callback message after execution");
});
world = method_inherit(hello, function() {
  show_debug_message("world");
});
world();

-------
OUTPUT:
-------
"hello"
"world"
"callback message after execution"
```
