SHELL:=/bin/bash
include .env

.PHONY: all diagram images

all: images

diagram:
	$(DIAGRAMS) user-notify.py

images:
	$(MERMAIDJS) -i docs/images/validation.mmd
	$(MERMAIDJS) -i docs/images/filter.mmd
	$(MERMAIDJS) -i docs/images/integration.mmd