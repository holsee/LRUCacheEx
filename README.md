LRUCache in Elixir
==================

### Description:

A Least Recently Used (LRU) cache is a key-value store that contains a set capacity for the number of elements it holds. When trying to add a new key-value pair, if cache.size == cache.capacity, the Least Recently Used key is removed.

An item in the cache is used every time its value is read, or it is assigned or cached using the cache method.

### Usage

``` elixir

cache = LruCache.new(2) 
  |> LruCache.cache(:k1, :v1)
  |> LruCache.cache(:k2, :v2)
# %LruCache{capacity: 2, lru: [:k1, :k2], size: 2, store: #HashDict<[k2: :v2, k1: :v1]>}

cache |> LruCache.read(:k1)   # :k2 becomes least recently used key
# {%LruCache{capacity: 2, lru: [:k2, :k1], size: 2, store: #HashDict<[k2: :v2, k1: :v1]>}, :v1}

cache |> LruCache.cache(:k3, :v3) # :k2 is dropped and :k3 inserted
# %LruCache{capacity: 2, lru: [:k2, :k3], size: 2, store: #HashDict<[k3: :v3, k2: :v2]>}

```

### :dragon_face: Beware :dragon_face:

*Just a quick bash at it for a kata, not really meant for production use.*
_Would probably be better implemented as a GenServer backed by ETS._

