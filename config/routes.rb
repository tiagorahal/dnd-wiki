Rails.application.routes.draw do
  get "monsters", to: "monsters#index"
  get "monsters/:id", to: "monsters#show", as: "monster"
  devise_for :users
  root to: "home#index"

  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end

  post "/graphql", to: "graphql#execute"

  get "up" => "rails/health#show", as: :rails_health_check
end
