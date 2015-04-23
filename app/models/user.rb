# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  user_name       :string
#  email           :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string
#


class User < ActiveRecord::Base

before_save { self.user_name = user_name.downcase }
	validates :user_name, presence: true, uniqueness: true,length: { minimum: 6 }

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false } 

  has_secure_password
  validates :password, length: { minimum: 6 }


	def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ?
           BCrypt::Engine::MIN_COST :
           BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

	has_many :games_created,
			class_name: "Game",
			foreign_key: "user_id"

	has_many :game_invitations_sent,
			class_name: "GameInvitation",
			foreign_key: "dungeon_master_id"

	has_many :game_invitations_received,
			class_name: "GameInvitation",
			foreign_key: "user_player_id"

	has_many :player_characters,
			class_name: "PlayerCharacter",
			foreign_key: "creator_id"	

	def games_playing
		games_playing = []
		player_characters.each do |player_character|
			games_playing.push(player_character.game) unless player_character.game.nil?
		end
		return games_playing
	end	
end
