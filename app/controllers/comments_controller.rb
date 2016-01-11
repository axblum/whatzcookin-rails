class CommentsController < ApplicationController

  def edit
    if request.xhr?
      render partial: "/comments/form"
    else
      render partial: "/comments/form"
    end
  end

  def update
  end

  def create
    p "-" * 50
    p comment_params
    @recipe = Recipe.find_or_create_by(api_id: params[:recipe_id])
    @comment = Comment.new(comment_params)
    @comment.update_attributes(user_id: current_user.id, recipe_id: params[:recipe_id])
    if @comment.save
      if request.xhr?
        render partial: "/comments/comment", locals: {comment: @comment, recipe: @recipe}
      end
    end
  end

  def show
  end

  def destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
