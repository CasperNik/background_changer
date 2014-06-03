# Desktop Background changer from Casper.
* * *

## This is simple but very useful script can help you change you desktop background from yours lib.


## Requirements.
    ruby >= 1.9.3
    GNOME desktop environment
    
## Possibilities.
    Change desktop background from a specified folder with a specified time.
    Random pictures.
    Working like a daemon.
    Auto start with OS.
    
## Install.
    1. Copy this files to yours filesystem in '/home/<your user>/.casper_background/'
    2. Run 'bundle' to make sure all gems was installed.
    3. Create/copy config.txt file in '/home/<your user>/.casper_background/'
        default settings are: 
            folder: /home/<your name>/Pictures/
            time: 10 min
            using_photo_in_log: '2' # means: put picture name used in log file.(1 - true, 2 - false)
    4. Add casper_background_demon_autostart.rb file in "Startup Applications".

## Testing.
    For testing purpose you can run casper_background_demon.rb <command>
      * where <command> is one of:
            start         start an instance of the application
            stop          stop all instances of the application
            restart       stop all instances and restart them afterwards
            reload        send a SIGHUP to all instances of the application
            run           start the application and stay on top
            zap           set the application to a stopped state
            status        show status (PID) of application instances

## Logs.
    Log file located in '/home/<your user>/.casper_background/log.txt'