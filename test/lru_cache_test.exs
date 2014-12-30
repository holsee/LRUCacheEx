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

  test "should access value by key" do
    {cache, value} = LruCache.new(1) 
      |> LruCache.cache(:key, :value)
      |> LruCache.read(:key)

    assert value == :value
  end
 
  # test "when capacity is hit, insert will replace least recently used key" do

  # end

end
