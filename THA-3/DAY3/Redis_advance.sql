~ KEY POINTS ~

        - PUBLISH
        - SUBSCRIBE
        - PSUBSCRIBE
        - PUNSUBSCRIBE
        - XADD (MAXLEN)
        - XREAD (COUNT , BLOCK)
        - XRANGE (COUNT)
        - XREVRANGE (COUNT)

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------

* In whatsapp we can send a message to a person or a group of persons at the same time. Wonder how this can happen. It happen in the backend side that we will be learning today

     ~ SUBSCRIBE & PUBLISH

         --Write in different terminal...
         - SUBSCRIBE() devsnest(any other channel name that you have to create)  --here the user wil receive the message

         --Write in different terminal...
         - PUBLISH(jo bhej rha h message) devsnest Hello  --here the sender will send the message to the subscriber and the subscriber will recieve the message. It can have n number of subscriber
         (we receive message as, message(kis type ka data aaya h) -> channel name -> message(jo bheja gya hai))

* If we want to send the message to the channels which starts with 'D'

         --Write in different terminal...
         - PSUBSCRIBE d*  --SUbscribe all the publishers starting with D 

         --Write in different terminal...
         - PUBLISH devsnest Hello / PUBLISH devs Hello  --This will send the message to both the suscribers i.e devsnest & devs.

* If we want to unsubscribe any channel...

         - UNSUBSCRIBE devsnest(channel name)  --To unsubscribe a particular channel


* Similarly, if we have to unsubscribe channels starting with name 'd' then we use 

         - PUNSUBSCRIBE d* (channel intial letter with a star)  --Unsubscribe all the channels starting with name 'd'

* STREAMS
    ## IN redis5.0 version we have one thing known as streams. Streams basically ek tarah ki pipeline bana deta h redis k andar. With the help of streams we can store history of the data##

    ## Google defination -: The Stream is a new data type introduced with Redis 5.0, which models a log data structure in a more abstract way. However the essence of a log is still intact: like a log file, often implemented as a file open in append only mode, Redis Streams are primarily an append only data structure. At least conceptually, because being an abstract data type represented in memory, Redis Streams implement powerful operations to overcome the limitations of a log file.

* To add something in streams

        - XADD mystream(stream key name) 10000(entry ID) name(field) Anna(value)  --XADD appends a new entry into the specified stream. 10000 act as a pipeline so if we need the messages in this channel then we will use the speicifc key i.e 10000
        
    ## If we do not want to give the ID, then we use * 
        - XADD mystream * name Aditya  -- '*' will automatically generate entry ID for that paricular field-value pair

    ## Advantage of making ID is that for example, Koi live stream par tha and usne live stream band kardi and vo wapas live stream par aya then frontend ne save karke rakh liya ki last key konsi aayi thi and jab vo vapis aega to uske baad se saari key laado

* To set the limit length of the data

        - XADD mystream MAXLEN 10000(iske baad k message sare delete hote rhenge aur naye messages k liye space banti rheygi) * name devs

* To get the number of streams printed on the screen(READING HISTORY)

        - XREAD COUNT 200 STREAMS mystream 0(0 will print all the entry from starting of the database to the end / we can use particular ID)  --this will print all the streams entered
        - XREAD COUNT 200 STREAMS mystream 10002-0  --this will print the data of all the streams that will come after this ID.

* To disconnect the user if he/she is inactive

        - XREAD BLOCK(disconnect) 60000(time in ms) STREAMS mystream 0  --If no data is received till 60 seconds than the user will be disconnected automatically

* To make the user connected and we do not want to disconnect the user

        - XREAD BLOCK 0 STREAMS mystream 0(0 select all the data from the database)  --Always stays connected

* To make it work like PUBLISH & SUBSCRIBE

    -- In different Terminal
        - XADD mystream * name devsnest  

    -- In different Terimal
        - XREAD BLOCK 10000 STREAMS mystream $  --The time it will receive the data it will close automatically


* To itterate the data in the streams we use XRANGE(Same as LRANGE)

        - XRANGE mystream(stream name) 10000(starting ID) 10006(ending ID)  --This will print the data from starting ID to the ending ID 

* To print the speicifc count of data, we use COUNT keyword with XRANGE

        -  XRANGE mystream(stream name) 10000(starting ID) 10006(ending ID) COUNT 10(number of data need to be printed)  --If there are data present like i thousands between the starting ID & ending ID and we have to print specific 10 data in between


* If we do not know the ID, we use following commands

        - XRANGE mystream -(from the very beginning) +(To the end) COUNT 10  --Prints the first 10 data from the database

* If we do not know the upper bound and lower bound/When we have print the data in reverse order

        - XREVRANGE mystream + - COUNT 10  --THis will print the data in reverse order

--------------------------------------------------------------------------------------------------------------------------------------------------------