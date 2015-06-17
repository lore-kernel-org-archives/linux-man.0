From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 100081] New: sll_family required for bind() on AF_PACKET socket
Date: Wed, 17 Jun 2015 22:34:15 +0000
Message-ID: <bug-100081-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=100081

            Bug ID: 100081
           Summary: sll_family required for bind() on AF_PACKET socket
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

This is from "man 7 packet":
>When you send packets it is enough to specify sll_family, sll_addr, sll_halen, sll_ifindex.  The other fields should be 0. sll_hatype and sll_pkttype are set on received packets for your information. For bind only sll_protocol and sll_ifindex are used.

However, the last sentence is not correct. You have to specifiy sll_family for
bind() too, otherwise it will fail.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
