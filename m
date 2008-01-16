From: bugme-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 9765] New: CONFIG_IWLWIFI references non-existing Documentation/README.iwlwifi
Date: Wed, 16 Jan 2008 05:58:21 -0800 (PST)
Message-ID: <bug-9765-11311@http.bugzilla.kernel.org/>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

http://bugzilla.kernel.org/show_bug.cgi?id=9765

           Summary: CONFIG_IWLWIFI references non-existing
                    Documentation/README.iwlwifi
           Product: Documentation
           Version: unspecified
     KernelVersion: 2.6.24_rc7
          Platform: All
        OS/Version: Linux
              Tree: Mainline
            Status: NEW
          Severity: low
          Priority: P1
         Component: man-pages
        AssignedTo: documentation_man-pages-ztI5WcYan/vQLgFONoPN62D2FQJk+8+b@public.gmane.org
        ReportedBy: jieryn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org


Latest working kernel version: never
Earliest failing kernel version: 2.6.24_rc1
Distribution: gentoo, (vanilla-sources)
Hardware Environment: thinkpad
Software Environment: gnu/linux
Problem Description: The help for CONFIG_IWLWIFI option references a document
Documentation/README.iwlwifi which does not exist

Steps to reproduce: make menuconfig, navigate to device drivers > networking >
wireless lan > intel wireless wifi drivers, ask for help


-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
