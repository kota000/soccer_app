class AddTeamnameToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :teamname, :string
  end
end
