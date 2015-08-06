require_relative "frank"
map("/welcomes") {run WelcomesController}
map("/users") {run UsersController}
map("/sessions") {run SessionsController}