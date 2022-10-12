require 'application_system_test_case'

class UserTransactionsTest < ApplicationSystemTestCase
  setup do
    @user_transaction = user_transactions(:one)
  end

  test 'visiting the index' do
    visit user_transactions_url
    assert_selector 'h1', text: 'User transactions'
  end

  test 'should create user transaction' do
    visit user_transactions_url
    click_on 'New user transaction'

    fill_in 'Amount', with: @user_transaction.amount
    fill_in 'Name', with: @user_transaction.name
    click_on 'Create User transaction'

    assert_text 'User transaction was successfully created'
    click_on 'Back'
  end

  test 'should update User transaction' do
    visit user_transaction_url(@user_transaction)
    click_on 'Edit this user transaction', match: :first

    fill_in 'Amount', with: @user_transaction.amount
    fill_in 'Name', with: @user_transaction.name
    click_on 'Update User transaction'

    assert_text 'User transaction was successfully updated'
    click_on 'Back'
  end

  test 'should destroy User transaction' do
    visit user_transaction_url(@user_transaction)
    click_on 'Destroy this user transaction', match: :first

    assert_text 'User transaction was successfully destroyed'
  end
end
