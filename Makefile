# Hireva planning repository. No application code lives here: the code
# repositories (HirevaClient, HirevaApi, HirevaSpeech, HirevaInfra) are
# separate (docs/architecture/repo-plan.json). `make check` runs the planning
# gates that were run by hand: backlog coverage, the HLD and architecture set,
# and the drawn diagrams. `make help` lists every target.
SHELL := /bin/bash
.DEFAULT_GOAL := help
BEARING ?= $(HOME)/.claude/plugins/cache/bearing/bearing/0.6.0
STATE := .bearing/state
HLD := docs/design/hireva-hld.md
ADR_DIR := docs/adr

.PHONY: help setup check reset-marker need-bearing coverage arch diagrams

help: ## List targets
	@grep -E '^[a-zA-Z_-]+:.*?## ' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "  %-12s %s\n", $$1, $$2}'

setup: ## Point git at the committed hooks (run once per clone; without it no hook runs)
	@bash .githooks/install.sh

# The gate. It writes .bearing/state/.check-passed on success, which Bearing's
# Stop gate reads; .bearing/state/ is git-ignored.
check: reset-marker coverage arch diagrams ## The gate: backlog coverage, HLD and architecture set, diagrams
	@mkdir -p $(STATE) && touch $(STATE)/.check-passed
	@echo "check: 3 gates passed"

reset-marker:
	@rm -f $(STATE)/.check-passed

need-bearing:
	@[ -d "$(BEARING)/skills" ] || { echo "need-bearing: Bearing plugin not found at $(BEARING); install it or set BEARING=<path>" >&2; exit 1; }

coverage: need-bearing ## Every live REQ is covered by a story, and the register agrees
	@python3 "$(BEARING)/skills/backlog/scripts/coverage_check.py"

arch: need-bearing ## The HLD, tenets, decisions index and repo plan agree
	@python3 "$(BEARING)/skills/high-level-design/scripts/arch_check.py" $(HLD) --adr-dir $(ADR_DIR)

diagrams: need-bearing ## Every node and link of the drawn diagrams is present and legible
	@python3 "$(BEARING)/skills/architecture-diagram/scripts/diagram_check.py"
