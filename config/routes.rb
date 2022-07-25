Rails.application.routes.draw do
get "/departments", to: "departments#index"

get "/employees/:id", to: "employees#show"
post "/employee_tickets", to: "employee_tickets#create"
end
