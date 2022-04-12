class CommentsController < ApplicationController
  before_action :set, only: [:index, :new, :create]
  def index
    @comments = @commentable.comments
  end

  def new
    @comments = @commentable.comments.new
  end

  def create
    @comment = @commentable.comments.new( params.require(:comment).permit(:content, :user_id))
    if @comment.save
      flash[:notice] = "comment successfully created"
      redirect_to event_path(@comment)
    else
      flash[:errors] = @comment.errors.full_messages
      redirect_to new_event_path
    end
  end

  def destroy
  end
  
  def set
    @commentable = Event.find(params[:event_id])
  end
end
