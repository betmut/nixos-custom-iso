update_config() {
  local target_os=${1:-$(uname | tr '[:upper:]' '[:lower:]')}
  local file="configuration.nix"

  # Memastikan file ada sebelum diproses
  if [ ! -f "$file" ]; then
    echo "Error: File $file not found!"
    return 1
  fi

  if [ "$target_os" == "linux" ]; then
    echo "Changing configuration to Linux..."
    # Searching 'darwin' and replace it with 'linux'
    sed -i 's/darwin/linux/g' "$file"
  else
    echo "Changing configuration to Darwin (macOS)..."
    # Searching 'linux' and replace it with 'darwin'
    sed -i 's/linux/darwin/g' "$file"
  fi

  echo "Selesai! Berikut isi file sekarang:"
  grep -E "linux|darwin" "$file"
}