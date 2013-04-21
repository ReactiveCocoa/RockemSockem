//
//  RSMWebSocket+Private.h
//  RockemSockem
//
//  Created by Josh Abernathy on 4/19/13.
//  Copyright (c) 2013 Josh Abernathy. All rights reserved.
//

#import "RSMWebSocket.h"

// Private category for use by RSMWebSocket.
@interface RSMWebSocket ()

// Initializes the receiver with the given request, socket, and opened block.
//
// This should never be called manually.
//
// message - The request which opened the socket.
// socket  - The underlying socket.
// opened  - A block to be called when the socket has been opened. Cannot be
//           NULL.
//
// Returns the initialized object.
- (id)initWithRequest:(HTTPMessage *)message socket:(GCDAsyncSocket *)socket opened:(void (^)(RSMWebSocket *socket))opened;

@end
