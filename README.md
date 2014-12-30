LruCache
========

Description:

A Least Recently Used (LRU) cache is a key-value store that contains a set capacity for the number of elements it holds. When trying to add a new key-value pair, if cache.size == cache.capacity, the Least Recently Used key is removed.

An item in the cache is used every time its value is read or assigned, or it is cached using the cache method