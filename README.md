# Nginx SSL Terminator

Simple container for terminating SSL infront of an application.

## Getting Started

I'll leave production deployment up to you, but this is how to get this running locally.

### Prerequisities

You'll need to install [boot2docker](http://boot2docker.io/) if you're using OS X or Windows, or 
[docker](https://www.docker.com/) if you're using Linux.

### Running it

This container has 3 environment variables
* SSL_KEY_PATH - A path to an SSL key
* SSL_CRT_PATH - A path to an SSL Certificate (can be a pem of your certificate and intermediaries).
* UPSTREAM - A host and port without protocal (for example `192.0.2.64:3000`)

It doesn't provide any SSL certificates, so you'll need those to be mounted from a volume.

You might run it something like this

```shell
docker run \
      --name ssl-term \
      -v /my/secrets:/certs 
      -e  SSL_KEY_PATH=/certs/example.key
      -e  SSL_CRT_PATH=/certs/example.crt
      -e  UPSTREAM=www.google.com
      purplebooth/nginx-ssl-terminator
```

## Built With

* The [nginx container](https://registry.hub.docker.com/_/nginx/)

## Contributing

Feel free to submit pull requests and issues. If it's a particualy large PR, you may wish to discuss
 it in an issue first.

Please note that this project is released with a Contributor Code of Conduct. By participating in 
this project you agree to abide by its terms.

## Versioning

We use [SemVer](http://semver.io/) for the version tags available See the tags on this repository. 

## Authors

**Billie Thompson** - *Developer* - [PurpleBooth](https://github.com/PurpleBooth)

See also the list of 
[contributors](https://github.com/PurpleBooth/nginx-ssl-terminator/contributors) who participated in
 this project.

## License

This project is licensed under the MIT License - see the 
[LICENSE](https://github.com/PurpleBooth/nginx-ssl-terminator/blob/master/LICENSE.md) file for 
details.
