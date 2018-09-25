import utest.Runner;
import utest.ui.Report;
import utest.Assert;

class TestAll {
	public static function iteratorToArray<K>(iterator:Iterator<K>):Array<K> {
		var array = [];
		for (i in iterator) {
			array.push(i);
		}
		return array;
	}

	public static function main() {
		utest.UTest.run([
			new TestOrderedStringMap(),
			// new TestCase2()
		]);
	}
}

class TestOrderedStringMap extends utest.Test {
	var keys:Array<String>;
	var stringValues:Array<String>;

	public function new() {
		super();
	}

	function buildOrderedMapFrom(keys:Array<String>, values) {
		var omap = new OrderedMap();

		for (i in 0...keys.length) {
			var k = keys[i];
			var v = values[i];

			omap[k] = v;
		}

		return omap;
	}

	function buildMapFrom(keys:Array<String>, values) {
		var map = new Map();

		for (i in 0...keys.length) {
			var k = keys[i];
			var v = values[i];

			map[k] = v;
		}

		return map;
	}

	function setup() {
		// trace("-- SETUP");
		keys = ["1", "apple", "banana", "orange", "one", "two", "three"];
		stringValues = [for (i in 0...keys.length) Std.string(i)];

		// trace("ORDERED_MAP  : " + buildOrderedMapFrom(keys, stringValues));
		// trace("DEFAULT_MAP  : " + buildMapFrom(keys, stringValues));
		// trace("-- END SETUP");
	}

	function testOrderAndLength() {
		var omap = buildOrderedMapFrom(keys, stringValues);
		var map = buildMapFrom(keys, stringValues);

		var orderedKeys = TestAll.iteratorToArray(omap.keys());
		var defaultKeys = TestAll.iteratorToArray(map.keys());

		Assert.equals(orderedKeys.length, defaultKeys.length);
		Assert.same(keys, orderedKeys);
	}

	function testValues() {
		var omap = buildOrderedMapFrom(keys, stringValues);
		var map = buildMapFrom(keys, stringValues);

		for (k in map.keys()) {
			Assert.equals(map[k], omap[k]);
		}
	}
}
