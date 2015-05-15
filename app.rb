Dir['./models/*.rb'].each { |file| require file }

require 'bundler'
Bundler.require(:default, ENV['RACK_ENV'].to_sym)

post '/index' do
  request.body.rewind
  payload = request.body.read.to_s

  halt 400 if payload.empty?

  data = JSON.parse(payload)
  page = Page.new(data['pageId'], data['content'])
  page.save

  204 # No Content
end

get '/search' do
  content_type :json

  result = { matches: [] }
  query = params[:query].to_s.strip

  unless query.empty?
    result[:matches] = PageSearch.new.search(query)
  end

  result.to_json
end

get '/' do
  content_type :json

  WordRepository.all.to_json
end
