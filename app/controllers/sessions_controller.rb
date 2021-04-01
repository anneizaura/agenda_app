require 'date'

class SessionsController < ApplicationController
  before_action :set_session, only: %i[mentor index new create]

  def mentor
  end

  def index
    @sessions = Session.all
  end

  def new
    @session = Session.new
  end

  def create
    new_session = Session.new(session_params)

    if valid_date?
      new_session.save
    end
    redirect_to sessions_new_path(new_session.id)
  end

  private

  def valid_date?(date)
    date_format = '%Y-%m-%d'
    DateTime.strptime(date, date_format)
    true
  rescue ArgumentError
    false
  end

  def set_session
    @session = Session.find(params[:id])
  end

  def session_params
    params.require(:session).permit(:date, :conference_room, :start_time, :end_time, :mentor, :description)
  end
end
