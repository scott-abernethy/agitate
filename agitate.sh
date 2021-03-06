#!/bin/bash

if [ "$1" == "-q" ]; then
	AGITATE_QUIET_MODE=1
	shift
fi

SEARCH=$1
if [ -z $1 ]; then
	SEARCH=$HOME
fi

if [ -z $AGITATE_QUIET_MODE ]; then
	printf "Agitating all git repositories under %s ...\n" $SEARCH
fi

gsummary() {
	cd $(dirname $1)
	SHORTDIR=$(pwd | sed 's|.*/\(.*/.*\)|\1|')
	BRANCHINFO=$(git status -b --porcelain | sed -n 's/^##.*\[\(.*\)\]/[\1]/p' | head -n 1)
	CHANGED=$(git status --porcelain | sed -n '/^ [ADM]/p' | wc -l | sed 's/ //g')
	if [ $CHANGED -eq 0 ]; then
		if [ "$BRANCHINFO" != "" ] || [ -z $AGITATE_QUIET_MODE ]; then
			printf "%-30s  \e[1;32m%-12s\e[0m \e[1;36m%s\e[0m\n" $SHORTDIR "clean" "$BRANCHINFO"
		fi
	else
		if [ $CHANGED -eq 1 ]; then
			CHANGED_DESC="change"
		else
			CHANGED_DESC="changes"
		fi
		printf "%-30s  \e[1;31m%-12s\e[0m \e[1;36m%s\e[0m\n" $SHORTDIR "$CHANGED $CHANGED_DESC" "$BRANCHINFO"
	fi
}

export -f gsummary
export AGITATE_QUIET_MODE

find $SEARCH -type d -name ".git" -exec bash -c 'gsummary "$@"' bash {} \; 2>/dev/null
