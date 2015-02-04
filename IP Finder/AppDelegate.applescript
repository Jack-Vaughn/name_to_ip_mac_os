--
--  AppDelegate.applescript
--  IP Finder
--
--  Created by Vaughn, Jack on 1/16/15.
--  Copyright (c) 2015 RCSNC. All rights reserved.
--

script AppDelegate
	property parent : class "NSObject"
	
	-- IBOutlets
    property theWindow : missing value
    property ipLabel : missing value
    property textField : missing value
    property progressBar : missing value
    
    global theIP
    global serialNumber
    set serialNumber to ""
    
    -- Function Declarations
    
    on findIP_(sender)
        
        set serialNumber to textField's stringValue() as text
        
        if serialNumber is "" then
            
            ipLabel's setStringValue_("Enter The Serial Number To Find The IP")
            
            else
            
            try
            
            set theIP to do shell script "ping -o -c1 " & serialNumber & " | cut -d'(' -f2 | cut -d')' -f1 | head -n1"
            
            on error
            
                ipLabel's setStringValue_("Offline!")
            
                return
            
        end try
        
        if theIP is "" then
            
            ipLabel's setStringValue_("Offline!")
            
            else
        
        ipLabel's setStringValue_(serialNumber & " is online and it's IP address is \n" & theIP)
        
        end if
        
        end if
        
    end findIP_
    
    on ipPressed_(sender)
        
        log "IP Pressed"
        
        if serialNumber is "" then
            
            return --do nothing
            
        else
        
        set the clipboard to theIP
        
        end if
        
    end ipPressed_
	
	on applicationWillFinishLaunching_(aNotification)
		-- Insert code here to initialize your application before any files are opened
	end applicationWillFinishLaunching_
	
	on applicationShouldTerminate_(sender)
		-- Insert code here to do any housekeeping before your application quits 
		return current application's NSTerminateNow
    end applicationShouldTerminate_
    
    on applicationShouldTerminateAfterLastWindowClosed_(sender) --this function closes the program when 'x' button is clicked
        return true
    end applicationShouldTerminateAfterLastWindowClosed_
	
end script