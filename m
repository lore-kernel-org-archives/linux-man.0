From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 55371] printf: a conversion specifier doesn't necessarily ask
 for an argument
Date: Sat, 16 Nov 2013 22:53:51 +0000
Message-ID: <bug-55371-11311-YRdDsxlb1Q@https.bugzilla.kernel.org/>
References: <bug-55371-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <bug-55371-11311-3bo0kxnWaOQUvHkbgXJLS5sdmw4N0Rt+2LY78lusg7I@public.gmane.org/>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=55371

Filipus Klutiero <chealer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|CLOSED                      |REOPENED
         Resolution|INVALID                     |---

--- Comment #2 from Filipus Klutiero <chealer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
printf() is provided by the C library. This report is about printf's manual
page, shipped in man-pages. man-pages is hosted on kernel.org (
https://www.kernel.org/doc/man-pages/reporting_bugs.html ).

This persists in man-pages 3.54.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
