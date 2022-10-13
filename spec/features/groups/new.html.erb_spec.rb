require 'rails_helper'

RSpec.describe 'groups/new', type: :feature do
  before do
    @user = User.create(name: 'full name', email: 'name@gmail.com', password: 'password')
    @group = @user.groups.create(name: 'group 1', icon: 'http://localhost:3000/icon.png', author: @user)

    visit(new_user_session_path)
    fill_in 'user[email]', with: @user.email
    fill_in 'user[password]', with: @user.password
    click_button 'LOG IN'
  end

  describe "Visit groups' new page" do
    it 'should have group header' do
      visit(new_group_path)
      expect(page).to have_text('NEW CATEGORY')
    end

    it 'should have save button' do
      visit(new_group_path)
      expect(page).to have_selector(:link_or_button, 'Save category', exact: true)
    end

    it 'should have back link' do
      visit(new_group_path)
      expect(page).to have_selector(:link_or_button, 'Back to Categories', exact: true)
    end

    it 'redirect to groups page' do
      visit(new_group_path)
      click_link('Back to Categories', exact: true)
      expect(page).to have_current_path(groups_path)
    end
  end

  it 'should create group and redirect to groups page' do
    visit(new_group_path)
    click_button('Save category', exact: true)
    expect(page).to have_current_path(groups_path)
  end
end
