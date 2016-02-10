/**
* Address.swift
*
* Copyright © 2016 IBM. All rights reserved.
*/

public struct Address {
  public let ip: String
  public let port: UInt16

  init(ip: String, port: UInt16) {
    self.ip = ip
    self.port = port
   }
}
