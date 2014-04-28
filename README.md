# Datomic/Free

Non-official Docker image for [Datomic/Free](http://www.datomic.com/) edition to simplify setting up [Datomic](http://www.datomic.com/) database.


Prebuilt images are hosted on publicly on [docker index](https://index.docker.io/u/tauho/datomic-free/). Currently it's mandatory to use version tag, until i'll finish testing part, then i can will publish image tagged as `latest` and 'll release newer versions than 0.9.4699.

More documentation is coming soon.

## Usage

#### Deployment version

It is used to build new [docker](https://www.docker.io/) images. As you can see, this example expects that
you have already installed [Vagrant](http://www.vagrantup.com/). If not, then please install it.

1. Before running code examples, please move into `scripts/deploy` folder

```
$> vagrant up
```

This command sets up proper machine with preinstalled java, docker and it downloads source code of datomic-tester for testing.

2. Start Datomic on docker container

```
$> vagrant ssh
$> docker run -p 4334:4334 --rm tauho/datomic-free:0.9.4699 
```

3. Test locally built docker images on another console pane

```
$> vagrant ssh
$> docker ps
$> docker inspect <container-id>

//is port open?
$> nmap -p 4334 -sT 172.17.0.2

//test datomic on repl
$> cd datomic_tester
$> lein repl
repl> (require '[datomic.api :as d])
repl> (def uri "datomic:free://172.17.0.2:4334/test")
repl> (d/create-database uri)
repl> (def conn (d/connect uri))
repl> (def schema (read-string (slurp "samples/seattle/seattle-schema.dtm")))
repl> (first schema)
repl> (def resp @(d/transact conn schema))
repl> (pprint resp)
```

Voila! It's working as expected and ready to release new version.

## Demo version

it's plain Vagrant machine, which has prebuilt docker and uses already published Datomic images;

:TODO: FINISH IT


## Updating

Fork it, made changes on new branch and send your pull request.

## Credits

All rights reserved by [Cognitect Inc](http://www.cognitect.com)

