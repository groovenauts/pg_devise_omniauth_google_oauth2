class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:google_oauth2]

  class << self
    def current_user=(user)
      Thread.current[:current_user] = user
    end

    def current_user
      Thread.current[:current_user]
    end

    def current(user)
      orig_user, User.current_user = User.current_user, user
      begin
        return yield
      ensure
        User.current_user = orig_user
      end
    end

    def from_omniauth(access_token)
      data = access_token.info
      user = User.where(:email => data["email"]).first

      # To be created if they don't exist
      unless user
          pw = Devise.friendly_token[0,20]
          user = User.create( # name: data.name,
             email: data.email,
             password: pw,
             password_confirmation: pw,
          )
      end
      user
    end
  end

end
