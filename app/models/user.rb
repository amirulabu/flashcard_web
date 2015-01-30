class User < ActiveRecord::Base

  def self.authentication(username,password)
    theuser = User.where(username:username)

    theuser.each do |x|
      if x.password == password
        true
      else
        false
      end
    end

  end







end