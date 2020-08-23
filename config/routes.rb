Rails.application.routes.draw do
	resources :data_files
	root "data_files#new"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
 