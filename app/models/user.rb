class User < ActiveRecord::Base
  def to_user_list
    "#{id}. #{name} #{email}"
  end
end