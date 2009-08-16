From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 13993] New: KGDB is Lacking Proper Documentation
Date: Sun, 16 Aug 2009 00:59:03 GMT
Message-ID: <bug-13993-11311@http.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

http://bugzilla.kernel.org/show_bug.cgi?id=13993

           Summary: KGDB is Lacking Proper Documentation
           Product: Documentation
           Version: unspecified
    Kernel Version: 2.6.30.4
          Platform: All
        OS/Version: Linux
              Tree: Mainline
            Status: NEW
          Severity: enhancement
          Priority: P1
         Component: man-pages
        AssignedTo: documentation_man-pages-ztI5WcYan/vQLgFONoPN62D2FQJk+8+b@public.gmane.org
        ReportedBy: rogerx-VThn6mlTRQFChFL4AGkBsw@public.gmane.org
        Regression: No


Looking over both the Internet & in-kernel documentation for KGDB, KGDB
documentation seems lacking and it's usage process can not easily be
determined.

One good example, is the mixing of terms for "target computer" and other
terminology for the destination and/or reciever can easily confuse users.

Proper documentation would completely define the two computers as:

X = computer for debugging kernel
Y = stable computer being used for GDB frontend


I also can't immediately get KGDB/GDB working over serial console tty.  I do
have a completely working serial console over tty for debugging kernel loading,
as well as an inittab entry.  Even disabling these on cmdline and inittab still
proved KGDB non-functional here.


So, as a side not, likely I'll need to get it work through ethernet first or by
some other means. :-/

-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
