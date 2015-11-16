#!/bin/bash

mkdir -p $1"/service"
touch $1"/service/PlaceHolderService.java"
mkdir -p $1"/service/impl"
mkdir -p $1"/dao"
touch $1"/dao/PlaceHolderDAO.java"
mkdir -p $1"/dao/impl"
mkdir -p $1"/controller"
mkdir -p $1"/entity"
mkdir -p $1"/beans"
