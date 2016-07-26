Rails.application.routes.draw do
  get '' => 'pages#home'
  get 'home' => 'pages#home'
  post "pages" => "pages#perform"
  resources :cards
end
