#if canImport(iTunesLibrary)

public typealias LocalAppleMediaImporter = LocalAppleMediaITImporter

#elseif os(iOS) || targetEnvironment(macCatalyst)

public typealias LocalAppleMediaImporter = LocalAppleMediaMPImporter

#endif
