From: Michael Welsh Duggan <mwd-etTNj8cnB6w@public.gmane.org>
Subject: poll() doesn't mention negative fds
Date: Mon, 19 Dec 2011 14:57:08 -0500
Message-ID: <tntobv4qqqz.fsf@waterbuck.yellow.cert.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "mtk.manpages@gmail.com" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

According to the Open Group, my copy of UNIX Network Programing by
Stevens, my copy of APUE, and select.c from Linux's source code, pollfd
items with a negative fd are ignored by poll(), and the revents member
is guaranteed to be zero for those items.  This does not appear to be
mentioned in the manual page, and likely should be.

-- 
Michael Welsh Duggan
(mwd-etTNj8cnB6w@public.gmane.org)
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
