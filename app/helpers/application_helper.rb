module ApplicationHelper

  @@relationship_to_human = { :ACTED_IN => 'acted' }

  def humanize_relation(relationship)
    @@relationship_to_human[relationship] || ''
  end

end
