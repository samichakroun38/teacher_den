class User::ProfileController < User::UserController
  def show
    @user = current_user
  end
end
