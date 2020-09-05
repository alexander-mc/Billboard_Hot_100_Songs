class BillboardHot100::Song
 
    attr_accessor :name, :artist, :rank_this_week, :rank_last_week, :delta, :peak_rank, :duration
    
    @@all = []

    def initialize(song_hash)
        song_hash.each {|key, value| self.send("#{key}=", value)}
        self.class.all << self
    end

    def self.create_from_array(song_array)
        song_array.each {|song_hash| self.new(song_hash)}
    end

    def self.all
        @@all
    end

    def self.list_by_rank_this_week
        sorted_songs = self.all.sort_by {|song| song.rank_this_week.to_i}
        sorted_songs.map {|song| "RANK #{song.rank_this_week} (#{song.delta}) - #{song.name} - #{song.artist}"}
    end

    def self.sort_by_peak_rank
        self.all.sort_by {|song| song.peak_rank.to_i}
    end

    def self.sort_by_duration
        self.all.sort_by {|song| song.duration.to_i}.reverse
    end

    # Methods below are not used in this program but may be helpful for future ones

    def self.find_by_rank_this_week(rank_this_week)
        self.all.find{|song| song.rank_this_week == rank_this_week}
    end

end