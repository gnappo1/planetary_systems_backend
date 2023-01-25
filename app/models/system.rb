class System < ActiveRecord::Base
    has_many :planets, dependent: :destroy
    # I aliased the association by picking a name of my choice!
    # read more about it here: https://www.theodinproject.com/lessons/ruby-on-rails-active-record-associations
    
    belongs_to :creator, class_name: "User"

    # validations
    validates :name, presence: true
end
