# sample_ruby_elasticsearch
A sample project that shows you how to test a ruby webapp that uses Elasticsearch.

## What does it include

- A simple webapp built with Sinatra that exposes two APIs: `GET /search` and `POST /index`
- `GET /search?q=foo` will search your Elasticsearch instance for the string `foo` 
- `POST /index` will add the JSON body of the request to your Elasticsearch instance

## How to run this project on Shippable

1. Fork it
1. Enable it
1. Run it

The project comes with a working `.shippable.yml` file.

## How to run this locally
1. Get an Elasticsearch server running locally. If you have Docker, this is all you need to do:
   ````
   docker run -d -p 9200 -p 9300 elasticsearch
   ````

1. Clone this repository and `bundle install` the first time to get all the gems. Then run the Sinatra webapp with this command:
   ````
   ELASTIC_SEARCH_PORT=9200 ELASTIC_SEARCH_HOST=localhost ruby app.rb
   ````

1. Run the tests with `bundle exec rake tests`

