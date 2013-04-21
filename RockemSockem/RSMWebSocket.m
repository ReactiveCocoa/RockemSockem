//
//  RSMWebSocket.m
//  RockemSockem
//
//  Created by Josh Abernathy on 4/19/13.
//  Copyright (c) 2013 Josh Abernathy. All rights reserved.
//

#import "RSMWebSocket.h"

@interface RSMWebSocket () {
	RACSubject *_messages;
}

@property (nonatomic, readonly, copy) void (^opened)(RSMWebSocket *);

@end

@implementation RSMWebSocket

@synthesize messages = _messages;

#pragma mark Lifecycle

- (void)dealloc {
	[_messages sendCompleted];
}

- (id)initWithRequest:(HTTPMessage *)message socket:(GCDAsyncSocket *)socket opened:(void (^)(RSMWebSocket *socket))opened {
	NSParameterAssert(opened != NULL);

	self = [super initWithRequest:message socket:socket];
	if (self == nil) return nil;

	_messages = [RACSubject subject];
	_opened = [opened copy];

	return self;
}

#pragma mark WebSocket

- (void)didOpen {
	[super didOpen];

	self.opened(self);
}

- (void)didReceiveMessage:(NSString *)message {
	[_messages sendNext:message];
}

- (void)didClose {
	[super didClose];

	[_messages sendCompleted];
}

@end
