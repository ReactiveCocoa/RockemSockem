//
//  RSMWebSocket.m
//  RockemSockem
//
//  Created by Josh Abernathy on 4/19/13.
//  Copyright (c) 2013 Josh Abernathy. All rights reserved.
//

#import "RSMWebSocket.h"
#import "GCDAsyncSocket.h"

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

#pragma mark NSObject

- (NSString *)description {
	return [NSString stringWithFormat:@"<%@: %p> host: %@", self.class, self, asyncSocket.connectedHost];
}

#pragma mark WebSocket

- (void)didOpen {
	self.opened(self);

	[super didOpen];
}

- (void)didReceiveMessage:(NSString *)message {
	[_messages sendNext:message];

	[super didReceiveMessage:message];
}

- (void)didClose {
	[_messages sendCompleted];

	[super didClose];
}

#pragma mark Properties

- (HTTPMessage *)requestMessage {
	return request;
}

@end
