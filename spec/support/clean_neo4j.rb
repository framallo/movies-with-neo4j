require 'rails_helper'

RSpec.configure do |config|
  config.before(:each) do
    Neo4j::Session.current._query('MATCH (n) OPTIONAL MATCH (n)-[r]-() DELETE n,r')
  end
  config.before(:all) do
  end
end
