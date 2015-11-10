module UsersHelper
	def guest_user
		return User.find(6)
	end

end
