begin
  require 'sinatra'
  require 'omniauth-23andme'
rescue LoadError
  require 'rubygems'
  require 'sinatra'
  require 'omniauth-23andme'
end

configure do
  enable :sessions

  use Rack::Session::Cookie

  use OmniAuth::Builder do
    # TODO: We need to change/add scopes

    # The key and secret can be set as environment variables:
    #
    # export TWENTYTHREEANDMEKEY=...
    # export TWENTYTHREEANDMESECRET=...
    provider :twenty_three_and_me, ENV['TWENTYTHREEANDME_KEY'], ENV['TWENTYTHREEANDME_SECRET'], :scope => 'basic genomes'
  end
end

helpers do
  # Determines if a user is authenticated
  def current_user
    !session[:uid].nil?
  end
end

before do
  # Don't redirect when the path starts with /auth/
  pass if request.path_info =~ /^\/auth\//

  # OmniAuth redirects to 23andMe when the path matches /auth/twenty_three_and_me
  redirect to('/auth/twenty_three_and_me') unless current_user
end

get '/receive_code' do
  # TODO: Create a user in the database, etc.
  puts "- env: #{env.inspect}"

  #session[:uid] = env['omniauth.auth']['uid']

  # The application's main endpoint
  #redirect to('/')
end

get '/auth/failure' do
  # OmniAuth redirects to /auth/failure when it encounters a problem
  # TODO

end

get '/' do
	logger.info "- uid: #{session[:uid]}"

	val = 'bar'

	session[:foo] = val
	response.set_cookie 'foo', val

  'Hello.'
end

get '/cookies' do
	request.cookies['foo']
end
