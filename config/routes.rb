Rails.application.routes.draw do
  root 'ideas#index'
  resources :ideas
  namespace 'api' do
    resources :ideas
  end
end
