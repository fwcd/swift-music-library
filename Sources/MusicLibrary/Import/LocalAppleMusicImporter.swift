#if canImport(iTunesLibrary)

public typealias LocalAppleMusicImporter = LocalAppleMusicITImporter

#elseif os(iOS) || targetEnvironment(macCatalyst)

public typealias LocalAppleMusicImporter = LocalAppleMusicMPImporter

#endif
