class Person
  include Neo4j::ActiveNode
  property :name
  property :born

end
