extension Collection {
    func reduce1(_ accumulator: (Element, Element) throws -> Element) rethrows -> Element? {
        try first.map { try dropFirst().reduce($0, accumulator) }
    }
}
