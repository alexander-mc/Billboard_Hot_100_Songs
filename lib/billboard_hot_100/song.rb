#require_relative "../billboard_hot_100.rb"

class BillboardHot100::Song
 
    attr_accessor :name, :artist
    attr_reader :rank, :delta, :delta_last_week, :duration

    @@Songs = []

    def initialize(song_hash)
        song_hash.each {|key, value| self.send("#{key}=", value)}
        @@Songs << self
    end

    def self.create_from_array(songs_array)
        songs_array.each {|song_hash| self.new(song_hash)}
    end

end