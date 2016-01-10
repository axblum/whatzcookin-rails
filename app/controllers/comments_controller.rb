class CommentsController < ApplicationController
  def edit
    if request.xhr?
      render partial: "/recipes/comment_form"
    else
      p 'the else'
    end
  end

  def update
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.update_attributes(user_id: current_user.id)
    #respond_to do |format|
      if @comment.save
        # format.html { redirect_to @comment, notice: 'comment was successfully created.' }
        # format.json { render partial: , status: :created, location: @comment }
        # format.js
        if request.xhr?
          render partial: "/recipes/comment"
        end
      else
        #format.html { render action: "new" }
        #format.json { render json: @comment.errors, status: :unprocessable_entity }
        #format.js
      end
    #end
  end

  def show
  end

  def destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:text, :recipe_id)
  end
end
