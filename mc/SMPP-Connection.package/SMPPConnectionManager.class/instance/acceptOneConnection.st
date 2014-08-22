as yet unclassified
acceptOneConnection
	| client |
	client := socket waitForAcceptFor: 60.
	client ifNil: [^self].
	
	OsmoDispatcher dispatchBlock:  [
		| conn socketStream |
		socketStream := (SocketStream on: client)
				binary;
	    			noTimeout;
				yourself.
		conn := SMPPClientConnection new
				socket: socketStream;
				systemType: systemType;
				systemId: systemId;
				password: password;
				onUnhandledCommandOrResponse: on_unhandled;
				onUnhandledResponse: on_unhandled_response;
				yourself.
		conn onConnectionClosed: [self removeConnection: conn].
		self addClientConnection: conn.
		conn start.
	].