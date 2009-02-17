From: bugme-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 12726] New: sound/alsa/DocBook/* should be moved to DocBook/
Date: Tue, 17 Feb 2009 09:43:41 -0800 (PST)
Message-ID: <bug-12726-11311@http.bugzilla.kernel.org/>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

http://bugzilla.kernel.org/show_bug.cgi?id=12726

           Summary: sound/alsa/DocBook/* should be moved to DocBook/
           Product: Documentation
           Version: unspecified
     KernelVersion: 2.6.29-rc5
          Platform: All
        OS/Version: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: man-pages
        AssignedTo: documentation_man-pages-ztI5WcYan/vQLgFONoPN62D2FQJk+8+b@public.gmane.org
        ReportedBy: nsoranzo-IWqWACnzNjyonA0d6jMUrA@public.gmane.org


Problem Description:
HTML and other documentation in not generated from DocBook files found in
Documentation/sound/alsa/DocBook/ since there is no Makefile for them.
The most logical solution is to move the 2 files in Documentation/DocBook/ and
add them to the relative Makefile.


-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
