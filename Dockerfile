FROM pritunl/archlinux:latest
RUN pacman -Syu --noconfirm
RUN pacman -Sy --noconfirm sudo base-devel desktop-file-utils gtk-update-icon-cache git librsvg
RUN echo "nobody ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
RUN su -c "cd /tmp && curl -O https://aur.archlinux.org/cgit/aur.git/snapshot/package-query.tar.gz && tar zxvf package-query.tar.gz && cd package-query && makepkg -si --noconfirm" -s /bin/bash nobody
RUN su -c "cd /tmp && curl -O https://aur.archlinux.org/cgit/aur.git/snapshot/yaourt.tar.gz        && tar zxvf yaourt.tar.gz        && cd yaourt        && makepkg -si --noconfirm" -s /bin/bash nobody

#get packages from git
RUN cd /tmp && su -c "git clone https://github.com/KoKuToru/gTox-docker-build-mingw-w64.git -s /bin/bash nobody

#install freetype
RUN su -c "yaourt -Sy --noconfirm --m-arg \"--skipchecksums --skippgpcheck\" mingw-w64-freetype2" -s /bin/bash nobody
RUN su -c "cd /tmp/mingw-w64/mingw-w64-freetype/ && makepkg -si --noconfirm" -s /bin/bash nobody

#install pango
RUN su -c "yaourt -Sy --noconfirm --m-arg \"--skipchecksums --skippgpcheck\" mingw-w64-harfbuzz mingw-w64-cairo" -s /bin/bash nobody
RUN su -c "cd /tmp/mingw-w64/mingw-w64-pango/ && makepkg -si --noconfirm" -s /bin/bash nobody

#install rest
RUN su -c "yaourt -Sy --noconfirm --m-arg \"--skipchecksums --skippgpcheck\" mingw-w64-atk mingw-w64-configure mingw-w64-gtk3 mingw-w64-gettext mingw-w64-libsigc++ mingw-w64-libxml2 mingw-w64-pkg-config mingw-w64-opus mingw-w64-libvpx mingw-w64-libvorbis mingw-w64-libtheora" -s /bin/bash nobody

#install glibmm
RUN su -c "cd /tmp/mingw-w64/mingw-w64-glibmm/ && makepkg -si --noconfirm --skipchecksums --skippgpcheck" -s /bin/bash nobody

#install atkmm
RUN su -c "cd /tmp/mingw-w64/mingw-w64-atkmm/ && makepkg -si --noconfirm --skipchecksums --skippgpcheck" -s /bin/bash nobody

#install cairomm
RUN su -c "cd /tmp/mingw-w64/mingw-w64-cairomm/ && makepkg -si --noconfirm --skipchecksums --skippgpcheck" -s /bin/bash nobody

#install pangomm
RUN su -c "cd /tmp/mingw-w64/mingw-w64-pangomm/ && makepkg -si --noconfirm --skipchecksums --skippgpcheck" -s /bin/bash nobody

#install gtkmm3
RUN su -c "cd /tmp/mingw-w64/mingw-w64-gtkmm3/ && makepkg -si --noconfirm --skipchecksums --skippgpcheck" -s /bin/bash nobody

#install libsodium
RUN su -c "cd /tmp/mingw-w64/mingw-w64-libsodium/ && makepkg -si --noconfirm --skipchecksums --skippgpcheck" -s /bin/bash nobody

#install tox-git
RUN su -c "cd /tmp/mingw-w64/mingw-w64-tox-git/ && makepkg -si --noconfirm --skipchecksums --skippgpcheck" -s /bin/bash nobody

#install gstreamer
RUN su -c "cd /tmp/mingw-w64/mingw-w64-gstreamer/ && makepkg -si --noconfirm --skipchecksums --skippgpcheck" -s /bin/bash nobody

#install gst-plugins-base
RUN su -c "cd /tmp/mingw-w64/mingw-w64-gst-plugins-base/ && makepkg -si --noconfirm --skipchecksums --skippgpcheck" -s /bin/bash nobody

#install gstreamermm
RUN su -c "cd /tmp/mingw-w64/mingw-w64-gstreamermm/ && makepkg -si --noconfirm --skipchecksums --skippgpcheck" -s /bin/bash nobody

#install flatbuffers
RUN su -c "cd /tmp/mingw-w64/mingw-w64-flatbuffers/ && makepkg -si --noconfirm --skipchecksums --skippgpcheck" -s /bin/bash nobody
