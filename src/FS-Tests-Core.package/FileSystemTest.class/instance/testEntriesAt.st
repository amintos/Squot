tests
testEntriesAt
	| directory entries |
	directory := FSPath * 'plonk'.
	filesystem createDirectory: directory.
	filesystem createDirectory: directory / 'griffle'.
	filesystem createDirectory: directory / 'bint'.
	self delete: directory / 'griffle'.
	self delete: directory / 'bint'.
	self delete: directory.
	entries := filesystem entriesAt: directory.
	self assert: entries size = 2.
	entries do: 
		[ :ea | 
		self assert: (ea isKindOf: FSDirectoryEntry).
		self assert: ea reference parent path = (filesystem resolve: directory).
		self assert: (#('griffle' 'bint' ) includes: ea reference basename).
		self assert: ea isDirectory ]