Vim�UnDo� \�amz����|\���t0�=���j��߀   %   :        FILE="/home/vishnu/Music/$(mpc current -f %file%)"   	                          d�h"    _�                            ����                                                                                                                                                                                                                                                                                                                                                             d�g�    �                   �               5��                    $   @                   �      5�_�                     	       ����                                                                                                                                                                                                                                                                                                                                                             d�h!    �      
   %      :        FILE="/home/vishnu/Music/$(mpc current -f %file%)"5��                        �                     5�_�                             ����                                                                                                                                                                                                                                                                                                                                                             dv
n    �              �                 	#!/bin/sh   L# extend non-HiDPI external display on DP* above HiDPI internal display eDP*   5# see also https://wiki.archlinux.org/index.php/HiDPI   E# you may run into https://bugs.freedesktop.org/show_bug.cgi?id=39949   T#                  https://bugs.launchpad.net/ubuntu/+source/xorg-server/+bug/883319       WEXT=`xrandr --current | sed 's/^\(.*\) connected.*$/\1/p;d' | grep -v ^eDP | head -n 1`   VINT=`xrandr --current | sed 's/^\(.*\) connected.*$/\1/p;d' | grep -v ^DP | head -n 1`       Cext_w=`xrandr | sed 's/^'"${EXT}"' [^0-9]* \([0-9]\+\)x.*$/\1/p;d'`   Jext_h=`xrandr | sed 's/^'"${EXT}"' [^0-9]* [0-9]\+x\([0-9]\+\).*$/\1/p;d'`   Cint_w=`xrandr | sed 's/^'"${INT}"' [^0-9]* \([0-9]\+\)x.*$/\1/p;d'`   4off_w=`echo $(( ($int_w-$ext_w)/2 )) | sed 's/^-//'`       sxrandr --output "${INT}" --auto --pos ${off_w}x${ext_h} --scale 1x1  --output "${EXT}" --auto --scale 2x2 --pos 0x05��                       s                   U      5��