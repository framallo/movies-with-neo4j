class Movie
  include Neo4j::ActiveNode
  property :title
  property :released
  property :tagline

end
