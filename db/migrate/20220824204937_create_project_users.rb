class CreateProjectUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :project_users do |t|
      t.string :project_user_id
      t.references :project, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.boolean :read_access,  :default => true 
      t.boolean :write_access,  :default => true 
      t.boolean :update_access,  :default => true 
      t.boolean :delete_access,  :default => true 

      t.timestamps
    end
  end
end
