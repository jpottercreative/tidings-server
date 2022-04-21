Rails.application.routes.draw do

  devise_for :users,
    controllers: {
        sessions: 'users/sessions',
        registrations: 'users/registrations'
    }
  get '/member-data', to: 'users#show'

  patch '/profile-photo/:id', to: 'users#add_profile_photo'
  
  # make and show the gallery
  patch '/gallery/:id', to: 'galleries#update'
  get '/gallery/:id', to: 'galleries#show'
  get '/gallery/:id/blocks', to: 'blocks#gallery_blocks'
  
  get '/user-galleries', to: 'galleries#user_galleries'
  post '/new-gallery', to: 'galleries#new_gallery'
  
  # for creating new blocks
  post '/new-block/', to: 'blocks#new_block'  
  
  # get our shareable galleries
  get '/share/:id', to: 'share#show'
  
end