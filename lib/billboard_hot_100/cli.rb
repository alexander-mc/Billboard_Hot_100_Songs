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
        @input = gets.strip
        @main_menu_options = ["1", "2", "3", "4", "5"]
        check_main_menu_input

        case @input
            when "1"
                display_top_10_songs
            when "2"
                display_top_100_songs
            when "3"
                display_analyses_menu
            when "4"
                display_datasets_menu
        end

        restart_menu unless @input == "5" # User enters [5] to exit.
        say_goodbye
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

    def check_main_menu_input
        if !@main_menu_options.include?(@input)
            puts "Please enter a number 1 - 5. Enter [5] to exit."
            @input = gets.strip
            check_main_menu_input
        end
    end

    def display_top_10_songs
        puts "#{@indent}-------------------------------------------"
        puts "#{@indent}THIS WEEK'S TOP 10 SONGS                   "
        puts "#{@indent}-------------------------------------------"
        puts ""
        puts "#{@indent}RANK (CHANGE) - SONG - ARTIST              "  
        puts BillboardHot100::Song.list_top_10_by_rank_this_week
    end

    def display_top_100_songs
        puts BillboardHot100::Song.list_top_100_by_rank_this_week
    end

    def restart_menu 
        display_restart_menu
        @input = gets.strip

        while @input != "1" && @input != "2" # [1] = Restart program, [2] = Exit
            puts "Please enter [1] or [2]."
            @input = gets.strip
        end

        start if @input == "1"
    end

    def display_restart_menu
    end

    <<-DOC
    
    -------------------------------------------
    
    WHAT WOULD YOU LIKE TO DO NOW?
    
    1 | Go back to the main menu.
    2 | Exit.
    
    -------------------------------------------
    DOC

    def display_analyses_menu
    end

    def display_datasets_menu
        display_dataset_by_rank_this_week
    end

    def display_dataset_by_rank_this_week
        puts BillboardHot100::Song.list_dataset_by_rank_this_week
    end

    def display_dataset_by_peak_rank
    end

    def display_dataset_by_duration
    end

    def say_goodbye
    end

    # def start
    #     display_main_menu
    #     run_main_menu
    #     say_goodbye
    # end

end