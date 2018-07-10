#!/bin/bash

role=$1

touch $role-playbook.yml
mkdir -p roles/$role/{defaults,files,tasks,templates,vars}

touch roles/$role/defaults/main.yml
touch roles/$role/tasks/main.yml
