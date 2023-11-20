PROJECT_DIR = $(shell pwd)
GEN_DIR = $(PROJECT_DIR)/gen
GOGEN_DIR = $(GEN_DIR)/go


$(shell [ -f $(GOGEN_DIR) ] || mkdir -p $(GOGEN_DIR))

.PHONY:proto-go
proto-go:
	protoc -I $(PROJECT_DIR)/proto $(PROJECT_DIR)/proto/sso/*.proto --go_out=$(GOGEN_DIR) --go_opt=paths=source_relative --go-grpc_out=$(GOGEN_DIR) --go-grpc_opt=paths=source_relative

.DEFAULT_GOAL := proto-go