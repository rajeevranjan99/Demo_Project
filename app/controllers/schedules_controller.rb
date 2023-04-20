class SchedulesController < ApplicationController
    #before_action :authenticate_user!
   # before_action :set_schedule 
    def index 
        @schedules=Schedule.all#current_user.manager.schedules 
    end 
    def new 
        @schedule=Schedule.new#current_user.manager.schedules.new 
    end
    def show 
        @schedule=Schedule.find(params[:id])
    end
   
    def create 
        # debugger
       # @m= current_user.manager
        @manager= current_user.manager
        @schedule = @manager.schedules.create(schedule_params)#current_user.manager.Schedules.new(schedule_params)
        if @schedule.save 
            redirect_to schedules_path 
        else
            render :new 
        end 
    end

    def edit 
        @schedule = Schedule.find(params[:id])
    end

    def update
        @schedule = Schedule.find(params[:id])

        if @schedule.update(schedule_params)
           redirect_to schedule_path
        else
            render :edit 
        end 
    end
    def destroy 
        
        @schedule= Schedule.find(params[:id])
        if  @schedule.destroy 
            redirect_to schedules_path
        end
    end
    private 
        def schedule_params 
            params.require(:schedule).permit(:flight_name,:port_number,:arrival_time, :departure_time, :port_id, :flight_id)
        end
        # def set_schedule 
        #     @schedule=Schedule.find(params[:id])
        # end
        def port_params
            @port=Port.find(params[:id])
        end
        def flight_params 
            @flight=Flight.find(params[:id])
        end
end
