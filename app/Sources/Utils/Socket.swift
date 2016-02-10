/**
* Socket.swift
*
* Copyright © 2016 IBM. All rights reserved.
*/

#if os(Linux)
import Glibc
#else
import Darwin
#endif

/**
* Creates and a binds a socket to the specified port number and ip address.
* The socket is then returned.
*/
public func createSocket(address: Address) -> Int32
{
  var name = sockaddr_in()

  // Create the socket
  let sockfd = socket(PF_INET, 1, 0)
  if sockfd < 0 {
    perror ("socket")
    //exit(EXIT_FAILURE)
    exit(1) // swift compiler issue
  }

  // Make the address reusable for multiple runs
  var on: Int32 = 1
  setsockopt(sockfd, SOL_SOCKET, SO_REUSEADDR, &on, socklen_t(sizeof(Int32)))

  // Give the socket a name
  name.sin_family = sa_family_t(AF_INET)
  name.sin_port = UInt16(address.port).bigEndian
  var addr: UInt32 = 1
  inet_pton(AF_INET, address.ip, &addr)
  name.sin_addr.s_addr = addr
  // INADDR_ANY which equals 0
  // name.sin_addr.s_addr = in_addr_t(0)

  var bindAddr = sockaddr()
  memcpy(&bindAddr, &name, Int(sizeof(sockaddr_in)))
  let addrSize: socklen_t = socklen_t(sizeof(sockaddr_in))

  // Bind name to socket
  if bind(sockfd, &bindAddr, addrSize) < 0 {
    perror("bind")
    //exit(EXIT_FAILURE)
    exit(1) // swift compiler issue
  }
  return sockfd
}
