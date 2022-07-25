class EmployeeTicketsController < ApplicationController

  def create
    require "pry"; binding.pry
    ticket = Ticket.find_by(subject: params[:ticket_subject])
    employee_ticket = EmployeeTicket.create(employee_id: params[:employee_id], ticket_id: ticket.id)
    redirect_to "/employees/#{employee_ticket.id}"
  end






end
