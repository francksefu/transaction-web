# spec/controllers/groups_controller_spec.rb

require 'rails_helper'

RSpec.describe OperationsController, type: :controller do
  include Devise::Test::ControllerHelpers
  let(:user) { create(:user) } # Assuming you have FactoryBot set up for user creation

  before do
    sign_in user # Authenticate the user using Devise
  end

  describe 'GET #new' do
    it 'returns http success' do
      get :new
      expect(response).to have_http_status(:success)
      expect(response).to be_successful
    end
  end
  
end
