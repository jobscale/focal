## Open SSH Server

### run
```
docker run --rm --name focal -p 2222:22 -d jobscale/focal
```

### ssh
```
chmod go-rw focal.pem
ssh focal@127.0.0.1 -p 2222 -i focal.pem
```

### remove
```
docker stop focal
```
