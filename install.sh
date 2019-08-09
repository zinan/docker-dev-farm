#!/usr/bin/env bash
set -e

echo "Checking requirements..."
echo ""

docker info > /dev/null 2>&1
if [[ $? -ne 0 ]]; then
  echo "ERROR: Unable to talk to the docker daemon"
  echo ""
  exit 1
fi

if [ -f ".env" ]; then
  echo ".env already exists, skipped creation."
else
  echo "Creating .env"
  cp -n .env.example .env
fi
echo ""

if [ -z $1 ]; then
    echo "Please enter projects directory path; will be used for web server configuration"
    echo "For example: /path/to/projects/directory"
    read DEFAULT_PROJECTS_FOLDER
    if [ -z "$DEFAULT_PROJECTS_FOLDER" ]
    then
          echo "ERROR: Default Directory Path can not be NULL"
          exit 1
    else
        sed -i 's/^DEFAULT_PROJECTS_FOLDER=.*$/DEFAULT_PROJECTS_FOLDER='"$DEFAULT_PROJECTS_FOLDER"'/' .env
        echo "Password written to .env"
    fi
else
    echo "Default Directory Path can not be NULL, Default value will be used..."
fi
echo ""

if [ -z $1 ]; then
    echo "Please defina a GLOBAL PASSWORD which will be used for all necessary fields, like Mysql Root Password"
    read GLOBAL_PASSWORD
    if [ -z "$GLOBAL_PASSWORD" ]
    then
          echo "GLOBAL PASSWORD can not be NULL, Default value will be used..."
    else
        sed -i 's/^GLOBAL_PASSWORD=.*$/GLOBAL_PASSWORD='"$GLOBAL_PASSWORD"'/' .env
        echo "Password written to .env"
    fi
else
    echo "GLOBAL PASSWORD can not be NULL, Default value will be used..."
fi
echo ""

echo "Building and tagging Docker images..."
echo ""
#docker-compose build
echo ""
echo "Docker images built."

echo "Cleaning up..."
#docker-compose down &> /dev/null

echo ""
echo "----------------"
echo "You're all done! Run the following command to get your docker developer farm running:"
echo ""
echo "  docker-compose up -d"
echo ""