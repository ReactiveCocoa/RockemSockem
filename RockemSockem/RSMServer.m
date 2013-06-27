//
//  RSMServer.m
//  RockemSockem
//
//  Created by Josh Abernathy on 4/19/13.
//  Copyright (c) 2013 Josh Abernathy. All rights reserved.
//

#import "RSMServer.h"
#import "RSMServer+Private.h"
#import "RSMConnection.h"

@interface RSMServer ()

@end

@implementation RSMServer

@synthesize webSockets = _webSockets;

#pragma mark Lifecycle

- (void)dealloc {
	[_webSockets sendCompleted];

	if (_SSLIdentity != NULL) CFRelease(_SSLIdentity);
}

- (id)init {
	self = [super init];
	if (self == nil) return nil;

	_webSockets = [RACSubject subject];

	self.connectionClass = RSMConnection.class;

	return self;
}

#pragma mark SSL

- (void)configureForSSLWithIdentity:(SecIdentityRef)identity certificates:(NSArray *)certificates {
	NSParameterAssert(identity != NULL);

	self.SSLIdentity = (SecIdentityRef)CFRetain(identity);
	self.SSLCertificates = certificates;
	self.useSSL = YES;
}

@end
