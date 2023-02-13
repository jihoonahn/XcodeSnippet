<p align="center">
    <img src="https://user-images.githubusercontent.com/68891494/206922287-5c034eb8-8cd0-4c03-9c95-233aeae4b40f.svg" width="500" max-width="90%" alt="XcodeSnippet" />
</p>

<p align="center">
    <img src="https://img.shields.io/badge/Swift-5.5-orange.svg" />
    <a href="https://swift.org/package-manager">
        <img src="https://img.shields.io/badge/swiftpm-compatible-brightgreen.svg?style=flat" alt="Swift Package Manager" />
    </a>
</p>

**XcodeSnippet** provides the ability to save or use the codeSnippet that you set up.

## Snippet as Swift packages
The usage of XcodeSnippet is very similar to that of Snippet in traditional Xcode.
Projects are defined as Swift Packages, all of which use the default format type-safe swift code.

```swift
import XcodeSnippet

struct SnippetEx: Snippet {
    var xcodeSnippet: [XcodeSnippet] = []
}

try snippetEx().install()
```
You can use it like this. XcodeSnipet is really simple, right?

## Installation
XcodeSnippet was deployed as Swift Package Manager. Package to install in a project. Add as a dependent item within the swift manifest.
```swift
let package = Package(
    ...
    dependencies: [
        .package(url: "https://github.com/JiHoonAHN/XcodeSnippet.git", from: "0.1.1")
    ],
    ...
)
```
Then import the XcodeSnipet from the location you want to use.
```swift
import XcodeSnippet
```

XcodeSnippet also comes with command-line tools to easily create projects for easy project support.
```
$ git clone https://github.com/JiHoonAHN/XcodeSnippet.git
$ cd XcodeSnippet
$ make
```

Then run the instructions on how to use `XcodeSnippet help`.

## Quick start
To start XcodeSnippet faster, clone this repository, install the command-line tool, and run `make` within the replicated folder.

```
$ git clone https://github.com/JiHoonAHN/XcodeSnippet.git
$ cd XcodeSnippet
$ make
```

_**Note**: If you encounter an error while running `make`, ensure that you have your Command Line Tools location set from Xcode's preferences. It's in Preferences > Locations > Locations > Command Line Tools. The dropdown will be blank if it hasn't been set yet._

Then, create a new folder for your new Snippet project and simply run `xcodeSnippet new` within it to get started:

```
$ mkdir MySnippet
$ cd MySnippet
$ xcodeSnippet new
```
Finally, run `open Package.swift` to open up the project in Xcode to start making your snippet Setting!

## License
**XcodeSnippet** is under MIT license. See the [LICENSE](LICENSE) file for more info.
