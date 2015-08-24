RACK_ENV = 'test' unless defined?(RACK_ENV)
require File.expand_path(File.dirname(__FILE__) + "/../config/boot")
require File.dirname(__FILE__) + "/factories"
Dir[File.dirname(__FILE__) + '/../app/helpers/**.rb'].each { |file| require file }

# require 'simplecov'
# SimpleCov.start do
#   add_group "Models", "app/models"
#   add_group "Controllers", "app/controllers"
#   add_group "Helpers", "app/helpers"
#   add_group "Mailers", "app/mailers"
# end


RSpec.configure do |conf|
  conf.include Rack::Test::Methods
  conf.include FactoryGirl::Syntax::Methods
  conf.mock_framework = :rspec
  conf.full_backtrace= false # save the console
  conf.color= true   # save your eyes
  conf.formatter = :documentation

  ActiveRecord::Base.observers.disable :all # => Turn them all off
end

# Have access to the session variables.
def session
  last_request.env['rack.session']
end

def app
  ##
  # You can handle all padrino applications using instead:
  #   Padrino.application
  JobVacancy::App.tap { |app|  }
end
