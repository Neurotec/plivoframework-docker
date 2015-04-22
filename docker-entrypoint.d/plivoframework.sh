#!/bin/bash


function replace_var() {
        nvar=$1
        val=$2
        file=$3
        sed -i -r "s/^($nvar =).+/\1 $val/g" $file
	echo "UPDATING PLIVOFRAMEWORK CONFIG VAR: $nvap -> $val"
}

if [ "$SECRET_KEY" ]; then
	replace_var "SECRET_KEY" $SECRET_KEY /plivo/etc/plivo/default.conf
fi

if [ "$AUTH_ID" ]; then
	replace_var "AUTH_ID" $AUTH_ID /plivo/etc/plivo/default.conf
fi

if [ "$AUTH_TOKEN" ]; then
	replace_var "AUTH_TOKEN" $AUTH_TOKEN /plivo/etc/plivo/default.conf
fi

if [ "$ALLOWED_IPS" ]; then
	replace_var "ALLOWED_IPS" $ALLOWED_IPS /plivo/etc/plivo/default.conf
fi

/plivo/bin/plivo start
