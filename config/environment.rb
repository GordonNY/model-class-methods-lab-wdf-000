# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
ArelLab::Application.initialize!

require_relative '../app/models/concerns/array_extension.rb'
