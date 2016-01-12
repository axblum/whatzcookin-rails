class CommentsController < ApplicationController

  def edit
    @comment = Comment.find(params[:id])
    @recipe = Recipe.find(params[:recipe_id])
    if request.xhr?
      render partial: "/comments/form"
    else
      render partial: "/comments/form"
    end
  end

  def update
    @comment = Comment.find(params[:id])
    @recipe = Recipe.find(params[:recipe_id])
    @comment.update_attributes(comment_params)
    if @comment.save
      if request.xhr?
        render json: @comment
      end
    end
  end

  def create
    @comment = Comment.new(comment_params)
    @recipe = Recipe.find(params[:recipe_id])
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
    comment = Comment.find(params[:id])
    if comment.destroy
      if request.xhr?
        render json: comment
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
