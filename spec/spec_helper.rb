require 'rack/test'

require File.expand_path '../../app.rb', __FILE__

module RSpecMixin
  include Rack::Test::Methods

  def app() Sinatra::Application end
end

# Since we're using RSpec 2.x...
RSpec.configure { |c| c.include RSpecMixin }
