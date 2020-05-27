Docker Run
==========

This a basic extension that provides the ability to run arbitrary docker containers on your VM.

The intended use-case is to plug the gap in missing chassis extensions, features of those extensions or requirements for very specific versions of services.

## Usage

The extension accepts a config that is passed to the puppet docker module's `docker::run` resource class.

For example the following Chassis config:

```yaml
docker_run:
  elastic:
    image: 'elasticsearch:1.5.2'
    ports: '9200:9200'
    volumes: 'elastic-data:/var/lib/elasticsearch/data'
```

Will be passed to `docker::run` as follows:

```
docker::run { 'elastic':
  image => 'elasticsearch:1.5.2',
  ports => '9200:9200',
  volumes => 'elastic-data:/var/lib/elasticsearch/data'
}
```

For the full list of options available to `docker::run` see the documentation here:

https://forge.puppet.com/puppetlabs/docker/readme#containers
