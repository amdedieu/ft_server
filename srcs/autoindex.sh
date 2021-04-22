if [ "$#" -ne 1 ] ; then
	echo "usage : autoindex [on/off]"
	exit 1
fi

if [ "$1" = "on" ] ; then
	cp /etc/autoindex/nginx-conf-on /etc/nginx/sites-available/default
elif [ "$1" = "off" ] ; then
	cp /etc/autoindex/nginx-conf-off /etc/nginx/sites-available/default
else 
	echo "usage : autoindex [on/off]"
	exit 1
fi

service nginx restart
