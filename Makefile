.PHONY: run setup

# Include the .env file if it exists
-include .env

all: run

setup:
	@# Check if DAY is provided
	@[ -n "$(DAY)" ] || (echo "Error: DAY is not set. Usage: make setup DAY=1 YEAR=2015"; exit 1)
	@# Check if YEAR is provided
	@[ -n "$(YEAR)" ] || (echo "Error: YEAR is not set. Usage: make setup DAY=1 YEAR=2015"; exit 1)
	@# Check if .env file exists
	@[ -f .env ] || (echo "Error: .env file not found. Please create it with SESSION_COOKIE=your_cookie_value"; exit 1)
	@# Check if SESSION is set in .env
	@[ -n "$(SESSION)" ] || (echo "Error: SESSION_COOKIE not found in .env file. Please add SESSION_COOKIE=your_cookie_value"; exit 1)
	@mkdir -p assets/$(YEAR)
	@echo "Downloading Advent of Code $(YEAR) Day $(DAY) input..."
	@curl -s --cookie "session=$(SESSION)" https://adventofcode.com/$(YEAR)/day/$(DAY)/input > assets/$(YEAR)/day$(DAY).txt
	@echo "Input file saved to assets/$(YEAR)/day$(DAY).txt"

run:
	lua main.lua
