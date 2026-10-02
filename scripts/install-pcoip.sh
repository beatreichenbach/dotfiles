#!/bin/sh

echo "Downloading PCoIP Client ..."

pkgver=25.10.2
_ubuntuver=22.04

url="https://dl.anyware.hp.com/DeAdBCiUYInHcSTy/pcoip-client/deb/ubuntu/pool/jammy/main/p/pc/pcoip-client_${pkgver}-${_ubuntuver}/pcoip-client_${pkgver}-${_ubuntuver}_amd64.deb"

mkdir -p /tmp/pcoip-client
cd /tmp/pcoip-client
#curl -o pcoip-client.deb "$url"

rm -rf usr/ var/

ar x pcoip-client.deb
tar -xzf data.tar.gz


echo "Installing PCoIP Client ..."

rm -rf var
rm -rf usr/share/doc
rm -rf usr/share/man
rm -rf usr/share/icons/hicolor/128x128
rm -rf usr/lib/x86_64-linux-gnu/org.hp.pcoip-client

# OS doesn't use sbin
mv usr/sbin/pcoip-configure-kernel-networking usr/bin/
rm -rf usr/sbin

# Drop Wayland Qt platform plugins that fail with system libQt6WaylandClient.
rm -rf usr/lib/x86_64-linux-gnu/pcoip-client/plugins/platforms/libqwayland-*.so

# Set capabilities
setcap "cap_setgid+p" "usr/libexec/pcoip-client/pcoip-client"
setcap "cap_setgid+i" "usr/libexec/pcoip-client/usb-helper"

# Force X11/XCB because we drop the broken Wayland Qt plugin.
rm usr/bin/pcoip-client
cat <<'EOF' > usr/bin/pcoip-client
#!/bin/sh
export QT_QPA_PLATFORM="${QT_QPA_PLATFORM:-xcb}"
exec /usr/libexec/pcoip-client/pcoip-client "$@"
EOF
chmod +x usr/bin/pcoip-client

# Qt looks for a sibling lib/ directory.
ln -s . usr/x86_64-linux-gnu/pcoip-client/lib
chmod +x usr/x86_64-linux-gnu/pcoip-client/lib*so*

# Remove url handler as it collides with the dedicated one
sed -i -e 's!MimeType=x-scheme-handler/pcoip;!!' usr/share/applications/pcoip-client.desktop

echo "Installing dependencies ..."

# Bundle Ubuntu protobuf for ABI compatibility.
url="http://se.archive.ubuntu.com/ubuntu/pool/main/p/protobuf/libprotobuf23_3.12.4-1ubuntu7_amd64.deb"
mkdir -p /tmp/protobuf
cd /tmp/protobuf
#curl -o libprotobuf.deb "$url"

rm -rf usr/ var/

ar x libprotobuf.deb
tar -xf data.tar.zst

cp usr/lib/x86_64-linux-gnu/libprotobuf* /tmp/pcoip-client/usr/x86_64-linux-gnu/pcoip-client/

sudo dnf install -y \
  alsa-lib \
  dbus-libs \
  expat \
  fontconfig \
  freetype \
  glib2 \
  krb5-libs \
  libcap \
  libdrm \
  libglvnd-opengl \
  libpng \
  pulseaudio-libs \
  libva \
  libX11 \
  libxcb \
  libXext \
  libXi \
  libxkbcommon-x11 \
  mesa-libGL \
  nspr \
  nss \
  pcsc-lite-libs \
  systemd-libs \
  xcb-util \
  xcb-util-image \
  xcb-util-keysyms \
  xcb-util-renderutil \
  xcb-util-wm \
  zlib

echo "Installing package ..."
cp -a /tmp/pcoip-client/usr/. /usr/

#package_pcoip-client-clipboard() {
#  pkgdesc="Teradici PCOIP client clipboard synchronization plugin"
#  depends=('pcoip-client' 'graphicsmagick>=1.3.26')
#  install=
#
#  tar -C "$pkgdir"/ -xf "$srcdir"/pcoip-client/data.tar.gz \
#    ./usr/lib/x86_64-linux-gnu/org.hp.pcoip-client/vchan_plugins/libvchan-plugin-clipboard.so
#  chmod +x "$pkgdir"/usr/lib/x86_64-linux-gnu/org.hp.pcoip-client/vchan_plugins/libvchan-plugin-clipboard.so
#  patchelf --replace-needed libGraphicsMagick++-Q16.so.12 libGraphicsMagick++.so.12 \
#    "$pkgdir"/usr/lib/x86_64-linux-gnu/org.hp.pcoip-client/vchan_plugins/libvchan-plugin-clipboard.so
#}