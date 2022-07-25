require 'rails_helper'

RSpec.describe 'Deparement Index page' do

  it "can show all desparments name and floor and the name of all employees" do
    department1 = Department.create!(name: 'HR', floor:'1')
    department2 = Department.create!(name: 'Management', floor:'25')
    department3 = Department.create!(name: 'Shipping/Receiving', floor:'Basement')

    employee1 = Employee.create!(name: 'Doug', level: 4, department_id: department3.id)
    employee2 = Employee.create!(name: 'Frank', level: 7, department_id: department3.id)
    employee3 = Employee.create!(name: 'Donna', level: 12, department_id: department3.id)
    employee4 = Employee.create!(name: 'Zane', level: 1, department_id: department1.id)
    employee5 = Employee.create!(name: 'Lee', level: 10, department_id: department1.id)

    visit '/departments'
    expect(page).to have_content('HR')
    expect(page).to have_content('Management')
    expect(page).to have_content('Shipping/Receiving')
    expect(page).to have_content('Doug')
    expect(page).to have_content('Frank')
    expect(page).to have_content('Donna')
    expect(page).to have_content('Zane')
    expect(page).to have_content('Lee')
    expect(page).to_not have_content('Cafeteria')
    expect(page).to_not have_content('Parker')
  end





end
