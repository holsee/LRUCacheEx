defmodule LruCache do

  defstruct size: 0, capacity: 0, store: HashDict.new()

  def new(capacity) when is_integer(capacity) do
    %LruCache{ capacity: capacity }
  end

  def new(%LruCache{} = cache) do
    cache
  end

  def cache(%LruCache{ size: _, capacity: capacity, store: store}, key, value) do
    store = HashDict.put(store, key, value)
    size = HashDict.size(store)

    %LruCache{
      size: size,
      capacity: capacity,
      store: store
    }
  end
end
