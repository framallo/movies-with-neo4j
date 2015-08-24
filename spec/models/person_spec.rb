require 'rails_helper'

describe Movie do

  context 'properties' do
    let(:person) { Person.new(name:'Keanu Reeves', born:1964) }
    
    it 'allows to create a new movie' do
      expect { person }.not_to raise_error
    end

    it 'has all the required properties' do
      expect(person.name).to    eq('Keanu Reeves')
      expect(person.born).to    eq(1964)
    end
  end

end

