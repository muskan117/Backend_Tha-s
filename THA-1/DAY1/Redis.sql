Redis Installation

1) For windows
         - Enable WSL from "turn windows features on or off settings"
         - Restart the machines
         - Install Ubuntu20.04 from windows Store
         - Open Ubuntu and setup name and password
         - Run the following commands:
                > sudo apt-get update
                > sudo apt-get upgrade
                > sudo apt-get install redis-server
                > sudo service redis-server Restart
                > redis-cli

2) FOr Linux
         - sudo apt-get install redis-server
         - sudo service redis-server Restart
         - redis-cli

-----------------------------------------------------------------------------

USAGE --80% of the time redis work on strings

- SET key value --to set the key
- GET key  --to print the key
- ttl key  --ttl(time to live) tells the expiry time of the key
- KEYS *  -- to print all the keys
- DEL key  --to delete the key
- FLUSHALL --to delete all the keys
- EXISTS key  --to search for the particular key if exists
- expire key time  --to set the expiry time of the key
- setex key time value  --to set the expiry time of the key during the intialization

For Arrays

- LPUSH array value  --Push the element in the starting
- RPUSH array value --Push the element in the end
- LRANGE array start(0) stop(-1)  --Work same as for loop i.e to traverse the array and print the value
- LPOP array  --Delete the element from the starting
- RPOP array  --Delete the element from the end

For Sets  --Sets are the arrays in which the elements are not repeated

- SADD myset(key name) value --To add the elememts
- SMEMBERS myset  --To get all the keys

For Object/Hash  --Objects are called as Hash in redis

- HSET key field value  --To set the key and value
- HGET key field  --TO get the keys
- HGETALL key  --To get all the key value pair
- HDEL key field  --To delete a particular key
- HEXISTS key field  --To find the key if it exists or not we write parent key and then the key inside it(field)

