tests
testNearestMergeBaseOneStep
	| commit1 commit2 commitBase |
	commitBase := self newCommit: 'base' parents: Array empty.
	commit1 := self newCommit: '1' parents: {commitBase}.
	commit2 := self newCommit: '2' parents: {commitBase}.
	self assert: commitBase == (commit1 nearestMergeBaseWithAnyOf: {commit2 hexHash}).
	self assert: commitBase == (commit2 nearestMergeBaseWithAnyOf: {commit1 hexHash}).