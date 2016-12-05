class CreateOauthClients < ActiveRecord::Migration
  def change
    create_table :oauth_clients do |t|

      t.timestamps null: false
    end
  end
end
