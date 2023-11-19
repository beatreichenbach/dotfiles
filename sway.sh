#!/usr/bin/env bash
# Export Environment Variables and Start Sway

# --- Wayland ---

export XDG_SESSION_TYPE=wayland
export XDG_SESSION_DESKTOP=sway
export XDG_CURRENT_DESKTOP=sway
export XDG_CURRENT_SESSION=sway

# --- Nvidia ---

# OpenGL Variables
export GBM_BACKEND=nvidia-drm
export __GL_GSYNC_ALLOWED=0
export __GL_VRR_ALLOWED=0
export __GLX_VENDOR_LIBRARY_NAME=nvidia

export LIBVA_DRIVER_NAME=nvidia
# Hardware cursors not yet working on wlroots
export WLR_NO_HARDWARE_CURSORS=1
# Set wlroots renderer to Vulkan to avoid flickering
export WLR_RENDERER=vulkan
# Xwayland compatibility
export XWAYLAND_NO_GLAMOR=1

# --- GTK ---

export CLUTTER_BACKEND=wayland
export GDK_BACKEND=wayland,x11

# --- QT ---

export QT_QPA_PLATFORMTHEME=qt5ct
export QT_AUTO_SCREEN_SCALE_FACTOR=1
export QT_QPA_PLATFORM=wayland
#export QT_QPA_PLATFORM=wayland-egl #error with apps xcb
#export QT_WAYLAND_FORCE_DPI=physical #uncomment this to use monitor's DPI
export QT_WAYLAND_DISABLE_WINDOWDECORATION=1

# --- Apps ---

# Firefox
export MOZ_ENABLE_WAYLAND=1

# Java environment
export _JAVA_AWT_WM_NONREPARENTING=1


# https://unix.stackexchange.com/questions/230238/x-applications-warn-couldnt-connect-to-accessibility-bus-on-stderr
# disable accessibility errors
#export NO_AT_BRIDGE=1

#export DBUS_SESSION_BUS_ADDRESS
#export DBUS_SESSION_BUS_PID

# Start Sway
sway --unsupported-gpu