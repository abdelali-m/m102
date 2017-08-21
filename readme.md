M102
========================

Docker environment for course of https://university.mongodb.com/courses/M102/about

Technology
----------------
- docker
- mongodb 3.5


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
mongo admin --host storage -u adminmaster -p passmaster
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