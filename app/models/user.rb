class User < ActiveRecord::Base
  attr_accessor :username, :password, :balance

  def initialize(username, password, balance)
    @username, @password, @balance = username, password, balance
    # self.save
  end
end
