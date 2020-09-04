class BillboardHot100::CLI

    def run
        
        display_main_menu
        input = gets.strip

        create_songs
        # cases depending on user input     
        say_goodbye
    end

    def display_main_menu
        # adding puts on each line works better than a heredoc,
        # which doesn't allow you to color inidividual lines
        puts ""
        puts "            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~".light_cyan
        puts "               WELCOME TO THE BILLBOARD HOT 100 CLI!   "
        puts "            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~".light_cyan
        puts ""
        puts "            WHAT WOULD YOU LIKE TO DO?                 "
        puts "            Enter 1 - 5 to select an option below      "
        puts ""
        puts "            MAIN MENU                                  "
        puts "            1 | View this week's top 10 songs          "
        puts "            2 | View this week's top 100 songs         "
        puts "            3 | View some analyses                     "
        puts "            4 | View the datasets                      "
        puts "            5 | Exit                                   "
        puts ""
        puts "            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~".light_cyan
    end

    def create_songs
        #songs_array = BillboardHot100::Scraper.scrape_main_page
        #BillboardHot100::Song.create_from_collection(songs_array)
    end

    def say_goodbye
    end

end