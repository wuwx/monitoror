#!/usr/bin/env bash
# Do not use this script manually, Use makefile

go clean testdata ./...
rm -f cover.out
gotestsum -- -coverprofile=coverage.txt -covermode=atomic $(go list ./... | grep -v mocks)
go tool cover -func coverage.txt | grep -v "100.0%"
