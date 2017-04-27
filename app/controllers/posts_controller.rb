class PostsController < InheritedResources::Base

  private

    def post_params
      params.require(:post).permit(:title, :description, :is_published)
    end
end

