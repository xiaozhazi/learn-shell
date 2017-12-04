# /bin/bash 

if [ -f $HOME/.Xclients ]; then
  exec $HOME/.Xclients 
elif
  [ -f /etc/X11/xinit/Xclients ]; then
exec /etc/X11/xinit/Xclients
else
  #failsafe settings. Although we should never get here.
  # (we provide fallbacks in Xclients as well) it can't hurt.
  xclock -geometry 100*100-5+5 &
  xterm -geometry 80*50-50+150 &
  if [ -f /usr/bin/netscape -a -f /usr/share/doc/HTML/index.html ]; then
    netscape /usr/share/doc/HTML/index.html &
  fi
fi
