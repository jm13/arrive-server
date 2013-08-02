class Course < ActiveRecord::Base
	validates :name,  presence: true,
                    length: { minimum: 1, allow_blank: true },
                    uniqueness: true

  belongs_to :school
end
