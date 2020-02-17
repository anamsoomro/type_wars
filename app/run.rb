require_relative '../config/environment'

$prompt = TTY::Prompt.new
$font = TTY::Font.new(:starwars)
$pastel = Pastel.new

def play
    system 'clear'
    play_music('music/star_wars_theme.mp3')
    title
    user_login
    action
end

def title
    puts $pastel.yellow($font.write("TYPE"))
    puts $pastel.yellow($font.write("WARS"))
end

def user_login
    user = $prompt.select($pastel.yellow("Select Username"), ["new_user", User.alpha_order].flatten, filter: true)
    if user == "new_user"
        user = $prompt.ask('enter username') do |username|
            username.required true
            username.messages[:required?] = 'enter a username to continue...                      '
            username.validate {|input| User.alpha_order.exclude? input}
            username.messages[:valid?] = 'username taken, please try again...                   '
        end
    end
    @current_user = User.find_or_create_by(username: user)
end

def action
    $prompt.select($pastel.yellow("make selection"), filter: true) do |action|
        action.choice 'start new game', -> {select_theme}
        action.choice 'checkout stats', -> {see_stats}
        action.choice 'exit', -> {exit_game}
    end
end

def select_theme
    system 'clear'
    title
    theme = $prompt.select($pastel.yellow("pick a theme"), [$pastel.blue("go back"), Theme.pluck(:name)].flatten, filter: true)
    if theme == "\e[34mgo back\e[0m"
        system 'clear'
        title
        action
    else
        @current_theme = Theme.find_by(name: theme)
        select_time
    end
end

def select_time
    time = $prompt.select($pastel.yellow('select game time length in seconds'), filter: true) do |time|
        time.choice '20 sec', -> {@game_time = 20}
        time.choice '30 sec', -> {@game_time = 30}
        time.choice '60 sec', -> {@game_time = 60}
    end
    new_game
end

def new_game
    system 'clear'
    title
    puts $pastel.blue("you have #{@game_time} seconds, type as many words as you can!")
    5.downto(0) do |x|
        sleep 1
        puts $pastel.blue("   #{x}...")
    end
    play_theme_music
    error = $pastel.red.bold.detach
    words = @current_theme.words.split(", ")
    typed_words = 0
    now = Time.now
    loop do
        if Time.now < now + @game_time
            loop do 
                typing_prompt = words.sample
                play = $prompt.ask(typing_prompt, timeout: 3)
                if play == typing_prompt && Time.now < now + @game_time
                    typed_words += 1
                    break
                elsif Time.now > now + @game_time
                    puts $pastel.yellow("TIMES UP!!")
                    break 
                else 
                    puts error.(incorrect)
                    break 
                end
            end 
        else 
            break
        end
    end
    score = (typed_words.to_f / @game_time.to_i * 60).to_i
    Game.create(score: score, user_id: @current_user.id, theme_id: @current_theme.id)
    print $pastel.yellow("YOUR SPEED: ") 
    puts $pastel.blue("#{score} WPM")
    puts $pastel.yellow("TOP SPEED FOR #{@current_theme.name.upcase}: #{@current_theme.high_score.score} WPM")
    switch_song
    play_music('music/star_wars_theme.mp3')
    game_next
end

def incorrect
    "Slow down!, Try again!, Try again bud!, Whoops!, Error!, Slow down bud!, Use the force next time!, You type like a strom trooper shoots!, Wrong!, ".split(", ").sample
end

def game_next
    $prompt.select("make selection", filter: true) do |action|
        action.choice 'play again', -> {select_theme}
        action.choice 'check stats', -> {see_stats}
        action.choice 'exit', -> {exit_game}
    end
end

def see_stats
    system 'clear'
    title
    $prompt.select($pastel.yellow("make selection"), filter: true) do |stat|
        stat.choice $pastel.blue('go back'), -> {action}
        stat.choice 'your high score', -> {my_high_score}
        stat.choice 'your ranking', -> {my_global_rank}
        stat.choice 'high scores', -> {User.top_3}
        stat.choice 'leader board', -> {Theme.leaders}
        # stat.choice 'theme plays', -> {Theme.plays}
        # stat.choice 'most active players', -> {User.most_active}
        # stat.choice 'fastest players', -> {User.print_fastest_users}
    end
    stat_next
end

def stat_next
    $prompt.select($pastel.yellow("make selection"), filter: true) do |action|
        action.choice 'go back', -> {see_stats}
        action.choice 'play game', -> {select_theme}
        action.choice 'exit', -> {exit_game}
    end
end

def my_high_score
    if @current_user.games == []
        puts $pastel.blue("looks like you havent played a game, play!")
        $prompt.select($pastel.yellow('make selection', filter: true)) do |selection|
            selection.choice 'play game', -> {select_theme}
            selection.choice 'go back', -> {see_stats}
            selection.choice 'exit', -> {exit_game}
        end
    else
        @current_user.print_high_score
    end
end

def my_global_rank
    if @current_user.games == []
        puts $pastel.blue("looks like you havent played a game, play!")
        $prompt.select($pastel.yellow('make selection', filter: true)) do |selection|
            selection.choice 'play game', -> {select_theme}
            selection.choice 'go back', -> {see_stats}
            selection.choice 'exit', -> {exit_game}
        end
    else
        @current_user.global_rank
    end
end

def exit_game
    system 'clear'
    title
    User.clean_users
    stop_music_at_exit
    exit
end

def play_theme_music
    if @current_theme.name == "the office"
        switch_song
        play_music('music/the_office.mp3')
    elsif @current_theme.name == "coding"
        switch_song
        play_music('music/tetris.mp3')
    elsif @current_theme.name == "runtime terror"
        switch_song
        play_music('music/halo.mp3')
    elsif @current_theme.name == "russian"
        switch_song
        play_music('music/handball1.mp3')
    elsif @current_theme.name == "numbers"
        switch_song
        play_music('music/mario64.mp3')
    elsif @current_theme.name == "jibberish"
        switch_song
        play_music('music/mario64.mp3')
    elsif @current_theme.name == "star wars"
        switch_song
        play_music('music/dual_of_fates.mp3')
    elsif @current_theme.name == "dutch"
        switch_song
        play_music('dutch.mp3')
    elsif @current_theme.name == "americans speaking dutch"
        switch_song
        play_music('dutch.mp3')
    end
end

def play_music(file)
    @pid = spawn( 'afplay', file )
end

def switch_song
    Process.kill "TERM", @pid
end

def stop_music_at_exit
    pid = fork{ system 'killall', 'afplay' }
end


# update the README
# put all music methods in own class/file
# add the no games scenarios to the user class
# basically clean up the run game file




