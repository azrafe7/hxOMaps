import utest.Assert;

class TestKeyValueIterator extends utest.Test {

  public function new() {
    super();
  }

  function testOStringMap() {
    new TestOrderedStringMap().setup();
    var omap = TestOrderedStringMap.buildOrderedMapFrom(TestOrderedStringMap.keys, TestOrderedStringMap.stringValues);

    var keys = omap.keysCopy();
    var values = [for (v in omap) v];
    var keyValues = [for (kv in omap.keyValueIterator()) kv];
    Assert.equals(keys.length, keyValues.length);
    for (i in 0...keys.length) {
      var kv = keyValues[i];
      Assert.equals(keys[i], kv.key);
      Assert.equals(values[i], kv.value);
    }
  }

  function testOIntMap() {
    new TestOrderedIntMap().setup();
    var omap = TestOrderedIntMap.buildOrderedMapFrom(TestOrderedIntMap.keys, TestOrderedIntMap.stringValues);

    var keys = omap.keysCopy();
    var values = [for (v in omap) v];
    var keyValues = [for (kv in omap.keyValueIterator()) kv];
    Assert.equals(keys.length, keyValues.length);
    for (i in 0...keys.length) {
      var kv = keyValues[i];
      Assert.equals(keys[i], kv.key);
      Assert.equals(values[i], kv.value);
    }
  }

  function testOObjectMap() {
    new TestOrderedObjectMap().setup();
    var omap = TestOrderedObjectMap.buildOrderedMapFrom(TestOrderedObjectMap.keys, TestOrderedObjectMap.stringValues);

    var keys = omap.keysCopy();
    var values = [for (v in omap) v];
    var keyValues = [for (kv in omap.keyValueIterator()) kv];
    Assert.equals(keys.length, keyValues.length);
    for (i in 0...keys.length) {
      var kv = keyValues[i];
      Assert.equals(keys[i], kv.key);
      Assert.equals(values[i], kv.value);
    }
  }

  function testOEnumValueMap() {
    new TestOrderedEnumValueMap().setup();
    var omap = TestOrderedEnumValueMap.buildOrderedMapFrom(TestOrderedEnumValueMap.keys, TestOrderedEnumValueMap.stringValues);

    var keys = omap.keysCopy();
    var values = [for (v in omap) v];
    var keyValues = [for (kv in omap.keyValueIterator()) kv];
    Assert.equals(keys.length, keyValues.length);
    for (i in 0...keys.length) {
      var kv = keyValues[i];
      Assert.equals(keys[i], kv.key);
      Assert.equals(values[i], kv.value);
    }
  }
}
