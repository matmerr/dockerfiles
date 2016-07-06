# Docker Containers

Containerized apps I used. Images for each app is available from my Docker repo:
```sh
mmerrick/$folder_name
```
### Docker Command Notes
Listing all installed docker images:
```sh
docker images
```
Listing all Docker running containers: (add -a to list stopped and running)
```sh
docker ps
```
Start/stop docker container
```sh
docker start/stop container_name
```
Copying files to container:
```sh
docker cp file.txt container:/file.txt
```
Copying from container:
```sh
docker cp container:/file.txt file.txt
```
Get active shell in container
```sh
docker exec container_name sh
```
Delete docker image
```sh
docker rmi image_name
```
Delete docker container
```sh
docker rm container_name
```
