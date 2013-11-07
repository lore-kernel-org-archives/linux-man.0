From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 64571] New: msg_len of mq_receive()
Date: Thu, 07 Nov 2013 16:01:17 +0000
Message-ID: <bug-64571-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=64571

            Bug ID: 64571
           Summary: msg_len of mq_receive()
           Product: Documentation
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P1
         Component: man-pages
          Assignee: documentation_man-pages-ztI5WcYan/vQLgFONoPN62D2FQJk+8+b@public.gmane.org
          Reporter: a0vhv-zqRNUXuvxA0b1SvskN2V4Q@public.gmane.org
        Regression: No

In the DESCRIPTION section of the manpage of "man 3 mq_receive", it says: "The
msg_len argument specifies the size of the buffer pointed to by msg_ptr; this
must be greater than the mq_msgsize attribute of the queue (see
mq_getattr(3))."
Further down, in the ERROR section, it says: "EMSGSIZE    msg_len was less than
the mq_msgsize attribute of the message queue."

I think the description should say "this must be *greater or equal* than the
mq_msgsize attribute", because currently it says "this must be *greater* than
the mq_msgsize attribute", but according to the ERROR section it would only be
an error if "msg_len was less than the mq_msgsize attribute".

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
