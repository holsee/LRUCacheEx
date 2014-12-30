defmodule LruCacheTest do
  use ExUnit.Case
  doctest LruCache

  test "able to make a new cache object with capacity" do
    cache = LruCache.new 10
    assert 10 == LruCache.capacity cache
  end

  # test "able to make a new cache object from existing cache object" do
  #   cache = LruCache.new(10) |> LruCache.new
  #   assert cache.size == 10
  # end

  # test "add items to cache" do
  #   cache = LruCache.new(1) |> LruCache.cache :key, :value
    
  #   for {k, v} <- cache do
  #     assert k == :key
  #     assert v == :value
  #   end
  # end


end
