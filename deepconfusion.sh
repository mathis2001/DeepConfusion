#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
RESET='\033[0m'

if [ $# -eq 0 ]; then
    echo -e "${RED}[!]${RESET} Usage: $0 <package.json>"
    exit 1
fi

if [ ! -f "$1" ]; then
    echo -e "${RED}[!]${RESET} Error: File '$1' not found."
    exit 1
fi

package_names=($(grep -oE '"[^"]+":' $1 | sed 's/"//g' | sed 's/:$//'))

for package_name in "${package_names[@]}"; do
    echo -e "Searching public npm package for ${GREEN}$package_name${RESET}..."
    npm_search_response=$(npm search "$package_name" --json)
    matching_package=$(echo "$npm_search_response" | jq -r '.[] | select(.name == "'"$package_name"'")')
    
    if [ -z "$matching_package" ]; then
        echo -e "${RED}[!]${RESET} $package_name ${RED}NOT${RESET} in public registry !"
        echo -e "${BLUE}[*]${RESET} Checking if package has been deprecated"
	if curl -s https://www.npmjs.com/package/$package_name | grep -q 'has been deprecated'; then
	    echo -e "${YELLOW}[-]${RESET} Here but ${YELLOW}deprecated${RESET}"
	else
	    echo $package_name >> confusion.txt
	fi
    else
        echo -e "${GREEN}[+]${RESET} $package_name in public registry."
    fi
    
    echo "---------------------------------------------------"
done
