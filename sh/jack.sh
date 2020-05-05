pacmd load-module module-jack-sink
pacmd load-module module-jack-source

pacmd set-default-sink jack_out
pacmd set-default-source jack_in

