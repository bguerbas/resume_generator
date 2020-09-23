class RemoveOauthAccountsTable < ActiveRecord::Migration[6.0]
  def change
    drop_table :oauth_accounts
  end
end
