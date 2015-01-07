From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 90911] New: About splice returning 0
Date: Wed, 07 Jan 2015 20:17:42 +0000
Message-ID: <bug-90911-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=90911

            Bug ID: 90911
           Summary: About splice returning 0
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

"man 2 splice" at Linux man-pages 2012-05-04 says:
"A return value of 0 means that there was no data to transfer, and it would not
make sense to block, because there are no writers connected to the write end of
the pipe referred to by fd_in."

This is very hard-to-understand sentence, so, please rewrite it somehow.

First of all, this is not clear from this sentence that it speaks about reading
from pipe and not about writing. (At first I wrongly decided from this sentence
that it speaks about writing to broken pipe without readers [despite of word
"writers"]).

So, at least, please write so:
"If we read from pipe, then a return value of 0 means that there was no data to
transfer, and it would not make sense to block, because there are no writers
connected to the write end of the pipe referred to by fd_in."

Then, the actual truth is the following: splice returns 0 if and only if
corresponding read would return 0, i. e. on EOF on input (and reading from pipe
without writers is just a special case of EOF). And the sentence doesn't say
anything about reading from files other that pipes. So, please, rewrite so:
"A return value of 0 means end of input. If input is pipe then this means that
there was no data to transfer, and it would not make sense to block, because
there are no writers connected to the write end of the pipe referred to by
fd_in."

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
