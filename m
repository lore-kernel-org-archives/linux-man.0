From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 86001] New: Errors in sendfile man page
Date: Fri, 10 Oct 2014 21:38:57 +0000
Message-ID: <bug-86001-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=86001

            Bug ID: 86001
           Summary: Errors in sendfile man page
           Product: Documentation
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P1
         Component: man-pages
          Assignee: documentation_man-pages-ztI5WcYan/vQLgFONoPN62D2FQJk+8+b@public.gmane.org
          Reporter: safinaskar-JGs/UdohzUI@public.gmane.org
        Regression: No

Current "man sendfile" (git commit 36ad6ae0b4b6252a921a91dbd785de8fd88a364b)
from kernel man pages contradicts to itself. The section "DESCRIPTION" says:
"In Linux kernels before 2.6.33, out_fd must refer to a socket. Since Linux
2.6.33 it can be any file", and AFAIK this is right current info. But the
section "NOTES" says: "In Linux 2.4 and earlier, out_fd could also refer to a
regular file" and this confuses. Also, the "NOTES" says: "The Linux-specific
splice(2) call supports transferring data between arbitrary files (e.g., a pair
of sockets)". This is wrong, because one splice call cannot splice together two
sockets. So, please fix the man. Probably you should double-check whole man and
make sure that whole man is up-to-date

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
