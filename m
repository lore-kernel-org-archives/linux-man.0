From: bugme-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 10356] New: glibc 2.7 notes for eventfd(2)
Date: Sat, 29 Mar 2008 08:46:31 -0700 (PDT)
Message-ID: <bug-10356-11311@http.bugzilla.kernel.org/>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

http://bugzilla.kernel.org/show_bug.cgi?id=10356

           Summary: glibc 2.7 notes for eventfd(2)
           Product: Documentation
           Version: unspecified
     KernelVersion: n/a
          Platform: All
        OS/Version: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: man-pages
        AssignedTo: documentation_man-pages-ztI5WcYan/vQLgFONoPN62D2FQJk+8+b@public.gmane.org
        ReportedBy: mrsam-W1w4QoW4mIDgLSHwZvcCBg@public.gmane.org


I tested this, and it works:

--- /home/mrsam/src/man-pages/sources/manpages/man-pages-2.79/man2/eventfd.2   
2008-03-03 08:25:44.000000000 -0500
+++ ./eventfd.2 2008-03-29 11:42:24.000000000 -0400
@@ -204,8 +204,28 @@
 .SH VERSIONS
 .BR eventfd ()
 is available on Linux since kernel 2.6.22.
-Working support is provided in glibc since version 2.8.
+Working support is provided in glibc since version 2.8,
 .\" eventfd() is in glibc 2.7, but reportedly does not build
+but it's possible to create an event file descriptor with glibc 2.7 using
+.BR syscall (2):
+.RS
+.nf
+
+#include <sys/syscall.h>
+#include <unistd.h>
+
+...
+
+int efd=syscall(SYS_eventfd, 0, 0);
+
+.fi
+.RE
+Then use
+.BR read (2)
+and
+.BR write (2)
+with this file descriptor.
+This works as long as glibc 2.7 itself was built on kernel 2.6.22, or later.
 .SH CONFORMING TO
 .BR eventfd ()
 is Linux-specific.


-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
