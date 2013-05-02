//
//  RSMServer.h
//  RockemSockem
//
//  Created by Josh Abernathy on 4/19/13.
//  Copyright (c) 2013 Josh Abernathy. All rights reserved.
//

#import "HTTPServer.h"

// A WebSocket server.
@interface RSMServer : HTTPServer

// A signal of WSSWebSockets. A new WSSWebSocket will be sent when it has
// connected and the socket has been opened. At this point, the socket send and
// receive messages.
@property (nonatomic, readonly, strong) RACSignal *webSockets;

// The origins from which the server will accept connections. By default, this
// is nil which means all origins will be accepted. This can be used as a
// security measure to restrict connections to specific server.
@property (nonatomic, copy) NSArray *acceptedOrigins;

// Configure the server to use SSL.
//
// identity       - The identity to use. Cannot be NULL.
// certifications - The SecIdentityRefs to use. May be nil.
//
// Returns nothing.
- (void)configureForSSLWithIdentity:(SecIdentityRef)identity certificates:(NSArray *)certificates;

@end
