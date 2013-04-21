//
//  RSMSocketConnection.m
//  RockemSockem
//
//  Created by Josh Abernathy on 4/19/13.
//  Copyright (c) 2013 Josh Abernathy. All rights reserved.
//

#import "RSMSocketConnection.h"
#import "RSMWebSocket+Private.h"
#import "RSMServer+Private.h"

@implementation RSMSocketConnection

#pragma mark HTTPConnection

- (WebSocket *)webSocketForURI:(NSString *)path {
	__weak id weakServer = config.server;
	RSMWebSocket *socket = [[RSMWebSocket alloc] initWithRequest:request socket:asyncSocket opened:^(RSMWebSocket *socket) {
		RSMServer *strongServer = weakServer;
		if (strongServer == nil) return;

		[strongServer->_webSockets sendNext:socket];
	}];
	
	return socket;
}

@end
