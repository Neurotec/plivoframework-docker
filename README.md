# plivoframework-docker

Dockerized Neurotec-Plivoframework 

``example``
~~~bash
 $docker run --net=voip --ip 10.10.0.10 --name myplivonode -ti neurotec/plivoframework
~~~

``example with a freeswitch``
~~~bash
 #start freeswitch need acl access to 8021
 $docker run --rm -ti --net=voip --ip 10.10.0.11 --name myfreeswitchnode -ti bettervoice/freeswitch-container:1.6.6 bash
 #then start plivoframework
 $docker run --rm -ti  --net=voip --ip 10.10.0.10 --name myplivonode -e FS_INBOUND_ADDRESS="10.10.0.11:8021" -e FS_OUTBOUND_ADDRESS="10.10.0.10:8084" -e AUTH_ID="myid" -e AUTH_TOKEN="mytoken" -e SECRET_KEY="mysecret" -e ALLOWED_IPS="0.0.0.0" neurotec/plivoframework 
~~~

with the option **-e** can customize plivo vars on configurations files.

## OPTIONS

can customize plivo, with environment vars, example:

 -e ALLOWED_IPS="7.5.5.5"
 -e AUTH_TOKEN="mytoken"
 -e AUTH_ID="myid"
 -e SECRET_KEY="mysecret"
 -e FS_INBOUND_ADDRES="10.10.0.11:8021"
 -e FS_OUTBOUND_ADDRESS="10.10.0.10:8084"
 -e <KEY>="<NEW VALUE>"
