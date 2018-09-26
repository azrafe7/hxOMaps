import utest.Assert;

class TestOrderedIntMap extends utest.Test {
	var keys:Array<Int>;
	var stringValues:Array<String>;

	public function new() {
		super();
	}

	function buildOrderedMapFrom(keys:Array<Int>, values) {
		var omap = new OrderedMap();

		for (i in 0...keys.length) {
			var k = keys[i];
			var v = values[i];

			omap[k] = v;
		}

		return omap;
	}

	function buildMapFrom(keys:Array<Int>, values) {
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
		keys = [0, 1, 2, 3, 4, 5, 6];
		stringValues = [for (i in 0...keys.length) Std.string(i)];

		// trace("ORDERED_MAP  : " + buildOrderedMapFrom(keys, stringValues));
		// trace("DEFAULT_MAP  : " + buildMapFrom(keys, stringValues));
		// trace("-- END SETUP");
	}

	function testOrderAndLength() {
		var omap = buildOrderedMapFrom(keys, stringValues);
		var map = buildMapFrom(keys, stringValues);

		var orderedKeys = TestUtils.iteratorToArray(omap.keys());
		var defaultKeys = TestUtils.iteratorToArray(map.keys());

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