actions
actionBranchMerge
	| mergeHistorian mergeHeadCommit |
	self hasProjectSelection ifFalse: [^ self].
	self hasBranchSelection ifFalse: [^ self].
	mergeHistorian := self branchSelection historian.
	mergeHeadCommit := mergeHistorian version.
	[self mergeVersionIntoActiveBranch: mergeHeadCommit]
		on: SquotInitialLogMessageRequested
		do: [:request | request resume: 'Merge branch ''', mergeHistorian shortName,
			''' into ', self projectSelection loadedHistorian shortName].