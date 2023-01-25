class User < ActiveRecord::Base
    # macro coming from ActiveRecord but only usable if the gem bcrypt is in the bundle
    has_secure_password #password, password=, password_confirmation, password_confirmation=, authenticate

    # I aliased the association by picking a name of my choice!
    # read more about it here: https://www.theodinproject.com/lessons/ruby-on-rails-active-record-associations
    has_many :created_systems, class_name: "System", foreign_key: :creator_id

    # validations
    validates :username, presence: true, length: {in: 4..25}
    validates :email, presence: true, uniqueness: true, format: {with: /\A(?<username>[^@\s]+)@((?<domain_name>[-a-z0-9]+)\.(?<domain>[a-z]{2,}))\z/i}
    validates :password, length: {in: 6..25}
end
