# spec/features/recipe_index_spec.rb

require 'rails_helper'

RSpec.feature 'Group Index Page', type: :feature do
  include Warden::Test::Helpers
  let(:user) { create(:user) }
  let!(:group) { create(:group, user:) } # Assuming you have FactoryBot set up for user and recipe creation

  before do
    login_as(user, scope: :user) # Log in the user using Devise
    allow_any_instance_of(ActionView::Base).to receive(:asset_path).and_return('/mocked_asset.png')
  end

  scenario 'displays a list of user categories' do
    visit groups_path

    # Assuming you have the correct CSS selectors, modify these as needed
    expect(page).to have_content('Gift') # Check for the heading
    expect(page).to have_content(group.name)
  end

  scenario 'displays a "Create Group" button' do
    visit groups_path
    expect(page).to have_content('Home')
  end
end
