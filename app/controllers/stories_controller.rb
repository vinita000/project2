class StoriesController < ApplicationController
    def index
        @stories = Story.where(user_id: current_user.id)
       end
       
       def new
         @story = Story.new
       end 
    
       def create
        @story = Story.new(story_params.merge(user_id: current_user.id))

        if @story.save
            redirect_to @story
        else
            render 'new'
       end 
       end
    
       def show
          @story = Story.find(params[:id])
       end 
       
       def edit
          @story = Story.find(params[:id])
       end 
    
       def update
          @story = Story.find(params[:id])
          if @story.update(params[:story].permit(:title, :short_description, :full_story, :image))
             redirect_to @story
          else
            render 'edit'
          end   
       end 
    
        def destroy
            @story = Story.find(params[:id])
            @story.destroy
            redirect_to story_path
        end    

        def view_all_stories
           @stories = Story.where.not(user_id: current_user.id)
        end 
       private
    
       def story_params
          params.require(:story).permit(:title, :short_description, :full_story, :image)
       end 
    
    
    
    

end
