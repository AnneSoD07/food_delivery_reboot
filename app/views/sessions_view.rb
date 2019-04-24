class SessionsView
  def ask_for(stuff)
    puts "Give a #{stuff}"
    gets.chomp
  end

  def wrong_credentials
    puts "Sorry Try Again...."
  end
end
