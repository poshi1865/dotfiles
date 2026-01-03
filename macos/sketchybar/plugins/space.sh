#!/bin/sh

# The $SELECTED variable is available for space components and indicates if
# the space invoking this script (with name: $NAME) is currently selected:
# https://felixkratz.github.io/SketchyBar/config/components#space----associate-mission-control-spaces-with-an-item

# Get the space label from yabai if available
if command -v yabai &> /dev/null; then
  SPACE_LABEL=$(yabai -m query --spaces --space "$SID" | jq -r '.label // empty')
  if [ -n "$SPACE_LABEL" ]; then
    sketchybar --set "$NAME" label="$SPACE_LABEL" background.drawing="$SELECTED"
  else
    sketchybar --set "$NAME" label="" background.drawing="$SELECTED"
  fi
else
  sketchybar --set "$NAME" label="" background.drawing="$SELECTED"
fi
