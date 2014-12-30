defmodule LruCache do

  defstruct size: 0, capacity: 0, store: HashDict.new()

  def new(capacity) do
    %LruCache{ capacity: capacity }
  end

  def capacity(cache) do
    cache.capacity
  end

end
