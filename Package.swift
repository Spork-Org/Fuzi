// swift-tools-version:5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let pkgName = "Fuzi"

// Define system-specific dependencies and targets conditionally.
#if os(Linux)
let deps: [Target.Dependency] = [.target(name: "CLibXML2")]
let cTargets: [Target] = [
    .systemLibrary(
        name: "CLibXML2",
        path: "Sources/CLibXML2",
        pkgConfig: "libxml-2.0",
        providers: [
            .brew(["libxml2"]), // This line can be removed if you are not supporting macOS.
            .apt(["libxml2-dev"])
        ]
    )
]
#else
let deps: [Target.Dependency] = []
let cTargets: [Target] = []
#endif

let package = Package(
    name: pkgName,
    products: [
        .library(
            name: pkgName,
            targets: [pkgName]
        ),
    ],
    targets: cTargets + [
        .target(
            name: pkgName,
            dependencies: deps,
            path: "Sources"
        ),
        .testTarget(
            name: "\(pkgName)Tests",
            dependencies: [.target(name: pkgName)]
        ),
    ]
)


///home/ubuntu/Fuzi/Fuzi/Sources/Document.swift:40:22: error: cannot find 'CFStringConvertIANACharSetNameToEncoding' in scope
//      let encoding = CFStringConvertIANACharSetNameToEncoding(encodingName as CFString?)
//                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
///home/ubuntu/Fuzi/Fuzi/Sources/Document.swift:41:22: error: cannot find 'kCFStringEncodingInvalidId' in scope
//      if encoding != kCFStringEncodingInvalidId {
//                     ^~~~~~~~~~~~~~~~~~~~~~~~~~
///home/ubuntu/Fuzi/Fuzi/Sources/Document.swift:42:47: error: cannot find 'CFStringConvertEncodingToNSStringEncoding' in scope
//        return String.Encoding(rawValue: UInt(CFStringConvertEncodingToNSStringEncoding(encoding)))
//                                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
///home/ubuntu/Fuzi/Fuzi/Sources/Document.swift:40:79: error: cannot find type 'CFString' in scope
//      let encoding = CFStringConvertIANACharSetNameToEncoding(encodingName as CFString?)
//                                                                              ^~~~~~~~




///home/ubuntu/Fuzi/Fuzi/Sources/Document.swift:215:12: error: cannot find 'htmlReadMemory' in scope
//    return htmlReadMemory(buffer.baseAddress, Int32(buffer.count), "", nil, options)
//           ^~~~~~~~~~~~~~
///home/ubuntu/Fuzi/Fuzi/Sources/Document.swift:215:72: error: 'nil' requires a contextual type
//    return htmlReadMemory(buffer.baseAddress, Int32(buffer.count), "", nil, options)
//                                                                       ^
///home/ubuntu/Fuzi/Fuzi/Sources/Node.swift:141:7: error: cannot find 'htmlNodeDump' in scope
//      htmlNodeDump(buffer, self.cNode.pointee.doc, self.cNode)
//      ^~~~~~~~~~~~
//error: fatalError
//
