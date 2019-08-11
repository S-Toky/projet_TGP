class CommentsController < ApplicationController


  @@id_gossip = nil
  def index
    @comments = Comment.all
  end

  def new
    @@id_gossip = params[:id]
    @comment = Comment.new
  end

  def create
    a = User.last.id
    @comment = Comment.new(content: params['content'], user_id: a, gossip_id: @@id_gossip)
    @comment.save
    redirect_to ("/gossips/#{@@id_gossip}")
  end



  def edit
    @comments = Comment.find(params[:id])
  end

  def show
    #@gossips =  Gossip.find(params[:id].to_i)
    #@user =  User.find(@gossips.user_id)
    #@comment = Comment.find(params[:id].to_i)
  end

  def update
    @comments =  Comment.find(params[:id])
       comment_params = params.require(:comment).permit(:content)
        if @comments.update(comment_params)
          redirect_to ("/gossips/#{@@id_gossip}")

        else
          render :edit
        end
  end

  def destroy
    @comments = Comment.find(params[:id])
    @comments.destroy
    redirect_to ("/gossips/#{@@id_gossip}")
  end
end

