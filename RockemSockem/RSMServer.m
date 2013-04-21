//
//  RSMServer.m
//  RockemSockem
//
//  Created by Josh Abernathy on 4/19/13.
//  Copyright (c) 2013 Josh Abernathy. All rights reserved.
//

#import "RSMServer.h"
#import "RSMServer+Private.h"
#import "RSMSocketConnection.h"

@implementation RSMServer

@synthesize webSockets = _webSockets;

#pragma mark Lifecycle

- (void)dealloc {
	[_webSockets sendCompleted];
}

- (id)init {
	self = [super init];
	if (self == nil) return nil;

	_webSockets = [RACSubject subject];

	self.connectionClass = RSMSocketConnection.class;

	return self;
}

@end
