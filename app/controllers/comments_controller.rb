class CommentsController < ApplicationController
  before_filter :load_conversation
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  def index
    @comments = Comment.all
  end

  def show
  end

  def new
    @comment = Comment.new
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def create
    @comment = @board.conversation.comment.new(comment_params)
    if @comment.save
        redirect_to board_conversations_url(@board)
    else
      render :new
    end
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update_attributes(:last_commenter_id => current_user.id, :last_comment_at => Time.now)
      redirect_to @comment, notice: 'Comment was successfully updated.'
      render :show
    else
      render :edit
    end
  end

  def destroy
    @comment = Comment.find(params[:id])

    @comment.destroy
    redirect_to board_url, notice: 'Comment was successfully deleted.'
  end

  private
    def load_conversation
        @conversation = Conversation.find(params[:conversation_id])
    end

    def set_comment
      @comment = Comment.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:body)
    end
end
