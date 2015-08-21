require 'rails_helper'

describe 'db:seed', type: :rake do
  it { is_expected.to depend_on(:environment) }

  it 'populates the database' do
    subject.execute

    expect(Person.count).to eq(131)
    expect(Movie.count).to eq(38)
  end

end
