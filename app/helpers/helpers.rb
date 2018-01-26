class Helpers

  def self.current_user(id)
    @user = User.find(id)
  end

  def self.is_logged_in?(id)
    if id == @user.id
      true
    else
      false
    end
  end
end
