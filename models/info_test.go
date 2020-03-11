package models

import (
	"testing"

	"github.com/stretchr/testify/assert"
)

func TestNewInfoResponse(t *testing.T) {
	info := NewInfoResponse("a", "b", "c", "d")
	assert.Equal(t, "a", info.Version)
	assert.Equal(t, "b", info.Tags)
	assert.Equal(t, "c", info.GitCommit)
	assert.Equal(t, "d", info.BuildTime)
}
