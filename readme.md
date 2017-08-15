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

Answer: db.products.find({"brand":"ACME"})


HW1-4
--------------------------------------------------------------------

Answer:  
...
> db.products.find({},{"name":1, _id:0}).sort("name":1);
...
> var c = db.products.find({},{name:1, _id:0}).sort({name:1});
> while(c.hasNext()){print(c.next().name)};
...
> var c = db.products.find({}).sort({name:1});
> c.forEach(function(doc){print(doc.name)});

