require 'rails_helper'

RSpec.describe 'user_transactions/new', type: :feature do
  before do
    @user = User.create(name: 'full name', email: 'name@gmail.com', password: 'password')
    @group = @user.groups.create(name: 'group 1', icon: 'http://localhost:3000/icon.png', author: @user)

    visit(new_user_session_path)
    fill_in 'user[email]', with: @user.email
    fill_in 'user[password]', with: @user.password
    click_button 'LOG IN'
  end

  describe "Visit user_transactions' new page" do
    it 'should have transaction header' do
      visit(new_group_user_transaction_path(@group.id))
      expect(page).to have_text('NEW TRANSACTION')
    end

    it 'should have save button' do
      visit(new_group_user_transaction_path(@group.id))
      expect(page).to have_selector(:link_or_button, 'Save transaction', exact: true)
    end

    it 'should have back link' do
      visit(new_group_user_transaction_path(@group.id))
      expect(page).to have_selector(:link_or_button, 'Back to Transactions', exact: true)
    end

    it 'redirect to user_transactions page' do
      visit(new_group_user_transaction_path(@group.id))
      click_link('Back to Transactions', exact: true)
      expect(page).to have_current_path(group_user_transactions_path(@group.id))
    end

    it 'should create group and redirect to user_transactions page' do
      visit(new_group_user_transaction_path(@group.id))
      click_button('Save transaction', exact: true)
      expect(page).to have_current_path(group_user_transactions_path(@group.id))
    end
  end
end
