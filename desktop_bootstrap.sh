#/bin/bash

# Auto start desktop applications for daily work


#$chrome_urls=(https://wiki.nov.com/display/ITSI/IT+Server+Infrastructure+Home https://jira.nov.com/secure/RapidBoard.jspa?rapidView=5519 http://stash.nov.com:7990/profile)


#start chrome

#length="${#chrome_urls[@]}"

#for ((i=0; i<$length;i++)); do
#    /opt/google/chrome/chrome ${chrome_urls[$i]}
#done

KDS=org.kde.konsole
counter=0

/opt/google/chrome/chrome &

#start Konsole

/usr/bin/konsole --noclose -e dev-tmux prod  #launch initial
    qdbus $KDS /Sessions/1 setTitle 1 "PROD" 

qdbus $KDS /Windows/1 newSession # launch second tab
    qdbus $KDS /Sessions/2 setTitle 1 "DEV"
    qdbus $KDS /Sessions/2 sendText "dev-tmux dev"
    qdbus $KDS /Sessions/2 sendText $'\n'

qdbus $KDS /Windows/1 newSession #launch third
    qdbus $KDS /Sessions/3 setTitle 1 "WORK"

sleep 1
/usr/bin/konsole --noclose -e tmux
    qdbus $KDS /Sessions/4 setTitle 1 "AUX" 
