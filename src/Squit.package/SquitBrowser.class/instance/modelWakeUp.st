actions
modelWakeUp
	offeredToAddFirstProject ifNil:
		[offeredToAddFirstProject := true.
		self offerToAddFirstProject.]