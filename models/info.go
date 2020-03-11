package models

type (
	// InfoResponse response for info route
	InfoResponse struct {
		Version   string `json:"version"`
		Tags      string `json:"tags"`
		GitCommit string `json:"git-commit"`
		BuildTime string `json:"build-time"`
	}
)

func NewInfoResponse(version, tags, gitCommit, buildTime string) *InfoResponse {
	return &InfoResponse{
		Version:   version,
		Tags:      tags,
		GitCommit: gitCommit,
		BuildTime: buildTime,
	}
}
