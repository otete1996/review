class FileuploadsController < ApplicationController
  def index
    @post=Post.find(params[:id])
    require "net/http"
    require "uri"
    require "json"
    key="AIzaSyAPhTETKUPOqCLMVKQDSNqe-nfqxrmTdtM"
    uri=URI.parse("https://language.googleapis.com/v1/documents:analyzeSentiment?key="+key)
    https=Net::HTTP.new(uri.host,uri.port)
    https.use_ssl=true
    req=Net::HTTP::Post.new(uri.request_uri)
    req["Content-Type"]="application/json"
    payload={
      "document": {
              "type": "PLAIN_TEXT",
              "language": "JA",
              "content": @post.context
          },
          "encodingType": "UTF8"
    }.to_json
    req.body=payload
    json=https.request(req)
    result=JSON.parse(json.body)
    @post.score=result["documentSentiment"]["score"]
    @post.update(score: result["documentSentiment"]["score"])
    redirect_to("/posts")


  end

  def create
    require "json"
    @file=params[:file]
    json=@file.read
    result=JSON.parse(json)
    result.each_value do |value|
      post=Post.new(context: value)
       post.save



    end
    redirect_to("/posts")

  end

  def new
  end
end
