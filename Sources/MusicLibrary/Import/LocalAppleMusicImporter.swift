#if canImport(iTunesLibrary)

public typealias LocalAppleMusicImporter = LocalAppleMusicITImporter

#elseif canImport(MediaPlayer)

public typealias LocalAppleMusicImporter = LocalAppleMusicMPImporter

#endif
