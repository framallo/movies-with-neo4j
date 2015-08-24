require 'rails_helper'

describe Person do

  context 'properties' do
    let(:keanu) { Person.new(name:'Keanu Reeves', born:1964) }
    
    it 'allows to create a new movie' do
      expect { keanu }.not_to raise_error
    end

    it 'has all the required properties' do
      expect(keanu.name).to    eq('Keanu Reeves')
      expect(keanu.born).to    eq(1964)
    end
  end

  context '#movies_by_people' do
    let(:movies_by_people) { Person.movies_by_people }
    let(:keanu) { Person.find_by name: 'Keanu Reeves' }

    it 'has movie id as key' do
      expect(movies_by_people.all? {|uuid, count| uuid.length == 36 }).to be true
    end
    it 'has the number of people as value' do
      expect(movies_by_people.all? {|uuid, count| count.class == Fixnum }).to be true
    end

    it 'counts the movies by Keanu Reeves' do
      count = movies_by_people[keanu.uuid]
      expect(count).to eq(7)
    end
  end

end

