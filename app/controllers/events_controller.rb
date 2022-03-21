class EventsController < ApplicationController
  # frozen_string_literal: true
  before_action :set, only: [:show, :edit, :update, :destroy]
  def index
    
    if params[:search]
      @events = Event.all
      @category = Category.all
      if Category.find_by("c_name = ?",params[:search])
         category = Category.find_by("c_name = ?",params[:search])
        @events = category.events.all
      else
        @events = Event.all
      end
    end
  end

  def show
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      flash[:notice] = "Event successfully created"
      redirect_to event_path(@event)
    else
      flash[:errors] = @event.errors.full_messages
      redirect_to new_event_path
    end
  end

  def edit
  end

  def update
    if @event.update(event_params)
      flash[:notice] = "Event successfully Updated"
      redirect_to event_path(@event)
    else
      flash[:errors] = @event.errors.full_messages
      redirect_to edit_event_path
    end
  end

  def destroy
  end
  private
    def event_params
      params.require(:event).permit(:name, :description, :event_date, :category_id)
    end

    def set
      @event= Event.find(params[:id])
    end
end
