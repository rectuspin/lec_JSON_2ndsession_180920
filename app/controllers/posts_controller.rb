class PostsController < ApplicationController
    
    def hello
        render json: { "msg": "Hello API!"}
    end
    
    def index
        posts = Post.all
        render json: { "posts": posts }
    end
    
    def create 
        post = Post.create(post_params)
        render json: { "post": post }
    end

    def show
       post = Post.find(params[:id])
       render json: { "post": post }
    end
    
    def update
       post = Post.find(params[:id])
       post.update(post_params)
       render json: { "post": post}
    end
    
    def destroy
       Post.destroy(params[:id])
       render json: { "status": "Success"}
    end
    
    private 
    
    def post_params
       params.permit(:title, :content)
    end
    
end
