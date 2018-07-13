Rails.application.routes.draw do

  # get 'home/index'


	root to: 'home#index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :expenses

  resources :incomes

  get "reports", to: "home#reports"
  get "load_reports", to: "home#load_report_data"

end
