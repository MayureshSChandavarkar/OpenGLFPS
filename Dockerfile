FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive

# 1. Install standard tools + Graphical Support
# We install 'novnc' and 'websockify' explicitly
RUN apt-get update && apt-get install -y \
    build-essential cmake git \
    libglfw3-dev libglm-dev xorg-dev libgl1-mesa-dev \
    xvfb x11vnc fluxbox novnc python3-websockify python3-numpy \
    net-tools

# 2. Setup the environment for the web view
ENV DISPLAY=:0
ENV XRES=1280x720x24

# 3. Create the startup script
# NOTICE THE CHANGE below: We use 'novnc_proxy' instead of 'launch.sh'
RUN echo '#!/bin/bash\n\
rm -f /tmp/.X0-lock\n\
Xvfb :0 -screen 0 $XRES &\n\
sleep 1\n\
fluxbox &\n\
x11vnc -display :0 -forever -shared -rfbport 5900 -nopw &\n\
/usr/share/novnc/utils/novnc_proxy --vnc localhost:5900 --listen 6080\n\
' > /start.sh && chmod +x /start.sh

WORKDIR /app

# Expose the web port
EXPOSE 6080

CMD ["/start.sh"]