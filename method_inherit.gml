function method_inherit(_method_parent = undefined, _method_child = undefined, _callback = undefined) {
	//
	var _inherit_depth = 1;
	
	#region method child ~~~~~~~~ //
	
	if (_method_child != undefined) {
		_method_child  = method(self, _method_child);
	}
	
	#endregion
	#region method parent ~~~~~~~ //
	
	var _method_parent_owner = self;
	if (_method_parent != undefined) {
		_method_parent_owner = method_get_self(_method_parent); 
		if (is_struct(_method_parent_owner)) {
			_inherit_depth = _method_parent_owner.inherit_depth + 1;
		}
		_method_parent = method(_method_parent_owner, _method_parent);
	}
	
	#endregion
	#region method callbacks ~~~~ //
	
	var _callbacks = [];
	if (is_struct(_method_parent_owner)) {
		_callbacks = _method_parent_owner.callbacks;
	}
	if (_callback != undefined) {
		_callback  = method(method_get_self(_callback), _callback);
	}
	array_push(_callbacks, _callback); 
	// ^-- push even if undefined, so that array length == inherit depth
	
	#endregion
	
	// stash local var references through temp struct binding
	var _bridge = {
		inherit_depth: _inherit_depth,
	    method_parent: _method_parent,
	    method_child:  _method_child,
		callbacks:	   _callbacks,
	};
	return method(_bridge, function() {
		if (method_parent != undefined) method_parent();
	    if (method_child  != undefined) method_child();
		
		// execute callbacks if at end of execution chain
		var _n_callbacks = array_length(callbacks);
		if (inherit_depth == _n_callbacks) {
			for (var _i = 0; _i < _n_callbacks; _i++) {
				var _callback  = callbacks[_i];
				if (_callback != undefined) {
					_callback();
				}
			}
		}
	});
};
