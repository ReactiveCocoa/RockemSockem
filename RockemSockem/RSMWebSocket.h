//
//  RSMWebSocket.h
//  RockemSockem
//
//  Created by Josh Abernathy on 4/19/13.
//  Copyright (c) 2013 Josh Abernathy. All rights reserved.
//

#import "WebSocket.h"
#import "HTTPMessage.h"

// A single WebSocket.
@interface RSMWebSocket : WebSocket

// The NSStrings sent to the socket.
@property (nonatomic, readonly, strong) RACSignal *messages;

// The request message which opened the web socket connection.
@property (nonatomic, readonly, strong) HTTPMessage *requestMessage;

@end
