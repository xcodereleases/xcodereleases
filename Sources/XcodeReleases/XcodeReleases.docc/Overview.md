#  Xcode Releases

A Swift package for interacting with Xcode release data

## Basic Usage

`XcodeReleases` does not provide any functionality for retrieving Xcode release data; its purpose is to simplify the deserialization process. A simple example of how you might use this information in your own project is as follows:

```swift
let allReleases = try await URLSession.shared.data(from: XcodeReleases.allXcodesJSON)
                                .map(\.data)
                                .map { try JSONDecoder().decode(XcodeReleases.self, from: $0) }
```

The resulting ``XcodeReleases`` struct contains the list of ``Xcode`` values for your app to consume. An ``Xcode`` value contains information about its version number, release date, release kind (beta, release candidate, etc), and possibly information on its embedded SDKs and compilers. It may also have associated ``Link`` values with information on its direct download location, release notes, and so on.
