#!/usr/bin/bash
ROOT=$PWD

#install freetype
yaourt -Sy --noconfirm --m-arg "--skipchecksums --skippgpcheck" mingw-w64-freetype2 \
&& cd $ROOT/mingw-w64-freetype/ \
&& makepkg -si --noconfirm
if [[ $? -ne 0 ]]; then
    exit 1
fi

#install pango
yaourt -Sy --noconfirm --m-arg "--skipchecksums --skippgpcheck" mingw-w64-harfbuzz mingw-w64-cairo \
&& cd $ROOT/mingw-w64-pango/ \
&& makepkg -si --noconfirm
if [[ $? -ne 0 ]]; then
    exit 1
fi

#install rest
yaourt -Sy --noconfirm --m-arg "--skipchecksums --skippgpcheck" \
mingw-w64-atk \
mingw-w64-configure \
mingw-w64-gtk3 \
mingw-w64-gettext \
mingw-w64-libsigc++ \
mingw-w64-libxml2 \
mingw-w64-pkg-config \
mingw-w64-opus \
mingw-w64-libvpx \
mingw-w64-libvorbis \
mingw-w64-libtheora \
mingw-w64-gdk-pixbuf2 \
flatbuffers
if [[ $? -ne 0 ]]; then
    exit 1
fi

#install
for pkg in glibmm atkmm cairomm pangomm libsodium tox-git flatbuffers gstreamer gst-plugins-base gstreamermm gtkmm3 libcroco librsvg
do
    cd $ROOT/mingw-w64-$pkg/ \
    && makepkg -si --noconfirm --skipchecksums --skippgpcheck
    
    if [[ $? -ne 0 ]]; then
        exit 1
    fi
done
