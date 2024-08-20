#!/bin/bash
cp cb /usr/bin/cb
chmod 755 /usr/bin/cb  

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

add_to_file() {
  local file=$1
  local content=$2
  echo "$content" >> "$file"
  echo "Function added to $file"
}

if [ -f ~/.zshrc ]; then
  add_to_file ~/.zshrc "$CD_FUNCTION"
fi

if [ -f ~/.bashrc ]; then
  add_to_file ~/.bashrc "$CD_FUNCTION"
fi

