# plivoframework-docker
Dockerized Plivoframework runs with freeswitch

~~~bash
 #docker run --privileged=true -d -v $PWD/pbxs/myplivonodecfg/:/etc/freeswitch --name myplivonode -ti neurotec/plivoframework-node
~~~

with the option **-v** can customize freeswitch configurations.

## OPTIONS
can customize plivo, with environment vars 

 -e ALLOWED_IPS="7.5.5.5"
 -e AUTH_TOKEN="mytoken"
 -e AUTH_ID="myid"
 -e SECRET_KEY="mysecret"
