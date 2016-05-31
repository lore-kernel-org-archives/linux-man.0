From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 119351] New: misleading information about buffer size limits in
 tcp(7)
Date: Tue, 31 May 2016 17:49:59 +0000
Message-ID: <bug-119351-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=119351

            Bug ID: 119351
           Summary: misleading information about buffer size limits in
                    tcp(7)
           Product: Documentation
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P1
         Component: man-pages
          Assignee: documentation_man-pages-ztI5WcYan/vQLgFONoPN62D2FQJk+8+b@public.gmane.org
          Reporter: nyh-TS7m/3hpY0sOpacJJkBjfT4kX+cae0hd@public.gmane.org
        Regression: No

The tcp(7) discussion on SO_SNDBUF and SO_RCVBUF contains the statement that:
"The maximum sizes for socket buffers declared  via  the  SO_SNDBUF  and
SO_RCVBUF    mechanisms    are   limited   by   the   values   in   the      
/proc/sys/net/core/rmem_max  and   /proc/sys/net/core/wmem_max   files."

However, other sources seem to suggest that the files
/proc/sys/net/ipv4/tcp_wmem and /proc/sys/net/ipv4/tcp_rmem (mentioned in the
previous paragraph) actually contain the relevant limits (the third value in
each file), while the core/ files are only relevant to other protocols. This is
actually explained in tcp(7), down in the "tcp_rmem" section of the "/proc
interfaces".

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
