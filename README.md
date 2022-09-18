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
Example 2: (alternative standard use. using method_inherit with no parent declared)
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

# downside
because method_inherit() cannot be used with static methods, any method that would be declared as static, and is not (in order to work with this implementation), automatically becomes less memory efficient. additionally, instead of one method being declared and stored in memory, method_inherit() creates three method references, and stores them in memory instead. therefore, what could theoretically be accomplished with one static method declaration, instead becomes 3 * n, where n is the number of instances implementing the non-static-method. gamemaker games, on average, dont have to worry about overrusing memory resources, so this is not as severe of a problem, but something that you should be aware of while using.
