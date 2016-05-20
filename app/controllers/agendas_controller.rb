class AgendasController < ApplicationController
  def create
    new_agenda = Agenda.new(agenda_params)
    if new_agenda.save
      redirect_to "/pools/#{params[:pool_id]}/agendas"
    end
  end

  private
  def agenda_params
    params.require(:agenda).permit(:start_date, :end_date, :pool_id)
  end
end
