# As a Maker
# So that others can search for my peeps 
# I want to add tags to my peeps

feature 'tag peeps' do 

  scenario 'users can add a single tag to a peep' do
    
    visit '/peeps/new'
    fill_in 'content', with: "I love peeping!"
    fill_in 'tags', with: "joy"
    click_button 'Peep!'

    expect(current_path).to eq '/peeps'

    peep = Peep.first
    expect(peep.tags.map(&:name)).to include('joy')

    within 'ol#peeps' do
      expect(page).to have_content "#joy"
    end
  end

end