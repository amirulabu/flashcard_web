class Deck < ActiveRecord::Base
  def self.give_card(deckid,userid)

    return card = Card.where(deck_id: deckid.to_s)

  end
end