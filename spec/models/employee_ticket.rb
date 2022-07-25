require 'rails_helper'

RSpec.describe EmployeeTicket do

  describe 'relationships' do
    it {should belong_to(:employees)}
    it {should belong_to(:tickets)}
  end





end
