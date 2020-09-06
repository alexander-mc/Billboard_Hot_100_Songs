require 'open-uri'

def extract_html

    url = "https://www.billboard.com/charts/hot-100"
    file = "billboard_hot_100.html"

    open(file, "wb") do |file|
        open(url) do |uri|
        file.write(uri.read)
        end
    end
end

extract_html