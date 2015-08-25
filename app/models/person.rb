class Person
  include Neo4j::ActiveNode
  property :name
  property :born

  has_many :out, :movies, type: 'ACTED_IN', model_class: Movie

  def self.movies_by_people
    q = Neo4j::Session.query( %{
        MATCH (p:Person)-[r]->(m:Movie)
        return p.uuid, count(p)
    }).map(&:to_a).to_h
  end

end
