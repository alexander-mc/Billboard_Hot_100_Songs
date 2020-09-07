require 'nokogiri'
require 'pry'

module BillboardHot100
end

class BillboardHot100::Scraper2

    def self.scrape_main_page
        html = File.read('test.html')      
        page_data = Nokogiri::HTML(html)
        
        page_data.css("li.chart-list__element").map do |element|
            song = {}
            song[:name] = element.css("span.chart-element__information__song").text
            song[:artist] = element.css("span.chart-element__information__artist").text
            song[:rank_this_week] = element.css("span.chart-element__rank__number").text
            song[:delta] = element.css("span.chart-element__information__delta__text.text--default").text
            song[:rank_last_week] = element.css("span.chart-element__information__delta__text.text--last").text.gsub(" Last Week","")
            song[:peak_rank] = element.css("span.chart-element__information__delta__text.text--peak").text.gsub(" Peak Rank","")
            song[:duration] = element.css("span.chart-element__information__delta__text.text--week").text.gsub(" Weeks on Chart","")
            song
            binding.pry
        end
    end
end

BillboardHot100::Scraper2.scrape_main_page