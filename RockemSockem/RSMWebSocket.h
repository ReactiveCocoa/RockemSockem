//
//  RSMWebSocket.h
//  RockemSockem
//
//  Created by Josh Abernathy on 4/19/13.
//  Copyright (c) 2013 Josh Abernathy. All rights reserved.
//

#import "WebSocket.h"

// A single WebSocket.
@interface RSMWebSocket : WebSocket

// The NSStrings sent to the socket.
@property (nonatomic, readonly, strong) RACSignal *messages;

@end
