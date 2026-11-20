#!/bin/sh
# Electron needs a TMPDIR the host can see for single-instance IPC.
export TMPDIR="$XDG_RUNTIME_DIR/app/$FLATPAK_ID"
# Sets the Wayland app_id so the window matches the desktop file.
export CHROME_DESKTOP=com.emqx.MQTTX.desktop
exec zypak-wrapper /app/mqttx/mqttx "$@"
