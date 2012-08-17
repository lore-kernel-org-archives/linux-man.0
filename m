From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 46091] New: syslog.3 says LOG_AUTH is deprecated
Date: Fri, 17 Aug 2012 09:36:57 +0000 (UTC)
Message-ID: <bug-46091-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=46091

           Summary: syslog.3 says LOG_AUTH is deprecated
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
        ReportedBy: simon-RTwAkxXyIg6Ei8DpZVb4nw@public.gmane.org
        Regression: No


Created an attachment (id=77881)
 --> (https://bugzilla.kernel.org/attachment.cgi?id=77881)
Patch undeprecating LOG_AUTH

Hi!

syslog.3 contains:

.B LOG_AUTH
security/authorization messages (DEPRECATED Use
.B LOG_AUTHPRIV
instead)
.TP
.B LOG_AUTHPRIV
security/authorization messages (private)

However I cannot find any other source that claim LOG_AUTH is deprecated in
anyway.  LOG_AUTH is distinct from LOG_AUTHPRIV.  The GNU C Library manual only
documents LOG_AUTH.  The header files contains both without any comment. 
Common systems like Debian appear to refer to both auth and authpriv facilities
in syslog configurations.  Popular daemons appear to use both facilities.  Both
facilities are discussed in several RFCs.

Thus, I propose attached patch to not say DEPRECATED anymore.

While the patch is trivial, I'm opening a bugzilla bug to track discussions
since there could be other opinions.

For more background, see:
http://thread.gmane.org/gmane.comp.gnu.shishi.general/708/focus=735
http://thread.gmane.org/gmane.comp.gnu.shishi.general/708/focus=734

/Simon

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
