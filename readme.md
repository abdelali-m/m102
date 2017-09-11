M102
========================

Docker environment for course M102: MongoDB for DBAs (https://university.mongodb.com/courses/M102/about)

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


