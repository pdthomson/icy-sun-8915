require 'rails_helper'

RSpec.describe Ticket do

  describe 'relationships' do
    it { should have_many :employee_tickets }
    it { should have_many(:employees).through(:employee_tickets)}
  end

  describe 'class methods' do
    it "can sort the tickets oldest to youngest" do
      department1 = Department.create!(name: 'HR', floor:'1')
      department2 = Department.create!(name: 'Management', floor:'25')
      department3 = Department.create!(name: 'Shipping/Receiving', floor:'Basement')

      employee1 = Employee.create!(name: 'Doug', level: 4, department_id: department3.id)
      employee2 = Employee.create!(name: 'Frank', level: 7, department_id: department2.id)
      employee3 = Employee.create!(name: 'Donna', level: 12, department_id: department3.id)

      ticket1 = Ticket.create!(subject: 'creaky stairs', age: 2)
      ticket2 = Ticket.create!(subject: 'lave floor', age: 1)
      ticket3 = Ticket.create!(subject: 'lions den', age: 4)
      ticket4 = Ticket.create!(subject: 'toilet broken', age: 3)

      employee_ticket1 = EmployeeTicket.create!(ticket_id: ticket1.id, employee_id: employee1.id)
      employee_ticket2 = EmployeeTicket.create!(ticket_id: ticket2.id, employee_id: employee1.id)
      employee_ticket3 = EmployeeTicket.create!(ticket_id: ticket3.id, employee_id: employee1.id)
      employee_ticket4 = EmployeeTicket.create!(ticket_id: ticket4.id, employee_id: employee2.id)

      expect(Ticket.order_tickets).to eq([ticket3, ticket4, ticket1, ticket2])
    end

    it "can return the oldest ticket" do
      department1 = Department.create!(name: 'HR', floor:'1')
      department2 = Department.create!(name: 'Management', floor:'25')
      department3 = Department.create!(name: 'Shipping/Receiving', floor:'Basement')

      employee1 = Employee.create!(name: 'Doug', level: 4, department_id: department3.id)
      employee2 = Employee.create!(name: 'Frank', level: 7, department_id: department2.id)
      employee3 = Employee.create!(name: 'Donna', level: 12, department_id: department3.id)

      ticket1 = Ticket.create!(subject: 'creaky stairs', age: 2)
      ticket2 = Ticket.create!(subject: 'lave floor', age: 1)
      ticket3 = Ticket.create!(subject: 'lions den', age: 4)
      ticket4 = Ticket.create!(subject: 'toilet broken', age: 3)

      employee_ticket1 = EmployeeTicket.create!(ticket_id: ticket1.id, employee_id: employee1.id)
      employee_ticket2 = EmployeeTicket.create!(ticket_id: ticket2.id, employee_id: employee1.id)
      employee_ticket3 = EmployeeTicket.create!(ticket_id: ticket3.id, employee_id: employee1.id)
      employee_ticket4 = EmployeeTicket.create!(ticket_id: ticket4.id, employee_id: employee2.id)

      expect(Ticket.oldest_ticket).to eq(["lions den"])
    end

  end
end
