class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, :password
      t.has_many :jobs


      t.timestamps
    end
  end
end