Rails.application.routes.draw do
  devise_for :users
  root :to => 'site#index'
  resources(:information)
  resources(:posts)
  resources(:forums)
  get '/home' => 'site#index'
  get '/profile' => 'site#profile'
  get '/findpartners' => 'finder#search'
  get '/show/users/:id' => 'finder#show'
  get '/messages' => 'messages#inbox'
  get '/newmessage' => 'messages#newmessage'
  get "mailbox/inbox" => "mailbox#inbox", as: :mailbox_inbox
  get "mailbox/sent" => "mailbox#sent", as: :mailbox_sent
  get "mailbox/trash" => "mailbox#trash", as: :mailbox_trash

  # conversations
  resources :conversations do 
    member do
      post :reply
      post :trash
      post :untrash
    end
  end


  resources :finder do
  member do
    get :follow
    get :unfollow
  end
end
end
