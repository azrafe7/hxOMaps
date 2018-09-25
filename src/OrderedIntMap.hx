import haxe.Constraints.IMap;
import haxe.ds.OrderedIntMap;

class OrderedIntMap<T> implements haxe.Constraints.IMap<Int, T> {
	@:allow(OrderedIntMapIterator)
	var orderedKeys:Array<Int> = [];
	var map:IntMap<T> = new IntMap();

	/**
		Creates a new OrderedIntMap.
	**/
	public function new():Void {}

	/**
		See `OrderedMap.set`
	**/
	public function set(key:String, value:T):Void {
		if (!map.exists(key))
			orderedKeys.push(key);
		map.set(key, value);
	}

	/**
		See `OrderedMap.get`
	**/
	public function get(key:String):Null<T> {
		return map.get(key);
	}

	/**
		See `OrderedMap.exists`
	**/
	public function exists(key:String):Bool {
		return map.exists(key);
	}

	/**
		See `OrderedMap.remove`
	**/
	public function remove(key:String):Bool {
		var removed = map.remove(key);
		if (removed)
			orderedKeys.remove(key);
		return removed;
	}

	/**
		See `OrderedMap.keys`
	**/
	public function keys():Iterator<String> {
		return orderedKeys.iterator();
	}

	/**
		See `OrderedMap.iterator`
	**/
	public function iterator():Iterator<T> {
		return new OrderedOrderedIntMapIterator(this);
	}

	/**
		See `OrderedMap.copy`
	**/
	public function copy():OrderedOrderedIntMap<T> {
		var clone = new OrderedOrderedIntMap();
		for (k in orderedKeys)
			clone.set(k, map.get(k));
		return clone;
	}

	/**
		See `OrderedMap.toString`
	**/
	public function toString():String {
		var k:String;
		var len = orderedKeys.length;
		var str = "[";
		for (i in 0...len) {
			k = orderedKeys[i];
			str += k + " => " + map.get(k) + (i != len - 1 ? ", " : "");
		}
		return str + "]";
	}
}

private class OrderedOrderedIntMapIterator<V> {
	var map:OrderedOrderedIntMap<V>;
	var index:Int = 0;

	public function new(omap:OrderedOrderedIntMap<V>) {
		map = omap;
	}

	public function hasNext():Bool {
		return index < map.orderedKeys.length;
	}

	public function next():V {
		return map.get(map.orderedKeys[index++]);
	}
}
