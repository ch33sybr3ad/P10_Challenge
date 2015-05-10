class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :jobtitle, :company, :location, :snippet, :url, :jobkey

      t.timestamps
    end
  end
end