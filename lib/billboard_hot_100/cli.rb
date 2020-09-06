class BillboardHot100::CLI

    def initialize  
        create_songs
        @indent = " " * 12 # Adjust indent spacing to your preference
    end

    def create_songs
        song_array = BillboardHot100::Scraper.scrape_main_page
        BillboardHot100::Song.create_from_array(song_array)
    end

    def start
        display_main_menu
        menu_options = ["1", "2", "3", "4", "5"]
        @input = gets.strip
        @restart = nil

        check_input(menu_options)

        case @input
            when "1"
                display_top_10_songs
            when "2"
                display_top_100_songs
            when "3"
                go_to_analyses_menu
            when "4"
                go_to_datasets_menu
            when "5"
                @exit = true
        end

        restart_or_exit_menu unless @restart || @exit
        @restart ? start : say_goodbye
    end

    def display_main_menu
        puts ""
        puts "#{@indent}~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~".light_cyan
        puts "#{@indent}   WELCOME TO THE BILLBOARD HOT 100 CLI!   "
        puts "#{@indent}~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~".light_cyan
        puts ""
        puts "#{@indent}WHAT WOULD YOU LIKE TO DO?                 "
        puts "#{@indent}Enter 1 - 5 to select an option below      "
        puts ""
        puts "#{@indent}MAIN MENU                                  "
        puts "#{@indent}1 | View this week's top 10 songs          "
        puts "#{@indent}2 | View this week's top 100 songs         "
        puts "#{@indent}3 | View some analyses                     "
        puts "#{@indent}4 | View the datasets                      "
        puts "#{@indent}5 | Exit                                   "
        puts ""
        puts "#{@indent}~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~".light_cyan
    end

    def display_top_10_songs
        puts "#{@indent}-------------------------------------------"
        puts "#{@indent}THIS WEEK'S TOP 10 SONGS                   "
        puts "#{@indent}-------------------------------------------"
        puts ""
        puts "#{@indent}RANK (CHANGE) - SONG - ARTIST              "
        puts ""
        list_top_100_songs_this_week[0,10].each {|song| puts @indent + song}
        puts ""
    end

    def display_top_100_songs
        puts "#{@indent}-------------------------------------------"
        puts "#{@indent}THIS WEEK'S TOP 100 SONGS                  "
        puts "#{@indent}-------------------------------------------"
        puts ""
        puts "#{@indent}RANK (CHANGE) - SONG - ARTIST              "
        puts ""
        list_top_100_songs_this_week.each {|song| puts @indent + song}
        puts ""
    end

    def list_top_100_songs_this_week
        BillboardHot100::Song.sort_by_rank_this_week.map do |song|
            "RANK #{song.rank_this_week} (#{song.delta}) - #{song.name} - #{song.artist}"
        end
    end

    def go_to_analyses_menu
        display_analyses_menu
        menu_options = ["1", "2", "3", "4", "5"]
        @input = gets.strip

        check_input(menu_options)

        case @input
            when "1"
                display_new_songs_this_week
            when "2"
                display_no_1_peak_songs
            when "3"
                display_top_10_by_duration
            when "4"
                @restart = true
            when "5"
                @exit = true
        end

        return_menu_with_3_options unless @restart || @exit
    end

    def display_analyses_menu
        puts "#{@indent}-------------------------------------------"
        puts "#{@indent}ANALYSES - WHAT DO YOU WANT TO KNOW?       "
        puts "#{@indent}-------------------------------------------"
        puts ""                                                    
        puts "#{@indent}1 | Which songs are new this week?         "
        puts "#{@indent}2 | Which songs have peaked #1?            "
        puts "#{@indent}3 | Which songs have been on the chart the longest?"
        puts "#{@indent}4 | Return to the main menu                "
        puts "#{@indent}5 | Exit                                   "
        puts ""                                           
        puts "#{@indent}-------------------------------------------"
    end

    def display_new_songs_this_week
        puts "#{@indent}-------------------------------------------"
        puts "#{@indent}THIS WEEK'S NEW SONGS                      "
        puts "#{@indent}-------------------------------------------"
        puts ""
        puts "#{@indent}DURATION - RANK - SONG - ARTIST            "
        puts ""
        BillboardHot100::Song.select_new_songs.each do |song|
            puts "#{@indent}#{song.duration} WEEKS - RANK #{song.rank_this_week} - #{song.name} - #{song.artist} - #{song.duration}"
        end
        puts ""
    end

    def display_no_1_peak_songs
        puts "#{@indent}-------------------------------------------"
        puts "#{@indent}ALL SONGS THAT HAVE PEAKED #1              "
        puts "#{@indent}-------------------------------------------"
        puts ""
        puts "#{@indent}PEAK - RANK (CHANGE) - DURATION - SONG - ARTIST   " 
        puts ""
        BillboardHot100::Song.select_no_1_peak_songs.each do |song|
            puts "#{@indent}PEAK #{song.peak_rank} - RANK #{song.rank_this_week} (#{song.delta}) - #{song.duration} WEEKS - #{song.name} - #{song.artist}" 
        end
        puts ""   
    end

    def display_top_10_by_duration
        puts "#{@indent}-------------------------------------------"
        puts "#{@indent}TOP 10 SONGS ON THE CHART LONGEST          "
        puts "#{@indent}-------------------------------------------"
        puts ""
        puts "#{@indent}DURATION - RANK (CHANGE) - PEAK - SONG - ARTIST"
        puts ""
        BillboardHot100::Song.select_top_10_by_duration.each do |song|
            puts "#{@indent}#{song.duration} WEEKS - RANK #{song.rank_this_week} (#{song.delta}) - PEAK #{song.peak_rank} - #{song.name} - #{song.artist}" 
        end
        puts""
    end

    def go_to_datasets_menu
        display_dataset_menu
        menu_options = ["1", "2", "3", "4", "5"]
        @input = gets.strip

        check_input(menu_options)

        case @input
            when "1"
                display_dataset_by_rank_this_week
            when "2"
                display_dataset_by_peak_rank
            when "3"
                display_dataset_by_duration
            when "4"
                @restart = true
            when "5"
                @exit = true
        end

        return_menu_with_3_options unless @restart || @exit
    end

    def display_dataset_menu
        puts "#{@indent}-------------------------------------------"
        puts "#{@indent}DATASETS - HOW DO YOU WANT THE DATA SORTED?"        
        puts "#{@indent}-------------------------------------------"
        puts ""
        puts "#{@indent}1 | Sort by this week's rank               " 
        puts "#{@indent}2 | Sort by peak rank                      " 
        puts "#{@indent}3 | Sort by duration on charts             " 
        puts "#{@indent}4 | Return to the main menu                "     
        puts "#{@indent}5 | Exit                                   "  
        puts ""                                                     
        puts "#{@indent}-------------------------------------------"
    end

    def display_dataset_by_rank_this_week
        puts "#{@indent}-------------------------------------------"
        puts "#{@indent}ALL DATA BY RANK THIS WEEK                 "
        puts "#{@indent}-------------------------------------------"
        puts ""
        puts "#{@indent}RANK (CHANGE) - PEAK - DURATION - SONG - ARTIST"
        puts ""
        BillboardHot100::Song.sort_by_rank_this_week.each do |song|
            puts "#{@indent}RANK #{song.rank_this_week} (#{song.delta}) - PEAK #{song.peak_rank} - #{song.duration} WEEKS - #{song.name} - #{song.artist}"
        end
        puts""
    end

    def display_dataset_by_peak_rank
        puts "#{@indent}-------------------------------------------"
        puts "#{@indent}ALL DATA BY PEAK RANK                      "
        puts "#{@indent}-------------------------------------------"
        puts ""
        puts "#{@indent}PEAK - RANK (CHANGE) - DURATION - SONG - ARTIST"
        puts ""
        BillboardHot100::Song.sort_by_peak_rank.each do |song|
            puts "#{@indent}PEAK #{song.peak_rank} - RANK #{song.rank_this_week} (#{song.delta}) - #{song.duration} WEEKS - #{song.name} - #{song.artist}"
        end
        puts ""
    end

    def display_dataset_by_duration
        puts "#{@indent}-------------------------------------------"
        puts "#{@indent}ALL DATA BY DURATION                       "
        puts "#{@indent}-------------------------------------------"
        puts ""
        puts "#{@indent}DURATION - RANK (CHANGE) - PEAK - SONG - ARTIST"
        puts ""
        BillboardHot100::Song.sort_by_duration.each do |song|
            puts "#{@indent}#{song.duration} WEEKS - RANK #{song.rank_this_week} (#{song.delta}) - PEAK #{song.peak_rank} - #{song.name} - #{song.artist}"
        end
        puts ""
    end

    # RETURN MENUS

    def restart_or_exit_menu 
        display_restart_or_exit_menu
        @input = gets.strip
        menu_options = ["1", "2"]
        check_input(menu_options)

        @restart = true if @input == "1"
    end

    def display_restart_or_exit_menu
        puts "#{@indent}-------------------------------------------"
        puts "#{@indent}                                           "
        puts "#{@indent}WHAT WOULD YOU LIKE TO DO NOW?             "
        puts "#{@indent}                                           "
        puts "#{@indent}1 | Go back to the main menu               "
        puts "#{@indent}2 | Exit                                   "
        puts "#{@indent}                                           "
        puts "#{@indent}-------------------------------------------"
    end

    def return_menu_with_3_options 
        display_return_menu_with_3_options
        @input = gets.strip
        menu_options = ["1", "2", "3"]
        check_input(menu_options)
        
        go_to_analyses_menu if @input == "1"
        @input == "2" ? @restart = true : @exit = true
    end

    def display_return_menu_with_3_options
        puts "#{@indent}-------------------------------------------"
        puts "#{@indent}                                           "
        puts "#{@indent}WHAT WOULD YOU LIKE TO DO NOW?             "
        puts "#{@indent}                                           "
        puts "#{@indent}1 | Go back to the previous menu           "
        puts "#{@indent}2 | Go back to the main menu               "
        puts "#{@indent}3 | Exit                                   "
        puts "#{@indent}                                           "
        puts "#{@indent}-------------------------------------------"
    end

    # CHECK INPUTS

    def check_input(menu_options)
        while !menu_options.include?(@input)
            input_error_message(menu_options)
            @input = gets.strip
        end
    end

    # ERROR MESSAGES

    def input_error_message(menu_options)
        if menu_options.size == 2
            puts "Please enter [1] or [2]."
        else
            puts "Please enter a number 1 - #{menu_options.last}. Enter [#{menu_options.last}] to exit."    
        end
    end

    # def check_input_2_options # [1] = Restart, [2] = Exit
    #     while @input != "1" && @input != "2"
    #         puts "Please enter [1] or [2]."      
    #         @input = gets.strip
    #     end
    # end
    
    # GOODBYE MESSAGE

    def say_goodbye
        puts "#{@indent}-------------------------------------------".red
        puts "#{@indent}       ♭ ♫ ♯ ♪ SEE YOU SOON! ♪ ♯ ♫ ♭       "
        puts "#{@indent}-------------------------------------------".red
        puts ""
    end

end