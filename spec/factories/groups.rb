FactoryBot.define do
    factory :group do
      association :user, factory: :user
      name { 'Icon' }
      icon { 'icon.png' }
    end
  end