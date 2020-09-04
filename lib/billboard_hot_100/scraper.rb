class BillboardHot100::Scraper

    BASE_PATH = "https://www.billboard.com/charts/hot-100"

    def self.scrape_main_page      
        page_data = Nokogiri::HTML(open(BASE_PATH))       

        binding.pry
        #page_data.css("").map do |item|
        #
        #end




    end

end