class UsersController < ApplicationController
	get "/" do
		@title = "All Users"
		erb :main_layout do
			@users = User.all
			erb :"users/index"
		end
	end

	get "/new" do
		erb :main_layout do
			erb :"users/new"
		end
	end

	post "/" do
		pw_salt = BCrypt::Engine.generate_salt
		pw_hash = BCrypt::Engine.hash_secret(params[:pw], pw_salt)
		User.create(
			first_name: params[:first_name],
			last_name: params[:last_name],
			email: params[:email],
			salt: pw_salt,
			encrypted_password: pw_hash
		)
		# @users = User.all
		# erb :"users/index"
		redirect "/users"
	end

	get "/:id" do
		erb :main_layout do
			@user = User.find(params[:id])
			erb :"users/show"
		end
	end

	get "/:id/edit" do
		erb :main_layout do
			@user = User.find(params[:id])
			erb :"users/edit"
		end
	end

	patch "/:id" do
		user = User.find(params[:id])
		user.update(
			first_name: params[:first_name],
			last_name: params[:last_name],
			email: params[:email]
		)
		redirect "/users"
	end

	delete "/:id" do
		user = User.find(params[:id])
		user.destroy
		redirect "/users"
	end
end
