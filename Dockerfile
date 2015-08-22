FROM kokutoru/gtox-travis-build:latest

#get packages from git

#prepare tmp
RUN cd /tmp
RUN su -c "git clone https://github.com/KoKuToru/gTox-docker-build-mingw-w64.git -s /bin/bash nobody

#install freetype
RUN su -c "yaourt -Sy --noconfirm --m-arg \"--skipchecksums --skippgpcheck\" mingw-w64-freetype2" -s /bin/bash nobody
RUN su -c "cd /tmp/mingw-w64/mingw-w64-freetype/ && makepkg -si --noconfirm" -s /bin/bash nobody

#install rest
RUN su -c "yaourt -Sy --noconfirm --m-arg \"--skipchecksums --skippgpcheck\" mingw-w64-atk mingw-w64-cairo mingw-w64-configure mingw-w64-crt mingw-w64-gcc mingw-w64-gtk3 mingw-w64-glib2 mingw-w64-gettext mingw-w64-libsigc++ mingw-w64-libxml2 mingw-w64-pkg-config mingw-w64-opus mingw-w64-libvpx" -s /bin/bash nobody

#install atkmm
RUN su -c "cd /tmp/mingw-w64/mingw-w64-atkmm/ && makepkg -si --noconfirm" -s /bin/bash nobody

#install glibmm
RUN su -c "cd /tmp/mingw-w64/mingw-w64-glibmm/ && makepkg -si --noconfirm" -s /bin/bash nobody

#install cairomm
RUN su -c "cd /tmp/mingw-w64/mingw-w64-cairomm/ && makepkg -si --noconfirm" -s /bin/bash nobody

#install pango
RUN su -c "cd /tmp/mingw-w64/mingw-w64-pango/ && makepkg -si --noconfirm" -s /bin/bash nobody

#install pangomm
RUN su -c "cd /tmp/mingw-w64/mingw-w64-pangomm/ && makepkg -si --noconfirm" -s /bin/bash nobody

#install gtkmm3
RUN su -c "cd /tmp/mingw-w64/mingw-w64-gtkmm3/ && makepkg -si --noconfirm" -s /bin/bash nobody

#install libsodium
RUN su -c "cd /tmp/mingw-w64/mingw-w64-libsodium/ && makepkg -si --noconfirm" -s /bin/bash nobody

#install tox-git
RUN su -c "cd /tmp/mingw-w64/mingw-w64-tox-git/ && makepkg -si --noconfirm" -s /bin/bash nobody

