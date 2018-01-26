class Helpers

  def self.current_user(session)
    @user = User.find(session[:user_id])
  end

  def self.is_logged_in?(session)
    binding.pry
    if sesion[:user_id] == @user.id
      true
    else
      false
    end
  end
end
