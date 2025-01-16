#!/bin/bash
args="$@"
default_args="--daemon=no --exit-with-children --speaker=disabled --microphone=disabled --start-child=/home/javafoil/MH-AeroTools/JavaFoil/JavaFoil.sh --start-child=/home/javafoil/resize_javafoil.sh"
binding="--bind-tcp=0.0.0.0:14500"
secrets_file="/home/javafoil/.secrets/xpra_password.txt"

if [[ -f $secrets_file ]]; then
    binding="${binding},auth=file,filename=${secrets_file}";
fi

/usr/bin/xpra start $binding $default_args $args