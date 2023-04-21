/// A special kind of playlist.
public struct PlaylistDistinguishedKind: RawRepresentable, Codable, Hashable {
    public var rawValue: String

    /// A playlist containing all music.
    public static let music = Self(rawValue: "Music")
    /// A playlist containing all music videos.
    public static let musicVideos = Self(rawValue: "Music Videos")
    /// A playlist containing all library music videos.
    public static let libraryMusicVideos = Self(rawValue: "Library Music Videos")
    /// A playlist containing all movies.
    public static let movies = Self(rawValue: "Movies")
    /// A playlist containing all home videos.
    public static let homeVideos = Self(rawValue: "Home Videos")
    /// A playlist containing all TV shows.
    public static let tvShows = Self(rawValue: "TV Shows")
    /// A playlist containing all audiobooks.
    public static let audiobooks = Self(rawValue: "Audiobooks")
    /// A playlist containing all ringtones.
    public static let ringtones = Self(rawValue: "Ringtones")
    /// A playlist containing all podcasts.
    public static let podcasts = Self(rawValue: "Podcasts")
    /// A playlist containing all voice memos.
    public static let voiceMemos = Self(rawValue: "Voice Memos")
    /// A playlist containing all iOS apps.
    public static let applications = Self(rawValue: "Applications")
    /// A playlist containing all purchases.
    public static let purchases = Self(rawValue: "Purchases")
    /// A playlist containing all iTunes U items.
    public static let iTunesU = Self(rawValue: "iTunes U")
    /// A playlist containing the user's loved music.
    public static let lovedSongs = Self(rawValue: "Loved Songs")
    /// A smart playlist containing the user's music from the 1990s.
    public static let my90sMusic = Self(rawValue: "90s Music")
    /// A smart playlist containing the user's top-rated items.
    public static let myTopRated = Self(rawValue: "My Top Rated")
    /// A smart playlist containing the user's top 25 items.
    public static let top25MostPlayed = Self(rawValue: "Top 25 Most Played")
    /// A smart playlist containing the user's most recently played items.
    public static let recentlyPlayed = Self(rawValue: "Recently Played")
    /// A smart playlist containing the user's most recently added items.
    public static let recentlyAdded = Self(rawValue: "Recently Added")
    /// A smart playlist containing the user's classical music.
    public static let classicalMusic = Self(rawValue: "Classical Music")
    /// A smart playlist containing the user's music shows and movies.
    public static let musicShowsAndMovies = Self(rawValue: "Music Shows and Movies")

    public init(rawValue: String) {
        self.rawValue = rawValue
    }
}

