#!/bin/bash

# Move and set permissions for the binary
mv cb /usr/bin/cb
chmod 755 /usr/bin/cb  # More secure permission setting

# Define the function to be added
read -r -d '' CD_FUNCTION << 'EOF'
# Ensure no conflicting alias
unalias cd 2>/dev/null

# Define the function
cd() {
  # Log the current directory at the top of ~/.cd_log.txt
  {
    echo "$PWD"
    cat ~/.cd_log.txt
  } > ~/.temp_log.txt && mv ~/.temp_log.txt ~/.cd_log.txt
  
  # Execute the original cd command
  builtin cd "$@"
}
EOF

# Function to add the definition to a file
add_to_file() {
  local file=$1
  local content=$2
  
  if ! grep -Fxq "$content" "$file"; then
    echo "$content" >> "$file"
    echo "Function added to $file"
  else
    echo "Function already exists in $file"
  fi
}

# Add function to .zshrc if it exists
if [ -f ~/.zshrc ]; then
  add_to_file ~/.zshrc "$CD_FUNCTION"
fi

# Add function to .bashrc if it exists
if [ -f ~/.bashrc ]; then
  add_to_file ~/.bashrc "$CD_FUNCTION"
fi

