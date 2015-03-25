require "minitest/autorun"
require "net/http"
require "json"

class TestElasticSearchSample < MiniTest::Unit::TestCase
  def test_index()
    document = {
      title: "Hello, ElasticSearch!"
    }

    req = Net::HTTP::Post.new('/index', initheader = { 'Content-Type' => 'application/json' })
    req.body = document.to_json

    res = Net::HTTP.new('localhost', 4567).start { |http| http.request(req) }
    assert res.code == "200"

    # Sleep for a few seconds to allow the document to get indexed
    sleep(5)
  end

  def test_search()
    uri = URI('http://localhost:4567/search?q=elasticsearch')
    result = Net::HTTP.get(uri)
    result_json = JSON.parse result
    assert result_json["hits"]["total"] > 0
  end
end
