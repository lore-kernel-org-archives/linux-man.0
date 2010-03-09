From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 15484] New: amd_adac error
Date: Tue, 9 Mar 2010 11:46:43 GMT
Message-ID: <bug-15484-11311@http.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

http://bugzilla.kernel.org/show_bug.cgi?id=15484

           Summary: amd_adac error
           Product: Documentation
           Version: unspecified
    Kernel Version: 2.6.31
          Platform: All
        OS/Version: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: man-pages
        AssignedTo: documentation_man-pages-ztI5WcYan/vQLgFONoPN62D2FQJk+8+b@public.gmane.org
        ReportedBy: masoudnahali-EMRzualFZlQ@public.gmane.org
        Regression: No


when I execute a software (XCrysden) that has a graphical face, I see the
graphical face only for less than one second and then disappears. the operating
system is SUSE 11.2 (64 bit), and Hardwares :
AMD 3 cores 2.8 GHz (64 bit)
RAM : DDR3 8 Gig
Motherboard: Asus
Graphics: on board 

the error:
 > drmRadeonCmdBuffer: -22. Kernel failed to parse or rejected command >
stream. See dmesg for more info

I executed "dmesg" in the /bin for finding the probelm and in the results there
is a line included an error : 

 [ 8.255075] amd64_edac: probe of 0000:00:18.2 failed with error -22

-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
