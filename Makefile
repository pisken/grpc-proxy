.PHONY: test test-ci install-staticcheck

test:
	go vet ./...
	go test -race -v  -timeout 5m ./...
	CGO_ENABLED=0 GOOS=linux staticcheck -f stylish --go 1.21 ./...

install-staticcheck:
	go install honnef.co/go/tools/cmd/staticcheck@v0.4.6

test-ci: install-staticcheck | test
