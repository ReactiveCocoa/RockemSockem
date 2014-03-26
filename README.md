# RockemSockem

RockemSockem isn't just an awesome name. It's a super-simple, ReactiveCocoa-based WebSocket server for OS X.

It uses [CocoaHTTPServer](https://github.com/robbiehanson/CocoaHTTPServer) to do all the hard stuff. Because the hard stuff is hard. Basically all the credit goes to them.

# How do I use it?

1. Add RockemSocket.xcodeproj to your project or workspace.
1. Add RockemSockem to your Target Dependencies.
1. Add RockemSockem.framework to your Link Binary with Libraries.
1. Add RockemSockem.framework to a Copy Files phase which copies it into Frameworks.
1. Weep that this list of instructions is so damn long.
1. Follow all those same steps, but for ReactiveCocoa (in [External](External/)).

```objc
server = [[RSMServer alloc] init];
server.port = 12345;
server.interface = @"localhost";
[server.webSockets subscribeNext:^(RSMWebSocket *socket) {
	[socket sendMessage:@"Sock it to me."];
	[socket.messages subscribeNext:^(NSString *message) {
		NSLog(@"Got \"%@\" from %@", message, socket);
	}];
}];

NSError *error;
BOOL success = [server start:&error];
if (!success) {
	NSLog(@"Error starting server: %@", error);
}
```

See [RockemSockemSample](RockemSockemSample/) for a slightly complete example.

If you’re developing RockemSockem on its own, then simply open `RockemSockem.xcworkspace`.

# What about iOS?

If you're running a WebSocker server on iOS I feel bad for you son. I got 99 problems and RockemSockem not running on iOS ain't one. (Pull requests welcome.)
