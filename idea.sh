#!/bin/sh
# change to your location
#IDEA_HOME=/opt/idea-IU-143.381.42
IDEA_HOME=/opt/idea-IU-143.382.35
export JAVA_HOME=/usr/lib/jvm/tuxjdk-1.80-66
# Note: Can modify $IDEA_HOME/bin/idea{,64}.vmoptions
# instead of setting here.
# "-Dawt.useSystemAAFontSettings=on" seems worse to me
# "-Dsun.java2d.xrender=true" makes fonts darker
export _JAVA_OPTIONS="-Dawt.useSystemAAFontSettings=on -Dsun.java2d.xrender=true -Dswing.aatext=true"
# Having this set makes menu font size smaller (wtf?)
export GNOME_DESKTOP_SESSION_ID=this-is-deprecated
#unset GNOME_DESKTOP_SESSION_ID
exec $IDEA_HOME/bin/idea.sh "$@" 
