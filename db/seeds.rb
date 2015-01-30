
require ::File.expand_path('../../config/environment', __FILE__)

# Include all of ActiveSupport's core class extensions, e.g., String#camelize
require 'active_support/core_ext'

class AddInitialCards < ActiveRecord::Migration
  $file = File.read('db/english-malay.txt')
  def self.add
    newdeck = Deck.create(name:"English-Malay")

    array =[]
    $file.each_line do |line|
      array << line.split(/\W{1,}/)
    end

    array.each do |x|
      Card.create(deck_id: newdeck.id, question: x[0], answer: x[1..-1].join(" "))
    end

    User.create(username:"amirul",password:"123")


  end



  # def down

  # end
end

AddInitialCards.add