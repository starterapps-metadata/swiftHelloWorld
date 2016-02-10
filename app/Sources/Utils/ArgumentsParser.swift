/**
* ArgumentsParser.swift
*
* Copyright © 2016 IBM. All rights reserved.
*/

public func parseAddress() -> Address {
  let args = Array(Process.arguments[1..<Process.arguments.count])
  var port = 8000 // default port
  var ip = "0.0.0.0" // default ip
  if args.count == 2 && args[0] == "-bind" {
    let tokens = args[1].bridge().componentsSeparatedByString(":")
    if (tokens.count == 2) {
      ip = tokens[0]
      if let portNumber = Int(tokens[1]) {
        port = portNumber
      }
    }
  }
  let address = Address(ip: ip, port: UInt16(port))
  return address
}
