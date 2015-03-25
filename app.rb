require 'sinatra'
require 'json'
require 'elasticsearch'

get '/version' do
  content_type :json
  { :version => "1.0.0" }.to_json
end

get '/search' do
  es_host = ENV["ELASTICSEARCH_HOST"]
  es_port = ENV["ELASTICSEARCH_PORT"]
  es_url = es_host + ":" + es_port

  es = Elasticsearch::Client.new host: es_url, log: true
  query = params[:q]
  hits = es.search q: query

  hits.to_json
end

post '/index' do
  es_host = ENV["ELASTICSEARCH_HOST"]
  es_port = ENV["ELASTICSEARCH_PORT"]
  es_url = es_host + ":" + es_port

  es = Elasticsearch::Client.new host: es_url, log: true
  request.body.rewind
  document = JSON.parse request.body.read
  es.index index: 'demo', type: 'demo',  body:  document
  200
end

