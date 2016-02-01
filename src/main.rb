# -*- encoding: utf-8 -*-

class Main < Sinatra::Base

  configure :production, :development do
    enable :logging
  end

  post '/event_receiver' do
    # log
    request.body.rewind
    events = JSON.parse(request.body.read)
    events.each{|event|
      logger.info JSON.generate(event)
    }
    # return successful response
    'Success'
  end

  post '/parse_receiver' do
    # log
    request.body.rewind
    params.each{|key, value|
      logger.info "key: #{key} value: #{value}"
    }
    # return successful response
    'Success'
  end
end
