class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :deck_id
      t.string :question
      t.string :answer
    end

  end
end
