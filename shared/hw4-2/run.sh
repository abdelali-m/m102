#!/bin/bash

mongod --replSet INSECURED \
--dbpath /home/vagrant/hw4-1/1 \
--logpath /home/vagrant/hw4-1/1/mongo.log \
--port 27001 \
--smallfiles \
--oplogSize 50 \
--fork

mongod --replSet INSECURED \
--dbpath /home/vagrant/hw4-1/2 \
--logpath /home/vagrant/hw4-1/2/mongo.log \
--port 27002 \
--smallfiles \
--oplogSize 50 \
--fork

mongod --replSet INSECURED \
--dbpath /home/vagrant/hw4-1/3 \
--logpath /home/vagrant/hw4-1/3/mongo.log \
--port 27003 \
--smallfiles \
--oplogSize 50 \
--fork
