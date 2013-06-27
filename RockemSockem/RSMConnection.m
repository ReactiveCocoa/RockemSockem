//
//  RSMConnection.m
//  RockemSockem
//
//  Created by Josh Abernathy on 4/19/13.
//  Copyright (c) 2013 Josh Abernathy. All rights reserved.
//

#import "RSMConnection.h"
#import "RSMWebSocket+Private.h"
#import "RSMServer+Private.h"
#import "HTTPDataResponse.h"

@interface RSMConnection ()

@property (nonatomic, readonly, unsafe_unretained) RSMServer *server;

@end

@implementation RSMConnection

#pragma mark HTTPConnection

- (BOOL)isSecureServer {
	return self.server.useSSL;
}

- (NSArray *)sslIdentityAndCertificates {
	NSArray *identityArray = @[ (__bridge id)self.server.SSLIdentity ];
	if (self.server.SSLCertificates == nil) return identityArray;
	return [identityArray arrayByAddingObjectsFromArray:self.server.SSLCertificates];
}

- (WebSocket *)webSocketForURI:(NSString *)path {
	__weak id weakServer = self.server;
	RSMWebSocket *socket = [[RSMWebSocket alloc] initWithRequest:request socket:asyncSocket opened:^(RSMWebSocket *socket) {
		RSMServer *strongServer = weakServer;
		if (strongServer == nil) return;

		[strongServer->_webSockets sendNext:socket];
	}];

	return socket;
}

- (BOOL)shouldAcceptRequest:(HTTPMessage *)newRequest {
	NSArray *acceptableOrigins = self.server.acceptedOrigins;
	if (acceptableOrigins == nil) return YES;

	NSString *origin = newRequest.allHeaderFields[@"Origin"];
	return [acceptableOrigins containsObject:origin];
}

- (NSObject<HTTPResponse> *)httpResponseForMethod:(NSString *)method URI:(NSString *)path {
	if (self.server.responseBlock == nil) return nil;

	NSData *responseData = self.server.responseBlock(request, path);
	return [[HTTPDataResponse alloc] initWithData:responseData];
}

#pragma mark Server

- (RSMServer *)server {
	return (RSMServer *)config.server;
}

@end
