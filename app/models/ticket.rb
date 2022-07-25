class Ticket < ApplicationRecord

  has_many :employee_tickets
  has_many :employees, through: :employee_tickets

  def self.order_tickets
    order(age: :desc)
  end

  def self.oldest_ticket
    order(age: :desc).limit(1).pluck(:subject)
  end

end
