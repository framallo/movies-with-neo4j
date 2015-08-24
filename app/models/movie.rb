class Movie
  include Neo4j::ActiveNode
  property :title
  property :released
  property :tagline

  has_many :in, :people, type: 'ACTED_IN', model_class: Person
  scope :search, -> (query) { where(title: Regexp.new("(?i).*#{query}.*") ) }

  def self.people_in_movies
    Movie.as(:m).people(:p).pluck('m.uuid', 'count(p)').to_h
  end

  
end
