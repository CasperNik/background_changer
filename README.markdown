# Desktop Background changer from Casper.
    This is simple but very useful script can help you change you desktop background from yours lib.
## Requirements.
    
## Possibilities.
    
## Install.
    * Copy this files to yours filesystem
    * Run bundle to make sure all gems was installed.
    * Create config.txt file in /home/<your user>/.casper_background/
        default settings is: 
            folder: /home/<your name>/Pictures/
            time: 10 min
    * Add casper_background_demon_autostart.rb file in "Startup Applications".

## Testing
    For testing purpose you can run casper_background_demon.rb <command>
      * where <command> is one of:
            start         start an instance of the application
            stop          stop all instances of the application
            restart       stop all instances and restart them afterwards
            reload        send a SIGHUP to all instances of the application
            run           start the application and stay on top
            zap           set the application to a stopped state
            status        show status (PID) of application instances
