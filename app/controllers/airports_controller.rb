class AirportsController < ApplicationController
    def index 
        @airports=Airport.all 
    end 

    def show 
        @airport = Airport.find(params[:id])
    end 

    def new 
        @airport=Airport.new 
    end 


    def edit 
        @airport = Airport.find(params[:id])
    end 

    def create 
        @airport = Airport.new(airport_params)
        if @airport.save 
            cookies[:airport_info]=@airport.id
            redirect_to @airport 
        else
            render 'new'
        end
    end

    def update 
        @airport = Airport.find(params[:id])
        if @airport.update(airport_params)
            redirect_to  @airport
        else 
            render 'edit'
        end
    end
    

    def destroy 
        @airport = Airport.find(params[:id])
        if @airport.destroy 
            redirect_to airports_path
        end 
    end
    private 
        def airport_params 
            params.require(:airport).permit(:airport_name) 
        end

end
