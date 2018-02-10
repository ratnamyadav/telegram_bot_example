Rails.application.routes.draw do
  #telegram_webhooks TelegramWebhooksController
  post '/webhooks/telegram_vbc43edbf1614a075954dvd4bfab34l1' => 'telegram_webhooks#callback'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
