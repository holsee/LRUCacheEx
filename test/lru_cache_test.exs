defmodule LruCacheTest do
  use ExUnit.Case
  doctest LruCache

  test "able to make a new cache object with capacity" do
    cache = LruCache.new(10)
    assert 10 == cache.capacity
  end

  test "able to make a new cache object from existing cache object" do
    cache = LruCache.new(10) |> LruCache.new()
    assert 10 == cache.capacity
  end

  test "insert items to cache" do
    cache = LruCache.new(1) |> LruCache.cache(:key, :value)
    expectedStore = HashDict.new |> HashDict.put :key, :value
    assert %LruCache{size: 1, capacity: 1, store: expectedStore } == cache
  end
end
