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

end
