# Gauche Docker image

This directory contains files needed to build a Docker image contaning
Gauche Scheme Engine, and Makiki http server.

The pre-built images are available at the public docker repo,
`docker.io/practicalscheme/gauche`.
See the list of published images at
https://hub.docker.com/r/practicalscheme/gauche/ .

## How to use this

### Creating a Docker image of Gauche application

See [`samples/simple`](samples/simple), which creates an image of simple web server.
It's [Dockerfile](samples/simple/Dockerfile) simply pulls from `practicalscheme/gauche`, adds
the application directory, and run the script:

```
FROM practicalscheme/gauche:latest
ADD app /app
CMD [ "/usr/bin/gosh", "/app/serv.scm", "-p", "6789" ]
```

The appplication script [`serv.scm`](samples/simple/app/serv.scm)
creates a webserver that responds to the root path and just returns
a simple HTML:

```
(use makiki)
(use gauche.parseopt)

(define (main args)
  (let-args (cdr args) ([port "p=i"])
    (start-http-server :port port)))

(define-http-handler "/"
  (^[req app] (respond/ok req "<h1>It worked!</h1>")))
```

To build an image, go down to `samples/simple` directory and run the
`docker build` command.

```
docker build -t sample-simple .
```

The server can be run as follows:

```
docker run --rm -p 6789:6789 smaple-simple
```

Access to `http://localhost:6789/` and you'll get a response.


### Running a Gauche REPL without installing Gauche

The docker image is set to run Gauche REPL by default, so
you can run REPL without installing Gauche:

```
docker run --rm -ti practicalscheme/gauche
```

Note that, however, the REPL runs inside the Docker environment,
so it cannot refer to your local file.

Note: By default, `gosh` runs with line-editing enabled.
If you run it inside Emacs shell mode, it will interfere with
Emacs editing, so you'd want to use `-fno-read-edit` option:


```
docker run --rm -ti practicalscheme/gauche /usr/bin/gosh -i -fno-read-edit
```

### Running a local Gauche script without installing Gauche

To run Gauche script on your machine with `gosh` in the Docker, you need
to make your script visible from the Docker.

The Docker image contains a script `/usr/bin/gosh-script` which chdir
to `/home/app` and run `gosh`.  Mounting the local script directory as
`/home/app` in the Docker and run `/usr/bin/gosh-script` in the Docker
allows `gosh` to read the script and other stuff under the directory.

See [`samples/local-script`](samples/local-script).  It has a shell
script that does the job.  Go down to the directory and try this:


```
./run-gosh-in-docker.sh script.scm
```

It will show:

```
Loading mylib.b
Loading mylib.a
Running local script
This is input data
```

See `script.scm` to find out the local libraries and files are read
by `gosh`.
