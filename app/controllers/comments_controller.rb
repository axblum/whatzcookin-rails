class CommentsController < ApplicationController
  def edit
  end

  def update
  end

  def create
    @comment = Comment.new(comment_params)

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @comment, notice: 'comment was successfully created.' }
        format.json { render json: @comment, status: :created, location: @comment }
        format.js
      else
        format.html { render action: "new" }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # def create
  #   p "$" * 100
  #   p current_user.id
  #   p params
  #   @new_comment = Comment.create!(text: params[:comment][:text],
  #                                  user_id: current_user.id)
  #   if request.xhr?
  #     return @new_comment.to_json
  #   else
  #     redirect "/recipes/#{params[:id]}"
  #   end

  #   # @recipe = Recipe.find(params[:recipe_id])
  #   # @comment = @recipe.comments.build(text: params[:comment][:text],
  #   #                                   user_id: current_user.id)
  #   # if @comment.save
  #   #   # respond_to do |format|
  #   #   #   format.html { redirect_to action: :index }
  #   #   #   format.json { render json: comment }
  #   #   # end
  #   #   flash[:success] = 'Comment posted.'
  #   #   redirect_to @recipe
  #   # else
  #   #   render @recipe
  #   # end
  # end

  def show
  end

  def destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
