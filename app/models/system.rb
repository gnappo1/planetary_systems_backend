class System < ActiveRecord::Base
    has_many :planets
    validates :name, presence: true
end
