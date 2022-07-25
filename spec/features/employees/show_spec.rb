require 'rails_helper'

RSpec.describe 'Employee show page' do

  it "shows the employees name and tickets ordered by oldest" do
    department1 = Department.create!(name: 'HR', floor:'1')
    department2 = Department.create!(name: 'Management', floor:'25')
    department3 = Department.create!(name: 'Shipping/Receiving', floor:'Basement')

    employee1 = Employee.create!(name: 'Doug', level: 4, department_id: department3.id)
    employee2 = Employee.create!(name: 'Frank', level: 7, department_id: department2.id)
    employee3 = Employee.create!(name: 'Donna', level: 12, department_id: department3.id)

    ticket1 = Ticket.create!(subject: 'Creaky Stairs', age: 2)
    ticket2 = Ticket.create!(subject: 'lava floor', age: 1)
    ticket3 = Ticket.create!(subject: 'lions den', age: 4)
    ticket4 = Ticket.create!(subject: 'toilet broken', age: 3)

    employee_ticket1 = EmployeeTicket.create!(ticket_id: ticket1.id, employee_id: employee1.id)
    employee_ticket2 = EmployeeTicket.create!(ticket_id: ticket2.id, employee_id: employee1.id)
    employee_ticket3 = EmployeeTicket.create!(ticket_id: ticket3.id, employee_id: employee1.id)
    employee_ticket4 = EmployeeTicket.create!(ticket_id: ticket4.id, employee_id: employee2.id)

    visit "/employees/#{employee1.id}"

    within "div#employee" do
      expect(page).to have_content("Doug")
      expect(page).to have_content("Creaky Stairs")
      expect(page).to have_content("lava floor")
      expect(page).to have_content("lions den")
      expect(page).to have_content("Shipping/Receiving")
      expect(page).to_not have_content("toilet broken")
      expect(page).to_not have_content("Management")
    end

    visit "/employees/#{employee2.id}"

    within "div#employee" do
      expect(page).to have_content("Frank")
      expect(page).to have_content("toilet broken")
      expect(page).to have_content("Management")
      expect(page).to_not have_content("Creaky Stairs")
      expect(page).to_not have_content("lava floor")
      expect(page).to_not have_content("lions den")
      expect(page).to_not have_content("Shipping/Receiving")
    end

    visit "/employees/#{employee3.id}"

    within "div#employee" do
      expect(page).to have_content("Donna")
      expect(page).to have_content("Shipping/Receiving")
      expect(page).to_not have_content("Doug")
      expect(page).to_not have_content("Frank")
      expect(page).to_not have_content("toilet broken")
      expect(page).to_not have_content("Management")
      expect(page).to_not have_content("Creaky Stairs")
      expect(page).to_not have_content("lava floor")
      expect(page).to_not have_content("lions den")
    end
  end

  it "has a form to submit a new ticket" do
    department1 = Department.create!(name: 'HR', floor:'1')
    department2 = Department.create!(name: 'Management', floor:'25')
    department3 = Department.create!(name: 'Shipping/Receiving', floor:'Basement')

    employee1 = Employee.create!(name: 'Doug', level: 4, department_id: department3.id)
    employee2 = Employee.create!(name: 'Frank', level: 7, department_id: department2.id)
    employee3 = Employee.create!(name: 'Donna', level: 12, department_id: department3.id)

    ticket1 = Ticket.create!(subject: 'Creaky Stairs', age: 2)
    ticket2 = Ticket.create!(subject: 'lava floor', age: 1)
    ticket3 = Ticket.create!(subject: 'lions den', age: 4)
    ticket4 = Ticket.create!(subject: 'toilet broken', age: 3)

    employee_ticket1 = EmployeeTicket.create!(ticket_id: ticket1.id, employee_id: employee1.id)
    employee_ticket2 = EmployeeTicket.create!(ticket_id: ticket2.id, employee_id: employee1.id)
    employee_ticket3 = EmployeeTicket.create!(ticket_id: ticket3.id, employee_id: employee1.id)
    employee_ticket4 = EmployeeTicket.create!(ticket_id: ticket4.id, employee_id: employee2.id)

    visit "/employees/#{employee1.id}"
save_and_open_page
    within "div#employee" do
      expect(page).to have_content('Creaky Stairs')
      expect(page).to have_content('lava floor')
      expect(page).to_not have_content('toilet broken')

      expect(page).to have_content("Add a Ticket")
      fill_in :ticket_subject, with: 'broken chair'
      click_on('Submit')
    end

    expect(current_path).to eq("/employees/#{employee1.id}")
    expect(page).to have_content('broken chair')
    expect(page).to have_content('Creaky Stairs')
    expect(page).to have_content('lava floor')

  end





end
