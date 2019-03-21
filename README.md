# arucotracking

This repository is a wrapper around the OpenCV 3dcalib toolkit. For
installation, clone or unzip the repository, and type "make dep", then
"make".

# Examples:

## Create a marker board:



    ./create_board -d=10 --bb=1 -h=7 -w=5 -l=72 -s=36 board.png

`-d=10` will create a `DICT_6X6_250` dictionary

`--bb=1` one bit in marker borders

`-h=7` seven markers in Y direction

`-w=5` five markers in X direction

`-l=72` marker side length of 72 pixels

`-s=36` separation of 36 pixels

Print at 72 dpi to get one inch markers.

## Generate camera calibration:



    ./calibrate_camera camera.calib --ci=1 -d=10 -h=7 -w=5 -l=0.0254 --pc=true -s=0.0127



## Detect markers from file and print into csv file, using camera calibration:


    ./detect_and_print_markers -c=camera.calib -d=10 -l=0.0254 --ci=1

    ./detect_and_print_markers -c=camera.calib -d=10 -l=0.0254 -v=video.mp4 > data.csv


## Detect markers and send via OSC:


    ./detect_and_send_markers -d=10 -l=2.54 --ci=1 -c=camera.calib --url=osc.udp://localhost:9877/ --fmt=/scene/obj%d/pos --norot --smooth=0.9

`--url` is the OSC destination

`--fmt` is the path format, it needs one `%d` occurence which will be replaced by the marker number