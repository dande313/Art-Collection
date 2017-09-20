class User < ActiveRecord::Base
	has_many :works
	has_secure_password
end