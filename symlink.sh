#/bin/sh

SCRIPT_DIR=/home/$USER/bin
REPO_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
SCRIPTS="$(find $REPO_DIR -mindepth 2 -type f -not -path '*/\.*' -not -path '*.md')"

for script in $SCRIPTS; do
  if ! [ -L "$SCRIPT_DIR/`basename $script`" ]; then
    echo "Creating symlink to $script in $SCRIPT_DIR/`basename $script`"
    ln -s $script $SCRIPT_DIR/`basename $script`
  fi
done

