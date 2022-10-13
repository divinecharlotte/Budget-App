require 'rails_helper'
RSpec.describe 'groups/index', type: :feature do
  before do
    @user = User.create(name: 'full name', email: 'name@gmail.com', password: 'password')
    @group = @user.groups.create(name: 'group 1', icon: 'http://localhost:3000/icon.png', author: @user)


    visit( new_user_session_path)
      fill_in 'user[email]', with: @user.email
      fill_in 'user[password]', with: @user.password
      click_button 'LOG IN'


  end

  describe "Visit groups' index page" do
    it 'should have group header' do
        visit( groups_path)
      expect(page).to have_text('CATEGORIES')
    end
    it 'should have group name' do
        visit( group_user_transactions_path(@group.id))
      expect(page).to have_text('group 1')
    end

    it 'should have group icon' do
        visit( group_user_transactions_path(@group.id))
      expect(page).to have_xpath("//img[contains(@src,'http://localhost:3000/icon.png')]")

    end

    it 'should have new page link' do
        visit(new_group_path)
      expect(page).to have_selector(:link_or_button, 'Save category', exact: true)
    end

    it 'redirect to transactions page' do
        visit(groups_path)
      click_link(@group.name)
      expect(page).to have_current_path(group_user_transactions_path(@group))
    end

    it 'redirect to add new group' do
        visit(groups_path)
      click_link('Add a new category', exact: true)
      expect(page).to have_current_path(new_group_path)
    end
  end
end