require_relative 'config/environment.rb'

if OS.mac?
    play
else 
    require_relative 'run_no_music.rb'
    # overwrites run file with all references to afplay commented out
    play
end