Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/try" => "game#try"
  get "/new_game" => "game#reset"
end
