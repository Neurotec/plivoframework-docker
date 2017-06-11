#!/bin/bash


function replace_var() {
        nvar=$1
        val=$2
        file=$3
	sed -i -r "s/^#($nvar =.+)/\1/g" $file
        sed -i -r "s/^($nvar =).+/\1 $val/g" $file
	echo "UPDATING PLIVOFRAMEWORK CONFIG VAR: $nvar -> $val"
}

PLIVO_CONF="/plivo/etc/plivo/default.conf"

#replace to listen all interfaces
sed -i "s/127\.0\.0\.1/0.0.0.0/g" $PLIVO_CONF

envs="HTTP_ADDRESS SECRET_KEY AUTH_ID AUTH_TOKEN ALLOWED_IPS DEFAULT_AWSBUCKET DEFAULT_AWSREGION S3_ACCESS_KEY 
S3_SECRET_KEY FS_INBOUND_ADDRESS FS_INBOUND_PASSWORD DEFAULT_ANSWER_URL DEFAULT_FREESWITCH_PROFILE DEFAULT_HANGUP_URL"

for var in $envs; do
	localvar="${!var}"
	if [ -n "$localvar" ]; then
		replace_var "$var" $localvar $PLIVO_CONF
	fi
done

service redis-server start
/plivo/bin/plivo start
tail -f /plivo/tmp/plivo-rest.log /plivo/tmp/plivo-outbound.log /plivo/tmp/plivo-uploader.log
