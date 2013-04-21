//
//  RSDAppDelegate.m
//  RockemSockemSample
//
//  Created by Josh Abernathy on 4/20/13.
//  Copyright (c) 2013 Josh Abernathy. All rights reserved.
//

#import "RSDAppDelegate.h"

@interface RSDAppDelegate ()

@property (nonatomic, readonly, strong) RSMServer *server;

@end

@implementation RSDAppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)notification {
	_server = [[RSMServer alloc] init];
	self.server.port = 12345;
	self.server.interface = @"localhost";
	[self.server.webSockets subscribeNext:^(RSMWebSocket *socket) {
		[socket sendMessage:@"Sock it to me."];
		[socket.messages subscribeNext:^(NSString *message) {
			NSLog(@"Got \"%@\" from %@", message, socket);
		}];
	}];

	NSError *error;
	BOOL success = [self.server start:&error];
	if (!success) {
		NSLog(@"Error starting server: %@", error);
	}
}

@end
