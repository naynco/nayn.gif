ffmpeg -loop 1 -i nayn.jpg -c:v libx264 -t 7 -pix_fmt yuv420p -vf \
 "drawbox=y=ih/PHI:color=black@0.4:width=iw:height=80:t=fill, \
 drawtext=fontfile=Open_Sans/OpenSans-ExtraBold.ttf:text='Galatasaray, Linnes’i Başakşehir’e vermedi':fontcolor=white:fontsize=28:x=(w-tw)/2:y=(h/PHI)+th" nayn_j.mp4

ffmpeg -i nayn_j.mp4 -c:v libx264 -pix_fmt yuv420p -vf "movie=nayn.png:loop=0.1,setpts=N/FRAME_RATE/TB,scale=144:31,format=rgba,fade=in:0:30:alpha=1[watermark];[in][watermark]overlay=5:H-h-15:shortest=1[out]" nayn_j1.mp4


ffmpeg -t 7 -i nayn_j1.mp4 -f gif nayn.gif
