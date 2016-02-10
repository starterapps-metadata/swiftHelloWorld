/**
*  Package.swift
*
* Copyright © 2016 IBM. All rights reserved.
*/

import PackageDescription

let package = Package(
  name: "HelloWorldSwift",
  targets: [
    Target(name: "Utils", dependencies: []),
    Target(name: "Server", dependencies: [.Target(name: "Utils")])
  ],
  dependencies: []
)
