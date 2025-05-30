# -------------------------------- checksum / hashing -------------------------------- #

# Aliases
alias sha256="sha256sum"

# Function to compute and hash a sorted list of file hashes
sha256d() {
  local directory="$1"

  if [ -z "$directory" ]; then
    echo "Usage: compute_and_hash_directory <directory> <hash_file>"
    return 1
  fi

  # Check if the directory exists
  if [ ! -d "$directory" ]; then
    echo "Error: Directory '$directory' does not exist."
    return 1
  fi

  # Save the current directory
  local current_dir="$(pwd)"

  # Change cwd for sha256sum determinism
  cd "$directory" || return 1

  # Compute and sort file hashes, then save to a temporary file
  find . -type f -exec sha256sum {} \; | sort > "/tmp/sha256d.tmp"

  # Change back to the original directory
  cd "$current_dir" || return 1

  hash_result=$(sha256sum "/tmp/sha256d.tmp")
  hash_only=$(echo "$hash_result" | awk '{print $1}')

  # Clean up temporary file
  rm "/tmp/sha256d.tmp"

  echo "SHA-256 Hash: $hash_only"
}


# Function to compare the hashes of two directories
sha256dcomp() {
  local dir1="$1"
  local dir2="$2"

  if [ -z "$dir1" ] || [ -z "$dir2" ]; then
    echo "Usage: compare_directories <directory1> <directory2>"
    return 1
  fi

  local hash1=$(sha256d "$dir1")
  local hash2=$(sha256d "$dir2")

  if [ "$hash1" = "$hash2" ]; then
    echo "Success: The directories have the same SHA-256 hash."
  else
    echo "Failure: The directories have different SHA-256 hashes."
    echo "Directory hash 1: $hash1"
    echo "Directory hash 2: $hash2"
  fi
}

# ------------------------------------- HOMEBREW ------------------------------------- #

export PATH="/opt/homebrew/bin:$PATH"

# --------------------------------------- PIXI --------------------------------------- #
export PATH=$HOME/.pixi/bin:$PATH
eval "$(pixi completion --shell zsh)"

# -------------------------------------- DIRENV -------------------------------------- #
eval "$(direnv hook zsh)"

# ----------------------------------- Fuzzy search ----------------------------------- #

# brew install fzf: fuzzy search
source <(fzf --zsh)
