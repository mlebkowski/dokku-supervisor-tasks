# Dokku Supervisor Tasks

Define your additional process types in `Procfile`:

```
worker1: bin/worker
updater: php app/updater.php
```

or — if you’re a composer kind of guy — via `composer.json`:

```json
{
…
  "extra": {
    "procfile": {
      "worker1": "bin/worker",
      "updater": "php app/updater.php"
    }
  }
}
```

And the plugin will launch a single process of each under supervisor control. 

# One supervisor to rule them all

Currently there is only one supervisor to manage all of the apps. This could be changed 
in the future, please create an issue if you’d like to see this changed. 

Run `dokku sctl` to launch an interactive supervisor console, where you can see the
processes status, logs and other.

# Redeployment

On each deploy, every worker gets gracefully shut down (via `SIGTERM`). Make sure to handle this signal
if you need to do some maintanence tasks. Supervisor will wait 10 seconds before terminating those processes
any way. 

# Scaling / parallel processing

Use dokku config to change the number of parallel worker processes started using `PROCESS_NUM_<WORKER_NAME>`
