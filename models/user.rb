class User < ActiveRecord::Base
	# 'dependent: destroy' destroys all posts related to that user once that user is destroyed
	has_many :posts, dependent: :destroy
end