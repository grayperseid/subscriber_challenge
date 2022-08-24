# frozen_string_literal: true

class SubscribersController < ApplicationController
  include PaginationMethods

  ##
  # GET /api/subscribers
  def index
    subscribers = Subscriber.all.order(created_at: :desc)

    total_records = subscribers.count
    limited_subscribers = subscribers.drop(offset).first(limit)

    render json: {subscribers: limited_subscribers, pagination: pagination(total_records)}, formats: :json
  end

  def create
    @subscriber = Subscriber.new(subscriber_params)

    if @subscriber.save
      render json: {message: "Subscriber created successfully"}, formats: :json, status: :created
    else
      render json: {message: @subscriber.errors.full_messages.to_sentence.to_s}, formats: :json, status: :unprocessable_entity
    end
  end

  def update
    @subscriber = Subscriber.find(params[:id])

    if @subscriber.update(subscriber_params)
      render json: {message: "Subscriber updated successfully"}, formats: :json, status: :ok
    else
      render json: {message: @subscriber.errors.full_messages.to_sentence.to_s}, formats: :json, status: :unprocessable_entity
    end
  end

  def subscriber_params
    params.permit(:name, :email, :status)
  end
end
