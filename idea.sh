#!/bin/sh
IDEA_HOME=/opt/IDEA
export IDEA_JDK=/usr/lib/jvm/tuxjdk
export JAVA_HOME=/usr/lib/jvm/tuxjdk
# Note: Can modify $IDEA_HOME/bin/idea{,64}.vmoptions
# instead of setting here.
# "-Dawt.useSystemAAFontSettings=on" seems worse to me
# "-Dsun.java2d.xrender=true" makes fonts darker
export _JAVA_OPTIONS="-Dawt.useSystemAAFontSettings=on -Dsun.java2d.xrender=true -Dswing.aatext=true"
# Having this set makes menu font size smaller (wtf?)
export GNOME_DESKTOP_SESSION_ID=this-is-deprecated
# Ubuntu global menu integration
#export JAVA_TOOL_OPTIONS=-javaagent:/usr/share/java/jayatanaag.jar
export JAVA_TOOL_OPTIONS=
#unset GNOME_DESKTOP_SESSION_ID
exec $IDEA_HOME/bin/idea.sh "$@" 
