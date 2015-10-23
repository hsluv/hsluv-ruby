$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

RSpec.configure do |c|
  c.include Helpers
end

require 'husl'
