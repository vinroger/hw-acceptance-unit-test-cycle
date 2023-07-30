class Movie < ActiveRecord::Base
  def self.same_director(director)
    where(director: director)
  end
  
end
