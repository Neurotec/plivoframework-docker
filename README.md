# plivoframework-docker

Dockerized Plivoframework 

``example``
~~~bash
 $docker run --net=voip --ip 10.10.0.10 --name myplivonode -ti neurotec/plivoframework-node
~~~

with the option **-e** can customize plivo vars on configurations files.

## OPTIONS

can customize plivo, with environment vars, example:

 -e ALLOWED_IPS="7.5.5.5"
 -e AUTH_TOKEN="mytoken"
 -e AUTH_ID="myid"
 -e SECRET_KEY="mysecret"
 -e <KEY>="<NEW VALUE>"
