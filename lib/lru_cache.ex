defmodule LruCache do

  defstruct size: 0, capacity: 0, store: HashDict.new()

  def new(capacity) when is_integer(capacity) do 
    %LruCache{ capacity: capacity }
  end

  def new(%LruCache{} = cache) do
    cache
  end

end
