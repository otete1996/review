class ChangeDatatypeScorePost < ActiveRecord::Migration[5.1]
  def change
    change_column :posts, :score, :float
  end
end
