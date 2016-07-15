From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 134971] New: Clarify kill(2) man-page for permission to "send"
 signal 0
Date: Fri, 15 Jul 2016 02:50:30 +0000
Message-ID: <bug-134971-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=134971

            Bug ID: 134971
           Summary: Clarify kill(2) man-page for permission to "send"
                    signal 0
           Product: Documentation
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: enhancement
          Priority: P1
         Component: man-pages
          Assignee: documentation_man-pages-ztI5WcYan/vQLgFONoPN62D2FQJk+8+b@public.gmane.org
          Reporter: jrw32982-/E1597aS9LQAvxtiuMwx3w@public.gmane.org
        Regression: No

The description of errors relating to signal 0 leaves room for
misinterpretation.

The kill(2) man-page says that for signal 0, no signal is sent, mentions that
error checking is performed and that signal 0 can be used to check for process
existence.  Then it says the a process must have perms to send a signal. 
Later, for EPERM, it says that the process doesn't have perms to send the
signal.

But for signal 0, no signal is sent.  What's not 100% clear is that, *even for
signal 0*, a process must have perms (CAP_KILL or matching user ID).  I
misinterpreted it to mean that any process could send signal 0 to any other
process (regardless of user ID), but could not send a non-zero signal to a
process without the appropriate perms.  But this is wrong.  The reason for the
confusion is the word "send/sent" not being used 100% consistently.

Maybe the wording could be enhanced to say "For a process to have permission to
send a signal, including signal 0, it must either be ...".

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
