From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 91931] New: fflush(3) is misleading about input streams
Date: Fri, 23 Jan 2015 16:15:25 +0000
Message-ID: <bug-91931-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=91931

            Bug ID: 91931
           Summary: fflush(3) is misleading about input streams
           Product: Documentation
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P1
         Component: man-pages
          Assignee: documentation_man-pages-ztI5WcYan/vQLgFONoPN62D2FQJk+8+b@public.gmane.org
          Reporter: cubbi-+Aw+eGX9mmUAvxtiuMwx3w@public.gmane.org
        Regression: No

Current fflush(3) claims that

"For input streams, fflush() discards any buffered data that has been fetched
from the underlying file, but has not been consumed by the application."

While technically true (assuming 'file' implies seekable device), this is
incomplete: flushing an input stream associated with a non-seekable device,
such as the terminal input, does nothing (the update to fp->_IO_read_end at
libio/fileops.c:872 does not happen due to ESPIPE from lseek)

There have been enough confused beginner posts to various internet forums
asking why flushing stdin doesn't work on Linux. I believe it is worth making
the man page more explicit. At the very least, it should begin that sentence
with "For input streams associated with seekable devices", or perhaps it should
mention the unfortunately popular use case fflush(stdin) explicitly.

On a very minor note, fflush(3) also claims that
"The standards do not specify the behavior for input streams"

This is no longer precisely correct; POSIX specifies behavior for seekable
input streams to move fileno's offset to match FILE's offset and undo all
ungetc's: http://pubs.opengroup.org/onlinepubs/9699919799/functions/fflush.html
and glibc conforms to that (or tries to,
https://sourceware.org/bugzilla/show_bug.cgi?id=5994 is still open)

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
