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

@end
