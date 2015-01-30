class User < ActiveRecord::Base

  def self.authentication(username,password)
    theuser = User.where(username:username).first #will return one single object

    if theuser && theuser.password == password
      true
    else
      false
    end
  end
end


# User.where
# User.all

# These two will return active record relations (like an array)

# ++++++++++++++++++

# User.first
# User.last
# User.find(10)
# These will return an object (single object)