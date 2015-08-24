class Movie
  include Neo4j::ActiveNode
  property :title
  property :released
  property :tagline

  has_many :in, :people, type: 'ACTED_IN', model_class: Person
  scope :search, -> (query) { where(title: Regexp.new("(?i).*#{query}.*") ) }

  def self.people_in_movies
    q = Neo4j::Session.query( %{
        MATCH (p:Person)-[r]->(m:Movie) 
        return m.uuid, count(m)
    }).map(&:to_a).to_h
    
  end

  
end
