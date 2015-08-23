desc 'seed database'
namespace :db do
  task :seed => :environment do
    seed = File.read File.join(Rails.root, 'db','seed.graph')
    Neo4j::Session.query seed
    Rake::Task['neo4j:migrate'].invoke 'add_id_property'
  end
end
