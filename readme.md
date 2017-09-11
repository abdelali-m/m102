M102
========================

Docker environment for course M102: MongoDB for DBAs (https://university.mongodb.com/courses/M102/about)

Technology
----------------
- docker
- mongodb 3.5


Another
-------
- https://github.com/ankurpatel18/M102-MongoDB-for-DBAs
- http://dailymongodb.blogspot.ru/2016/11/mongodb-m102.html
- https://www.youtube.com/watch?v=cs8CwuCPLic (MongoDB m102 Final Exam)
- http://www.sherbaz.com/2014/09/mongodb-m102-final-exam-september-2014/ (Final Exam)


Getting Started with Docker and Docker Compose for Local Development
--------------------------------------------------------------------

### Install Docker

https://docs.docker.com/installation/

### Install Docker Compose

http://docs.docker.com/compose/install/

### Install the app's

In the project ./book/dev/ (where the `Makefile` file is located), run:

```
make build_all && make bootstrap_all
```


Getting started with mongo command line shell
--------------------------------------------------------------------

```
make shell_mongoshell
```

then write:

```
mongo storage:27017/admin -u adminmaster -p passmaster
```

```
db.createUser({
    user: "usermaster",
    pwd: "passmaster",
    roles: ["dbAdmin"]
});

db.createUser({
    user: "usermaster",
    pwd: "passmaster",
    roles: ["dbAdmin","dbOwner", "readWrite", "userAdmin"]
});
```


Getting started with weber from a shell
--------------------------------------------------------------------

```
make shell_weber
```

then write:

```
node app.js
```


Connect to mongo contaner
--------------------------------------------------------------------

```
docker exec -it m101js_storage_1 /bin/sh
```


Mongo restore dump
--------------------------------------------------------------------

```
mongorestore --host storage -u adminmaster -p passmaster dump
```


Mongo restore json
--------------------------------------------------------------------

```
mongoimport --host storage --port 27017 -u adminmaster -p passmaster --authenticationDatabase admin --drop --db pcat --collection products --file products.json
```

Mongo restore js
--------------------------------------------------------------------

```
mongo storage:27017/admin -u adminmaster -p passmaster --shell homework.js
```


HW1-1
--------------------------------------------------------------------

answer: 16777216

HW1-2
--------------------------------------------------------------------

```
mongoimport --host storage --port 27017 -u adminmaster -p passmaster --authenticationDatabase admin --db pcat --collection products --file products.json
```

answer: 3

HW1-3
--------------------------------------------------------------------

Answer: 

```
db.products.find({"brand":"ACME"})
```


HW1-4
--------------------------------------------------------------------

Answer:  

```
var c = db.products.find({},{name:1, _id:0}).sort({name:1});
while(c.hasNext()){print(c.next().name)};
```

```
var c = db.products.find({}).sort({name:1});
c.forEach(function(doc){print(doc.name)});
```


HW2-1
--------------------------------------------------------------------

```
b = db.products_bak; db.products.find().forEach(function(o){b.insert(o)})
b.count()

```

Answer: 3.05


HW2-2
--------------------------------------------------------------------

```
db.products.insertOne({
    "_id" : "ac9",
    "name" : "AC9 Phone",
    "brand" : "ACME",
    "type" : "phone",
    "price" : 333,
    "warranty_years" : 0.25,
    "available" : true
});
```

```
var doc = db.products.findOne({_id : ObjectId("507d95d5719dbef170f15c00")})
doc.term_years = 3;
doc.limits.sms.over_rate = 0.01;
db.products.save(doc)
```

Answer:   0.050.019031

HW2-3
--------------------------------------------------------------------

db.products.find({"limits.voice":{$exists:true}})

Answer:   3


HW3-1
--------------------------------------------------------------------

```
use performance
db.createUser({
    user: "usermaster",
    pwd: "passmaster",
    roles: ["dbAdmin","dbOwner", "readWrite", "userAdmin"]
});
```

```
homework.init()
```


```
db.sensor_readings.createIndex({"active":1,"tstamp":1})
db.sensor_readings.getIndexes()

```

Answer:   6

HW3-2
--------------------------------------------------------------------

Answer:   12


HW3-3
--------------------------------------------------------------------

Answer:     

* Q1:4
* Q2:4
* Q3:Yes

HW3-4
--------------------------------------------------------------------

exp = db.products.explain("executionStats")
exp.find({"for":"ac3"})


Answer:     

* dockument lavel locking
* Data coompression



HW4-1
--------------------------------------------------------------------

cd /shared/hw4-1/
mkdir -p "~/hw4-1/"{1,2,3}

mongod --dbpath 1 --port 27001 --smallfiles --oplogSize 50

mongod --dbpath /home/vagrant/hw4-1/1 --port 27001 --smallfiles --oplogSize 50

mongo --port 27001 --shell replication.js

homework.init()
homework.a()

Answer:     
    5001


HW4-2
--------------------------------------------------------------------    

ls -la /home/vagrant/hw4-1/1
less /home/vagrant/hw4-1/1/mongo.log


rs.initiate()
rs.initiate({
    _id: 'INSECURED',
    members: [
        { _id: 1, host: 'm102.mongodb.university:27001' },
        { _id: 2, host: 'm102.mongodb.university:27002' },
        { _id: 3, host: 'm102.mongodb.university:27003' }
    ]
})

Answer:     
    5002


HW4-3
--------------------------------------------------------------------        

homework.c()

Answer:     
    5


HW4-4
--------------------------------------------------------------------        

mongo --port 27001 --shell replication.js

https://docs.mongodb.com/manual/tutorial/remove-replica-set-member/

use admin
 db.shutdownServer() 

rs.remove("m102.mongodb.university:27001")
rs.remove("m102.mongodb.university:27001",{force:true})


var conf = rs.config()
conf.members = conf.members.slice(1, 3)
rs.reconfig(conf,{force:true})
rs.reconfig(conf)



rs.reconfig(conf2,{force:true})

rs.status()

rs.slaveOk()


HW4-4
--------------------------------------------------------------------        
db.oplog.rs.find()
db.oplog.rs.stats()
db.oplog.rs.find( { } ).sort( { $natural : 1 } ).limit( 1 ).next( ).o.msg[0]



