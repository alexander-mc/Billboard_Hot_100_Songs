require_relative "../billboard_hot_100.rb"

class BillboardHot100::Scraper

    BASE_PATH = "https://www.billboard.com/charts/hot-100"

    def self.scrape_main_page      
        page_data = Nokogiri::HTML(open(BASE_PATH))       

        page_data.css("li.chart-list__element").map do |element|
            song = {}
            song[:name] = element.css("span.chart-element__information__song").text
            song[:artist] = element.css("span.chart-element__information__artist").text
            song[:rank] = element.css("span.chart-element__rank__number").text
            song[:delta] = element.css("span.chart-element__information__delta__text.text--default").text
            song[:delta_last_week] = element.css("span.chart-element__information__delta__text.text--last").text
            song[:peak] = element.css("span.chart-element__information__delta__text.text--peak").text
            song[:duration] = element.css("span.chart-element__information__delta__text.text--week").text
            song
        end
    end
end

BillboardHot100::Scraper.scrape_main_page