#!/bin/sh

# Install DHCS Engineering Tools

echo "Installing Homebrew package manager"
echo "Also installs Xcode Command Line Tools" 

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

## declare an array variable
declare -a arr=("brew install htop ctop sf-pwgen curl wget tree vim tmux kubectl helm openlens" 
                "brew install visual-studio-code" 
                "brew install drawio" 
                "brew install postman" 
                "brew install iterm2") # requires accessibility features, Security & Privacy


exit_on_error() {
    exit_code=$1
    last_command=${@:2}
    if [ $exit_code -gt 0 ] && [ $exit_code -lt 127 ]; then
        >&2 echo "\"${last_command}\" command failed with exit code ${exit_code}."
        read -p "Press enter to continue"
        exit $exit_code
    fi
}

## now loop through the above array
for i in "${arr[@]}"
do
   echo "Installing : " $i
   `$i`
   exit_on_error $? !!
   # or do whatever with individual element of the array
done

