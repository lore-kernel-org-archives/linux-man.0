From: bugme-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 10770] New: many modules lacking description: field in modinfo
Date: Wed, 21 May 2008 10:32:45 -0700 (PDT)
Message-ID: <bug-10770-11311@http.bugzilla.kernel.org/>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

http://bugzilla.kernel.org/show_bug.cgi?id=10770

           Summary: many modules lacking description: field in modinfo
           Product: Documentation
           Version: unspecified
     KernelVersion: 2.6
          Platform: All
        OS/Version: Linux
              Tree: Mainline
            Status: NEW
          Severity: enhancement
          Priority: P1
         Component: man-pages
        AssignedTo: documentation_man-pages-ztI5WcYan/vQLgFONoPN62D2FQJk+8+b@public.gmane.org
        ReportedBy: devzero-S0/GAf8tV78@public.gmane.org


Problem Description:

more than once i wanted to check "what is this module for?" - but modinfo
didn't give any information about that. 

no kernel source available at the customer machine.....and no internet
available in the serverroom...

i checked this and i tested modules (suse default install) for description:
availability. 

2145 modules tested
1741 modules have the description field
404 modules missing the description field

what about making the description field mandatory for modules and warn about
that on load or at compile time ?

that would make sure that each module get`s one sooner or later....


-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
