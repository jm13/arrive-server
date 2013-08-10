class School < ActiveRecord::Base
	validates :name,  presence: true,
                    length: { minimum: 1, allow_blank: true }

  has_many :courses, -> {order :name}
  has_many :users
end
