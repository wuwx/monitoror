package version

// Default build-time variable.
// These values are overridden via ldflags on build
var (
	Version   = "unknown-version"
	Tags      = ""
	GitCommit = "unknown-gitcommit"
	BuildTime = "unknown-buildtime"
)
