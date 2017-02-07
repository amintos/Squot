as yet unclassified
captureSquotSnapshotFrom: aMCVersionInfo basedOnVersion: aSquotVersion
	| mcVersion |
	self flag: 'TODO: use aSquotVersion once "incremental" updating is available'.
	^ SquotSnapshot builder
		add: (SquotArtifact new
			content: (mcVersion := monticelloRepository versionWithInfo: aMCVersionInfo) snapshot;
			path: mcVersion package name, '.package';
			in: [:artifact | artifact storeInfo at: #objectClassName put: #PackageInfo];
			yourself);
		buildSnapshot