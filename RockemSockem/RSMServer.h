//
//  RSMServer.h
//  RockemSockem
//
//  Created by Josh Abernathy on 4/19/13.
//  Copyright (c) 2013 Josh Abernathy. All rights reserved.
//

#import "HTTPServer.h"

@class HTTPMessage;
@class RSMResponse;

// The type of the block called for each HTTP request.
//
// request - The HTTP request.
// path    - The path requested. Will have a leading /.
//
// Returns the response to send. It may return nil which will send a 404.
typedef RSMResponse * (^RSMServerHTTPResponseBlock)(HTTPMessage *request, NSString *path);

// A WebSocket + HTTP server.
@interface RSMServer : HTTPServer

// A signal of WSSWebSockets. A new WSSWebSocket will be sent when it has
// connected and the socket has been opened. At this point, the socket can send
// and receive messages.
@property (nonatomic, readonly, strong) RACSignal *webSockets;

// The origins from which the server will accept connections. By default, this
// is nil which means all origins will be accepted. This can be used as a
// security measure to restrict connections to specific server.
@property (nonatomic, copy) NSArray *acceptedOrigins;

// The block which will be called whenever an HTTP request is made.
@property (nonatomic, copy) RSMServerHTTPResponseBlock responseBlock;

// Configure the server to use SSL.
//
// identity       - The identity to use. Cannot be NULL.
// certifications - The SecIdentityRefs to use. May be nil.
//
// Returns nothing.
- (void)configureForSSLWithIdentity:(SecIdentityRef)identity certificates:(NSArray *)certificates;

@end
