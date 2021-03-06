tests
testReadStreamDoifAbsent
	| ref path s |
	path := FSPath * 'plonk'.
	filesystem store createFile: path.
	ref := filesystem referenceTo: path.
	ref
		readStreamDo: [ :stream | 
			self assert: stream class = FSReadStream.
			self assert: stream isOpen.
			s := stream ]
		ifAbsent: [ self signalFailure: 'The file exists!' ].
	self deny: s isOpen