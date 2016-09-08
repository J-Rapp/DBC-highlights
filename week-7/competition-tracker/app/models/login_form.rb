class LoginForm
  include ActiveModel::Model

  attr_accessor(
    :username,
    :password
  )

  attr_reader :user

  validates :username, presence: true
  validates :password, presence: true

  def authenticated?
    @user = nil
    if valid?
      user = User.find_by_username(@username)
      if user && user.authenticate(@password)
        @user = user
      else
        @errors.add(:login, :message => "Username and/or password entered incorrectly")
      end
    end
    !!@user
  end

end
