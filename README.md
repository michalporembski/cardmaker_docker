#Cardmaker Docker

##Requirements:

To properly set up this application You will need cards templates and fonts. Those files as not owned by me are not in repository.

##Setting Up

Run:

```
./build.sh
```

and simply extract resources folder in:
`./apps/cardmaker/var/cardmaker/resources`

##PHP container shell

To enter PHP container shell type:
```
docker exec -it cardmaker_php_1 /bin/bash
```

##Tests
Run:
```
./test.sh
```
 