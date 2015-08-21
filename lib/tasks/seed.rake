desc 'seed database'
namespace :db do
  task :seed do
    seed = File.read File.join(Rails.root, 'db','seed.graph')
    Neo4j::Session.query seed
    Rake::Task['neo4j:migrate[add_id_property]'].invoke
  end
end
