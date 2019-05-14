class PeopleController < ApplicationController
    def index
        @people = Person.all
    end 
    
    def create
       @people = Person.new
     end

    def read
        @people = Person.find(params[:id])
    end

    def edit 
        @people = Person.find(params[:id])
    end

    def update
        @people = Person.find(params[:id])
      
        if @people.update(people_params)
          redirect_to edit_person_path
        else
          render :edit
        end
    end

    def delete
      @people =  Person.find(params[:id]).destroy
      redirect_to people_path
    end
private
    def people_params
        params.require(person).permit(:first_name, :last_name, :age, :hair_color, :eye_color)
    end

end
