From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 156231] New: man fcntl isn't clear about how to get
 seal-related constants
Date: Tue, 06 Sep 2016 18:07:08 +0000
Message-ID: <bug-156231-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=156231

            Bug ID: 156231
           Summary: man fcntl isn't clear about how to get seal-related
                    constants
           Product: Documentation
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P1
         Component: man-pages
          Assignee: documentation_man-pages-ztI5WcYan/vQLgFONoPN62D2FQJk+8+b@public.gmane.org
          Reporter: tom+bugzilla.kernel.org-TykxONGntnP10XsdtD+oqA@public.gmane.org
        Regression: No

man fcntl tells you to include unistd.h and fcntl.h - but to get the
seal-related constants, you need (it seems) to include linux/fcntl.h.

The need for _GNU_SOURCE (etc.) for other constants is called out clearly
enough in the CONFORMING TO section. The directions for the seal-related
constants are a bit unclear.

(Perhaps this is just one of those things you're supposed to know, but pages
such as shm_open and 2 stat show that being clear about the headers is not
without precedent...)

Stack Overflow question:
http://stackoverflow.com/questions/39353442/f-seal-seal-undeclared-even-when-headers-are-included

Thanks,

--Tom

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
