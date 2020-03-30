# the-internet-karate-testing

A project for testing a web interface through Selenium and Karate testing.

A docker file is provided for running a test web site locally. In this version the docker image gprestes/the-internet 
([https://hub.docker.com/r/gprestes/the-internet/](https://hub.docker.com/r/gprestes/the-internet/)) has been used.

## Usage

Launch the Docker image containing the web site
`docker run -d -p 7080:5000 gprestes/the-internet`
You can also build your image using the Dockerfile present in the repo: (https://github.com/forlixdev/the-internet-docker)

Simply run the test through:
`mvn clean test`
Running the tests in this way it will run the tests using a local chromedriver (add it to your system PATH variable if not set) 

It is possible to set the browser to be used globally with this command:
`mvn clean test -Dbrowser=<browser>`
where <browser> can be chrome or firefox

It is possible to run also the tests using remote browser in a Selenium grid cluster:
`mvn clean test -Dbrowser=<browser> -Dgrid_url=<grid url>`
where <browser> can be the browser listed above and <grid url> the Selenium Grid url, for example "http://localhost:4444/wd/hub"

