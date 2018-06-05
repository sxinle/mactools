#!/bin/bash

mvn archetype:create-from-project

cd target/generated-sources/archetype/

mvn deploy

cd ../../..
