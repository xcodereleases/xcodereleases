#  Xcode Releases

A Swift package for interacting with Xcode release data

## Basic Usage

`XcodeReleases` does not provide any functionality for retrieving Xcode release data; its purpose is to simplify the deserialization process. A simple example of how you might use this information in your own project is as follows:

```swift
let allReleases = try await URLSession.shared.data(from: XcodeReleases.allXcodesJSON)
                                .map(\.data)
                                .map { try JSONDecoder().decode(XcodeReleases.self, from: $0) }
```

The resulting `XcodeReleases` struct contains the list of `Xcode` values for your app to consume. An `Xcode` value contains information about its version number, release date, release kind (beta, release candidate, etc), and possibly information on its embedded SDKs and compilers. It may also have associated `Link` values with information on its direct download location, release notes, and so on.

## License

The Xcode Releases package is available under the MIT license:

> Copyright 2023, Xcode Releases
> 
> Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the “Software”), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
> 
> The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
> 
> THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.