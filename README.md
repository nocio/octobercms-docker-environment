# OctoberCMS docker environment

A docker environment for OctoberCMS plugin and theme development with xdebug support.

## Getting started

1. Clone the repository and place a theme or plugin in the ``src`` folder. 
2. Copy ``.env-example`` to ``.env`` and fill the plugin/theme details (alternatively, you can configure more complex setups directly in the docker-compose.yaml)
3. Run docker compose to build the docker image and spin up the october docker

To configure the process in **PHPStorm**, add a run configuration for docker deployment using the ``docker-composer.yml``. Secondly, setup the docker PHP interpreter in Settings > Languages and Framework > PHP. Finally, add another run configuration PHP Webpage that points to ``localhost:4000`` and uses the docker server.

You can now run the october container and develop and debug the code of your plugin or theme.

### Accessing the OctoberCMS source

For debugging and IDE autocompletion, it may be useful to have access to the October source. Use the [sync script](docker/sync.sh) to "download" the october source from the docker container.

*Tested under Ubuntu 16.04