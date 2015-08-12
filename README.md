# Movies rails application using Neo4j

This is a project example similar to [movies-ruby-neo4j-core](https://github.com/neo4j-examples/movies-ruby-neo4j-core) but using rails and the latest version of neo4j

# Why?

Because I wanted to update to the latest ruby library and I wanted to have tests in the example project.


# Setup

You need to set up the environment variable `NEO4J_URL`

    export NEO4J_URL=http://user:password@localhost:7474/

# Issues

## installing liibv8

run this command. You can read more [here](https://github.com/cowboyd/libv8/issues/169)

    gem install libv8 -v '3.16.14.11' -- --with-system-v8

If your username or password is incorrect you might get this error

    resource.rb:37:in `handle_response_error!': Expected response code 200 Error for request

