defmodule LruCache do

  defstruct size: 0, capacity: 0, store: HashDict.new(), lru: []

  def new(capacity) when is_integer(capacity) do
    %LruCache { capacity: capacity }
  end

  def new(%LruCache{} = cache) do
    cache
  end

  def cache(%LruCache{ size: size, capacity: capacity, store: store, lru: lru } = cache, key, value) do
    if size == capacity do
      [lru_key|lru] = lru
      store = HashDict.drop store, [lru_key]
    end

    store = HashDict.put(store, key, value)
    size = HashDict.size(store)
    Map.merge cache, %{size: size, store: store, lru: key_used(lru, key)}
  end

  def read(%LruCache{ store: store, lru: lru } = cache, key) do
    cache = Map.merge(cache, %{ lru: key_used(lru, key) })
    value = store |> HashDict.get key
    {cache, value}
  end

  def key_used(lru, key) do
    if key in lru, do:
      lru = for x <- lru, x !== key, do: x
    lru ++ [key]
  end

end
