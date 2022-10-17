require './app'

class Main
  def run
    puts 'Welcome to the library system'
    app = App.new
    app.run
  end
end

main = Main.new
main.run
