class Person
  include Neo4j::ActiveNode
  property :name
  property :born

  has_many :out, :movies, type: 'ACTED_IN', model_class: Movie

  def self.movies_by_people
    Person.as(:p).movies(:m).pluck('p.uuid', 'count(p)').to_h
  end

end
