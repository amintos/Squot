public-accessing-references
allReferencesPrefixedWith: prefixString do: aBlock
	"Invoke aBlock with all references (as strings) starting with prefixString in this repository."
	| visited |
	visited := Set new.
	self allLooseReferencesPrefixedWith: prefixString do: [:each | aBlock value: each.
		visited add: each].
	self packedRefs ifNotNil: [:packedRefs |
		(packedRefs keys difference: visited)
			select: [:each | each beginsWith: prefixString]
			thenDo: aBlock].