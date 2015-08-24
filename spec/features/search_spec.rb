require 'rails_helper'

feature 'Movies' do
  scenario "Browse movies" do
    visit '/'
    fill_in 'Search', with: 'Top'
    click_button 'Submit'

    #the_matrix = find(:xpath, "//div[@class='list-group']/a[@href='/movies/The%20Matrix']")
    #expect(the_matrix.text).to eq "The Matrix 5"

    ##binding.pry

    #click_link "The Matrix 5"
    expect(page).to have_css('.list-group-item', count: 1)
  end
end
