class ManagersController < ApplicationController

    def index
       # @managers = current_admin.managers
        @managers=Manager.all
        @flight=Flight.all

    end


    def show 
        @manager=Manager.find(params[:id])
    end

    def new
        @manager = Manager.new
    end

    def create
        @manager = current_user.build_manager(manager_params)
        if @manager.save
            redirect_to @manager, notice: "Manager was successfully created."
        else
            render :new
        end
    end


    def edit 
        @manager=Manager.find(params[:id])
    end

    def update 
        @manager=Manager.find(params[:id])
        if @manager.update(manager_params)    
            redirect_to manager_path
        else 
            render :edit 
        end 
    end
        def destroy 
            @manager= Manager.find(params[:id]) 
            if @manager.destroy 
                redirect_to managers_path
            end
        end

    private

    def manager_params
        params.require(:manager).permit(:first_name, :last_name, :phone_number, :address)
    end
end