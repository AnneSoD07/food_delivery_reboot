require_relative '../views/sessions_view'

class SessionsController
  def initialize(employee_repository)
    @view = SessionsView.new
    @employee_repository = employee_repository
  end

  def sign_in
    # demander un username
    username = @view.ask_for('username')
    # demander un password
    password = @view.ask_for('password')
    # chercher un user qui match sur le username
    employee = @employee_repository.find_by_username(username)
    if employee && employee.password == password
      return employee
    end

    @view.wrong_credentials
    sign_in
  end
end
