import Foundation

func loadJSONFixture(fixture: JSONFixture) -> NSData? {
    return loadJSONFixture(fixture.rawValue)
}

func loadJSONFixture(file: String) -> NSData? {
    return NSBundle(forClass: BundleSentinel.self).pathForResource(file, ofType: "json")
        .flatMap { NSData(contentsOfFile: $0) }
}

private class BundleSentinel { }
