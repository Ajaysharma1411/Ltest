class User < ActiveRecord::Base

	has_secure_password
  
validates :fname, presence: true, length: { maximum: 50}
validates :lname, presence: true, length: { maximum: 50}
validates :username, presence: true, length: { maximum: 50}
validates :password, length: { minimum: 4 }, on: :create

VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }


 validates :image, presence: true
	                
has_many :friend_ships
has_many :friends, :through => :friend_ships
has_many :inverse_friend_ships, :class_name => "FriendShip", :foreign_key => "friend_id"
has_many :inverse_friends, :through => :inverse_friend_ships, :source => :user

    #has_many :received_friendships, class_name: "Friendship", foreign_key: "friend_id"

    #has_many :active_friends, -> { where(friendships: { accepted: true}) }, through: :friendships, source: :friend
    #has_many :received_friends, -> { where(friendships: { accepted: true}) }, through: :received_friendships, source: :user
    #has_many :pending_friends, -> { where(friendships: { accepted: false}) }, through: :friendships, source: :friend
    #has_many :requested_friendships, -> { where(friendships: { accepted: false}) }, through: :received_friendships, source: :userend

end

