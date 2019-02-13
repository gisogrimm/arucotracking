## arucotracking


## Examples:

#Create a marker board:

./create_board -d=10 --bb=1 -h=5 -l=200 -s=200 -w=6 board.png


#Generate camera calibration:

./calibrate_camera


#Detect markers from file and print into csv file, using camera calibration:

./detect_and_print_markers -c=calib_canon_18mm -d=10 -l=0.02 -v=MVI_1384.MOV > rotor.csv