From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 53061] New: pthread_kill() should describe it may cause SEGV
 when target thread doesn't exist
Date: Sat, 26 Jan 2013 01:38:55 +0000 (UTC)
Message-ID: <bug-53061-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=53061

           Summary: pthread_kill() should describe it may cause SEGV when
                    target thread doesn't exist
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
        ReportedBy: kosaki.motohiro-+CUm20s59erQFUHtdCDX3A@public.gmane.org
        Regression: No


Now, pthrad_kill() man page have following explanation.

http://man7.org/linux/man-pages/man3/pthread_kill.3.html

>ERRORS         
>
>       EINVAL An invalid signal was specified.
>
>       ESRCH  No thread with the ID thread could be found.


But it is misleading. Current implementation cause SEGV when no thread ID exist
highly likely.

As suggested Rich on libc-alpha
(http://permalink.gmane.org/gmane.comp.lib.glibc.alpha/28919). 
it would be nice if the man page point to following POSIX sentence.


POSIX XSH 2.9.2:

"The lifetime of a thread ID ends after the thread terminates if it
was created with the detachstate attribute set to
PTHREAD_CREATE_DETACHED or if pthread_detach() or pthread_join() has
been called for that thread. A conforming implementation is free to
reuse a thread ID after its lifetime has ended. If an application
attempts to use a thread ID whose lifetime has ended, the behavior is
undefined."

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
