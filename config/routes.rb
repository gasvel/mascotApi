Rails.application.routes.draw do
  get '/posts/list', to: "posts#list"

  resources :users do
    resources :posts
  end

end
