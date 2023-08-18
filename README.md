Project created as a tech test for UEX.
It is a contact book integrating with google maps API and VIACEP.

### Dependencies
- [Docker](https://docs.docker.com/get-docker/)
- Ruby

### Version
- Ruby 3.0.2

### Environment
Create a .env file in root directory using the .env.example file as a template.

### Tests
To run the unit tests, run the commands below:
```bash
$ bundle exec rspec
```

### Backend
###### 1 - Build the Docker image:
```bash
$ docker-compose build
```
###### 2 - After, just run
```bash
$ docker-compose up
```
###### 3 - Server will be available on port http://localhost:3000

### Postman
All endpoint will be available on a json called: UEX-API.postman_collection
