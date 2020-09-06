# buildx with 
#docker buildx build -t andrewufrank/xfce-plusone:v1 --platform linux/arm/v7,linux/arm64,linux/amd64  --push .

# include a set of always used gui based tools


# x11docker/xfce but built on basics
# xorg synaptic apt-xapian-index \

#
# Options:
# Persistent home folder stored on host with   --home
# Shared host folder with                      --share DIR
# Hardware acceleration with option            --gpu
# Clipboard sharing with option                --clipboard
# ALSA sound support with option               --alsa
# Pulseaudio sound support with option         --pulseaudio
# Language setting with                        --lang [=$LANG]
# Printing over CUPS with                      --printer
# Webcam support with                          --webcam
#
# Look at x11docker --help for further options.

FROM andrewufrank/xfce:latest

RUN apt-get update &&  \ 
# is already in xfce-tools  
#    env DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
#      	xpra \
#      	xserver-xephyr \
#      	lightdm  && \
    env DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
       	baobab\
      	gparted \
      	gdebi \   
      	avahi-discover \
      	meld file-roller \
      	git git-gui \      
      	gnome-disk-utility   \
    && rm -rf /var/lib/apt/lists/*

CMD ["startxfce4"]
