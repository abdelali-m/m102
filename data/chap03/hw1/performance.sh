#!/bin/bash
mongo storage:27017/performance -u usermaster -p passmaster --shell performance.js
# mongo storage:27017/admin -u adminmaster -p passmaster --shell performance.js