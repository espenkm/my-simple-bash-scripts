#!/bin/sh

# Copied from https://gist.github.com/chrisdarroch/7018927 
# check for where the latest version of IDEA is installed
IDEA=`ls -1d /Applications/IntelliJ\ * | tail -n1`
wd=`pwd`

# were we given a directory?
if [ -d "$1" ]; then
#  echo "checking for things in the working dir given"
  wd=`ls -1d "$1" | head -n1`
fi

# were we given a file?
if [ -f "$1" ]; then
#  echo "opening '$1'"
  open -a "$IDEA" "$1"
else
    # let's check for stuff in our working directory.
    pushd $wd > /dev/null

    # does our working dir have an .idea directory?
    if [ -d ".idea" ]; then
#      echo "opening via the .idea dir"
      open -a "$IDEA" .

    # is there an IDEA project file?
    elif [ -f *.ipr ]; then
#      echo "opening via the project file"
      open -a "$IDEA" `ls -1d *.ipr | head -n1`

    # Is there a pom.xml?
    elif [ -f pom.xml ]; then
      open -a "$IDEA" "pom.xml"

    elif [ -f build.gradle ]; then
      open -a "$IDEA" "build.gradle"

    # can't do anything smart; just open IDEA
    else
        DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
        cp $DIR/idea.gradle .idea.gradle
        gradle idea -q -b .idea.gradle
        rm .idea.gradle
        open -a "$IDEA" .

	#Clean up, remove generated files
	rm -rf .gradle
	if [ -f .gitignore ]; then
		echo "*.ipr" >> .gitignore
		echo "*.iws" >> .gitignore
	fi
    fi

    popd > /dev/null
fi

