require "pry"

def game_hash
  game_hash = {
    :home => {:team_name =>"Brooklyn Nets",
              :colors => "Black, White",
              :players =>[{"Alan Anderson" => {:number => 0,
                                      :shoe => 16,
                                      :points => 22,
                                      :rebounds => 12,
                                      :assists => 12,
                                      :steals => 3,
                                      :blocks => 1,
                                      :slam_dunks => 1}},
                          {"Reggie Evans" => {:number => 30,
                                      :shoe => 14,
                                      :points => 12,
                                      :rebounds => 12,
                                      :assists => 12,
                                      :steals => 12,
                                      :blocks => 12,
                                      :slam_dunks => 7}},
                          {"Brook Lopez" => {:number => 11,
                                      :shoe => 17,
                                      :points => 17,
                                      :rebounds => 19,
                                      :assists => 10,
                                      :steals => 3,
                                      :blocks => 1,
                                      :slam_dunks => 15}},
                          {"Mason Plumlee" => {:number => 1,
                                      :shoe => 19,
                                      :points => 26,
                                      :rebounds => 11,
                                      :assists => 6,
                                      :steals => 3,
                                      :blocks => 8,
                                      :slam_dunks => 5}},
                          {"Jason Terry" => {:number => 31,
                                      :shoe => 15,
                                      :points => 19,
                                      :rebounds => 2,
                                      :assists => 2,
                                      :steals => 4,
                                      :blocks => 11,
                                      :slam_dunks => 1}}]},
    :away => {:team_name =>"Charlotte Hornets",
              :colors => "Turquoise, Purple",
              :players =>[{"Jeff Adrien" => {:number => 4,
                                      :shoe => 18,
                                      :points => 10,
                                      :rebounds => 1,
                                      :assists => 1,
                                      :steals => 2,
                                      :blocks => 7,
                                      :slam_dunks => 2}},
                          {"Bismack Biyombo" => {:number => 0,
                                      :shoe => 16,
                                      :points => 12,
                                      :rebounds => 4,
                                      :assists => 7,
                                      :steals => 22,
                                      :blocks => 15,
                                      :slam_dunks => 10}},
                          {"DeSagna Diop" => {:number => 2,
                                      :shoe => 14,
                                      :points => 24,
                                      :rebounds => 12,
                                      :assists => 12,
                                      :steals => 4,
                                      :blocks => 5,
                                      :slam_dunks => 5}},
                          {"Ben Gordon" => {:number => 8,
                                      :shoe => 15,
                                      :points => 33,
                                      :rebounds => 3,
                                      :assists => 2,
                                      :steals => 1,
                                      :blocks => 1,
                                      :slam_dunks => 0}},
                          {"Kemba Walker" => {:number => 33,
                                      :shoe => 15,
                                      :points => 6,
                                      :rebounds => 12,
                                      :assists => 12,
                                      :steals => 7,
                                      :blocks => 5,
                                      :slam_dunks => 12}}]}
        }
end

def player_statistic(stat)
  player_name = nil 
  measure_of_stat = "calculating..."
  
  game_hash.each_value do |team_data|
    team_data.each_value {|players|
      binding.pry
      exit!
    }
  end
  
end
stat = :points
player_statistic(stat)

def num_points_scored(player)
  points = "calculating..."
  game_hash.each_value do |team_data|
    n = 0
    while n < team_data[:players].length do
    if (team_data[:players][n].keys).join == player
      points = team_data[:players][n][player][:points]
    end
    n += 1
    end
  end
  points
end

def shoe_size(player)
    shoe = "calculating..."
  game_hash.each_value do |team_data|
    n = 0
    while n < team_data[:players].length do
    if (team_data[:players][n].keys).join == player
      shoe = team_data[:players][n][player][:shoe]
    end
    n += 1
    end
  end
  shoe
end

def team_colors(team_name)
  colors = "calculating"
  game_hash.each_value do |team_data|
    team_data[:team_name]
    if team_data[:team_name] == team_name
      team_data[:colors]
      colors  = team_data[:colors]
    end
  end
  colors.split(", ")
end


def team_names
# return an array of the team names.
  team_names = []
  game_hash.each_value do |team_data|
    team_names.push(team_data[:team_name])
  end
  team_names
end


def player_numbers(the_team)
#return arrar of the jersey numbers for that team_name
  jersey_ary = []
  game_hash.each_value do |team_data|
    if team_data[:team_name] == the_team
      n = 0
      while n < team_data[:players].length
        player = team_data[:players][n].keys.join
        jersey_nmbr = team_data[:players][n][player][:number]
        jersey_ary.push(jersey_nmbr)
      n += 1
      end
    end
  end
  jersey_ary
end


def player_stats(player)
  stats = {}
  game_hash.each_value do |team_data|
    n = 0
    while n < team_data[:players].length
      if team_data[:players][n].keys.join == player
        stats = team_data[:players][n][player]
      end
      n += 1
    end
  end
  stats
end


def big_shoe_rebounds
  biggest_shoe_wearer = "bigfoot"
  shoe_size = 1
  rebounds = 0
  game_hash.each_value do |team_data|
    team_data[:players].each do |player|
      player.each_value do |stats|
        if stats[:shoe] > shoe_size
          shoe_size = stats[:shoe]
          biggest_shoe_wearer = player.keys.join
        end
      end
    end
    team_data[:players].each do |player|
      if player.keys.join == biggest_shoe_wearer
        rebounds = player[biggest_shoe_wearer][:rebounds]
      end
    end
  end
  rebounds
end


def most_points_scored
  who_scored = "most points?"
  points_scored = 0
    game_hash.each_value do |team_data|
      team_data[:players].each do |player|
        player.each_value do |stats|
          if stats[:points] > points_scored
            points_scored = stats[:points]
            who_scored = player.keys.join
          end
        end
      end
    end
  who_scored
end

def winning_team
  p "+++++++++++++start winning_team +++++++++++++"
  home_team_points = 0
  away_team_points = 0
  game_hash[:home][:players].each do |player|
    player.each_value do |stats|
      home_team_points += stats[:points]
    end
  end
  game_hash[:away][:players].each do |player|
    player.each_value do |stats|
      away_team_points += stats[:points]
    end
  end
  if home_team_points > away_team_points
    game_hash[:home][:team_name]
  else
    game_hash[:away][:team_name]
  end
end


def player_with_longest_name
  longest_length = 5
  longest_name = "it's a mouthful"
  game_hash.each_value do |stats|
    stats[:players].each do |name|
      if name.keys.join.length > longest_length
        longest_length = name.keys.join.length
        longest_name = name.keys.join
      end
    end
  end
  longest_name
end


def long_name_steals_a_ton?
  most_steals = 0
  who_steals = "thief"
  game_hash.each_value do |team_data|
    team_data[:players].each do |player|
      player.each_value do |stats|
        stats[:steals]
        if stats[:steals] > most_steals
          most_steals = stats[:steals]
          who_steals = player.keys.join
        end
      end
    end
  end
  (who_steals == player_with_longest_name) ? (true) : (false)
end
