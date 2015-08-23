FROM pritunl/archlinux:latest
RUN pacman -Syu --noconfirm
RUN pacman -Sy --noconfirm sudo base-devel desktop-file-utils gtk-update-icon-cache git librsvg
RUN echo "nobody ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
RUN su -c "cd /tmp && curl -O https://aur.archlinux.org/cgit/aur.git/snapshot/package-query.tar.gz && tar zxvf package-query.tar.gz && cd package-query && makepkg -si --noconfirm" -s /bin/bash nobody
RUN su -c "cd /tmp && curl -O https://aur.archlinux.org/cgit/aur.git/snapshot/yaourt.tar.gz        && tar zxvf yaourt.tar.gz        && cd yaourt        && makepkg -si --noconfirm" -s /bin/bash nobody

COPY . /tmp/mingw-w64/
RUN chown -R nobody /tmp/mingw-w64 && su -c "cd /tmp/mingw-w64  && ./install.sh" -s /bin/bash nobody && rm -rf /tmp/*
