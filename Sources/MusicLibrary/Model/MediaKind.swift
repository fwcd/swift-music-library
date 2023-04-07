/// The kind of media.
public struct MediaKind: RawRepresentable, Codable, Hashable {
    public var rawValue: String

    /// The media item is a song.
    public static var song = Self(rawValue: "Song")
    /// The media item is a movie.
    public static var movie = Self(rawValue: "Movie")
    /// The media item is an audio or a video podcast.
    public static var podcast = Self(rawValue: "Podcast")
    /// The media item is an audiobook.
    public static var audiobook = Self(rawValue: "Audiobook")
    /// The media item is an unwrapped PDF file that’s part of a music album.
    public static var pdfBooklet = Self(rawValue: "PDF Booklet")
    /// The media item is a music video.
    public static var musicVideo = Self(rawValue: "Music Video")
    /// The media item is a TV show.
    public static var tvShow = Self(rawValue: "TV Show")
    /// The media item is a QuickTime movie with embedded Flash.
    public static var interactiveBooklet = Self(rawValue: "Interactive Booklet")
    /// The media item is a non-iTunes Store movie.
    public static var homeVideo = Self(rawValue: "Home Video")
    /// The media item is an iOS ringtone.
    public static var ringtone = Self(rawValue: "Ringtone")
    /// The media item is an iTunes Extra or an iTunes LP item.
    public static var digitalBooklet = Self(rawValue: "Digital Booklet")
    /// The media item is an iOS app.
    public static var iOSApplication = Self(rawValue: "iOS Application")
    /// The media item is a recorded voice memo.
    public static var voiceMemo = Self(rawValue: "Voice Memo")
    /// The media item is an iTunes U audio or video file.
    public static var iTunesU = Self(rawValue: "iTunes U")
    /// The media item is an EPUB file or an iBooks Author book.
    public static var book = Self(rawValue: "Book")
    /// The media item is a PDF file that iTunes treats as a book unless the user overrides it.
    public static var pdfBook = Self(rawValue: "PDF Book")
    /// The media item is an audio tone that’s not a protected ringtone on an iOS device.
    public static var alertTone = Self(rawValue: "Alert Tone")

    public init(rawValue: String) {
        self.rawValue = rawValue
    }
}
