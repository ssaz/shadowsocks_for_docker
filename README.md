shadowsocks_for_docker
==========

Docker Images of Shadowsocks From CentOS-7 7.3.1611 x86_64;

No Secure in connection-limit bandwidth-limit ban-cracker !!!;

Run shadowsocks service for 1 instance;

Default rand password;

Options -p -k -m for service;

Option value -p=1949 -k=${rand and output in docker log} -m=aes-256-cfb

Option Method are aes-256-cfb aes-256-ctr camellia-256-cfb and 128/192 size;

Not newest package dont support aes-256-gcm chacha20-ietf-poly1305;

Default with -qq --fast-open -s=0.0.0.0 -t=300 --user=nobody;

Dont support multiport or user;

Dont support config manager-address forbidden-ip workers;

Dont support pid log verbose-mode;

Dont support graceful with supervisor;

Dont support kcptun finalspeed;

Dont support bbr net-speeder;

Dont support ipv6;

Not shadowsocks-libev dont support obfsplugin udprelay redirectmode tunnelmode;

No Optimizing in Docker without DockerHosting support include fast-open;

DockerHub: https://hub.docker.com/r/ssorg/shadowsocks_for_docker/

Github: https://github.com/ssaz/shadowsocks_for_docker

## Example (For Docker Hostings)

Make sure that Port and ENV SS_PORT are the same

```
Image: ssorg/shadowsocks_for_docker
Instance: 1
Port: 1949 tcp
ENV: SS_PORT 1949
ENV: SS_PASSWORD $(PasswordYouWant)
ENV: SS_METHOD aes-256-ctr
```

then docker hosting will -P a rand port and generate a rand host for the container

## Example (Best Practice)

```
docker run -d -p 19490:1949 ssorg/shadowsocks_for_docker | cut -c 1-12 | xargs docker logs -f
```

then docker log print port, password and method.
```
----- ----- ----- ----- -----
----- ----- ----- ----- -----
----- ----- ----- ----- -----
ss port: 1949
ss password: XXXXXXXXXXXXXXXX
ss method: aes-256-cfb
----- ----- ----- ----- -----
----- ----- ----- ----- -----
----- ----- ----- ----- -----
```

## Example custom port

Make sure that -e ${SS_PORT} and -p :${SS_PORT} are the same, 
example -e 'SS_PORT=123' -d -p XXXXX:123

```
docker run -e 'SS_PORT=22' -d -p 2222:22 ssorg/shadowsocks_for_docker
```

## Example custom port and password

```
docker run -e 'SS_PORT=8080' -e 'SS_PASSWORD=Passw0rd' \
-d -p 12345:8080 ssorg/shadowsocks_for_docker
```

## Example custom method

```
docker run -e 'SS_METHOD=aes-256-ctr' -d -p 12345:22 ssorg/shadowsocks_for_docker
```

## Example Full params

```
docker run -e 'SS_PORT=1949' -e 'SS_PASSWORD=Passw0rd' -e 'SS_METHOD=aes-256-ctr' \
-d -p 19999:1949 ssorg/shadowsocks_for_docker | cut -c 1-12 | xargs docker logs -f
```

## Tips

slow since QoS, change port to 80 25 443 995 3389

-END-
