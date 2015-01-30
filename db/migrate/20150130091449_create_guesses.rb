class CreateGuesses < ActiveRecord::Migration
  def change
    create_table :guesses do |t|
      t.string :round_id
      t.string :card_id
      t.string :correct # "yes" or "no"
    end

  end
end
