def run
  n = 1000000

  wins = 0
  puts "Running #{n} simulations with the strategy of sticking to your original choice."
  n.times { |i| wins +=1 if simulate(false) }
  puts "You won #{wins} times, which is a #{wins / n.to_f * 100}% win rate."
  puts "You would have won #{n - wins} times (#{(n - wins) / n.to_f * 100}%) if you had switched."

  puts "\n"

  wins = 0
  puts "Running #{n} simulations with the strategy of switching to the other door."
  n.times { |i| wins +=1 if simulate(true) }
  puts "You won #{wins} times, which is a #{wins / n.to_f * 100}% win rate."
  puts "You would have won #{n - wins} times (#{(n - wins) / n.to_f * 100}%) if you had stuck with your original choice."
end

def simulate(switch)
  doors = [1, 2, 3]

  # Prize door chosen at random, player picks a door
  prize_door = doors.shuffle.first
  chosen_door = doors.shuffle.first

  # Reveal a door
  revealed_door = doors.reject{ |d| d == chosen_door || d == prize_door }.first

  # Switch doors if strategy is to switch doors
  if switch
    chosen_door = doors.reject{ |d| d == chosen_door || d == revealed_door }.first
  end

  # Determine outcome, return true/false or win/lose
  chosen_door == prize_door
end

run
