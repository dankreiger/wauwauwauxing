Rails.application.routes.draw do

  root 'stocks#index'
  get  'stocks/index' => 'stocks#index'

end
