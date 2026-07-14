#!/bin/bash

echo "Connecting to mysql_server container..."
echo "Executing database operations from sql/crud.sql..."
echo ""

mysql -h mysql_server -u root -proot123 --ssl=FALSE etudiants < /lab/sql/crud.sql
