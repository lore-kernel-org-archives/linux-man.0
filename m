From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 13267] New: Perl is needed to build the kernel but it is not in
 Documentation/Changes
Date: Thu, 7 May 2009 15:21:51 GMT
Message-ID: <bug-13267-11311@http.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

http://bugzilla.kernel.org/show_bug.cgi?id=13267

           Summary: Perl is needed to build the kernel but it is not in
                    Documentation/Changes
           Product: Documentation
           Version: unspecified
          Platform: All
        OS/Version: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: man-pages
        AssignedTo: documentation_man-pages-ztI5WcYan/vQLgFONoPN62D2FQJk+8+b@public.gmane.org
        ReportedBy: jluis-v7/jHdWd/zNeH41UXmfQsti2O/JbrIOy@public.gmane.org
        Regression: No


Perl is used on the kernel Makefile to generate documentation, firmwares in c
source form, sources, graphs, and some headers.

Documentation/Changes does not list Perl 5 and the following modules:
Getopt::Long, Getopt::Std, File::Basename, and  File::Find.

I noticed this when building the kernel on a openmoko GTA02 using distcc for
some bechmarchs

-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
