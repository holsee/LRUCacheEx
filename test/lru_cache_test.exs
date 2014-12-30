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
    assert %LruCache{size: 1, capacity: 1, lru: [:key], store: expectedStore } == cache
  end

  test "should access value by key" do
    {cache, value} = LruCache.new(1) 
      |> LruCache.cache(:key, :value)
      |> LruCache.read(:key)

    assert value == :value
  end
 
  test "when capacity is reached, insert will replace least recently used key" do
    cache = LruCache.new(2) 
      |> LruCache.cache(:k1, :v1)
      |> LruCache.cache(:k2, :v2)

    {cache, value} = LruCache.read cache, :k1

    cache = LruCache.cache(cache, :k3, :v3)

    refute cache.store |> HashDict.has_key? :k2
    assert cache.store |> HashDict.has_key? :k1
    assert cache.store |> HashDict.has_key? :k3
  end

end
