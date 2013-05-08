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

// The scheduler on which all messages (opened, message, closed) will be sent.
@property (nonatomic, readonly, strong) RACScheduler *scheduler;

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

	_scheduler = [RACScheduler schedulerWithPriority:RACSchedulerPriorityDefault name:@"com.ReactiveCocoa.RockemSockem.RSMWebSocket"];

	return self;
}

#pragma mark NSObject

- (NSString *)description {
	return [NSString stringWithFormat:@"<%@: %p> host: %@", self.class, self, asyncSocket.connectedHost];
}

#pragma mark WebSocket

- (void)didOpen {
	[self.scheduler schedule:^{
		self.opened(self);
	}];

	[super didOpen];
}

- (void)didReceiveMessage:(NSString *)message {
	[self.scheduler schedule:^{
		[_messages sendNext:message];
	}];

	[super didReceiveMessage:message];
}

- (void)didClose {
	[self.scheduler schedule:^{
		[_messages sendCompleted];
	}];

	[super didClose];
}

#pragma mark Properties

- (HTTPMessage *)requestMessage {
	return request;
}

@end
