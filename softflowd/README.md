# [Softflowd][softflow-site]
Containerized apps I used. Images for each app is available from my Docker repo:
```sh
docker run mmerrick/softflowd
```
To view stats, run softflow-stats.sh on host, or run 
```sh
docker exec -t softflowd /bin/sh -c "softflowctl statistics"
```

[softflow-site]: <http://www.mindrot.org/projects/softflowd/>