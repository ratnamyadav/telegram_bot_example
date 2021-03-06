class TelegramWebhooksController < ApplicationController
  skip_before_action :verify_authenticity_token

  def callback
    dispatcher.new(params, user).process
    render nothing: true, head: :ok
  end

  def dispatcher
    BotMessageDispatcher
  end

  def from
    params[:message][:from]
  end

  def user
    @user ||= User.find_by(telegram_id: from[:id]) || register_user
  end

  def register_user
    @user = User.find_or_initialize_by(telegram_id: from[:id])
    @user.update_attributes!(first_name: from[:first_name], last_name: from[:last_name])
    @user
  end
end