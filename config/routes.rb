Rails.application.routes.draw do
  resources :happy_hours, only: [:index, :show]
  # other routes...
end
