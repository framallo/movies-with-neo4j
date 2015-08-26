class Person
  include Neo4j::ActiveNode
  property :name
  property :born

  has_many :out, :movies, type: :ACTED_IN, model_class: :Movie

  def self.movies_by_people
    query_as(:p)
      .match('(p)-->(m:Movie)')
      .pluck('p.uuid', 'count(m)').to_h
  end

end
