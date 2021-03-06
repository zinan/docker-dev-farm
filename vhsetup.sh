#!/usr/bin/env bash

echo "This wizard helps you to set up new virtual host on nginx image"
echo ""
echo "Please follow the instructions and fill all inputs"
echo ""
read -p "Press enter to continue or CTRL+C to exit"
echo ""


TEMPLATE=`cat nginx/conf.d/config.sample`


echo "Please define hostname:"
echo "For example: foo.localhost"
read HOSTNAME
if [ -z "HOSTNAME" ]
then
      echo "ERROR: hostname can not be NULL"
      exit 1
else
    TEMPLATE=${TEMPLATE/sample.localhost/$HOSTNAME}
fi

echo "Please define project path:"
echo "For example: EPA_API"
read PATHNAME
if [ -z "PATHNAME" ]
then
      echo "ERROR: path can not be NULL"
      exit 1
else
    TEMPLATE=${TEMPLATE/public/$PATHNAME}
fi

echo "Please define php version image:"
echo "For example: php72"
read PHPVER
if [ -z "PHPVER" ]
then
      echo "ERROR: php version can not be NULL"
      exit 1
else
    TEMPLATE=${TEMPLATE/php72/$PHPVER}
fi


echo "$TEMPLATE" > "nginx/conf.d/$HOSTNAME.conf"
echo ""
echo "New virtual host has been created!"
echo ""


echo "Would you like to add $HOSTNAME to /etc/hosts? "
echo "[y/n]"
read WRITETOHOSTS
if [[ $WRITETOHOSTS == y* ]]; then
    sudo -k
    if sudo true; then
        # sudo sh -c echo "127.0.0.1  $HOSTNAME" >> /etc/hosts
        echo "\n127.0.0.1  $HOSTNAME" |  sudo tee -a /etc/hosts > /dev/null
        echo "$HOSTNAME added to /etc/hosts"
    else
        echo "Access denied you do not have sufficient privileges!"
        exit 1
    fi
fi
