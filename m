From: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Subject: [PATCH 0/3] inotify.7, fanotify.7: fallocate triggers no event
Date: Fri,  3 Oct 2014 00:02:33 +0200
Message-ID: <1412287353-5234-1-git-send-email-xypron.glpk@gmx.de>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jan Kara <jack-AlSwsSmVLrQ@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
List-Id: linux-man@vger.kernel.org

the fanotify.7 and inotify.7 manpages do not describe whether fallocate.2 will
create events (FAN_MODIFY, IN_MODIFY).
Looking at fs/open.c no event seems to be created.
I ran a test program and could not detect any FAN_MODIFY event.

Heinrich Schuchardt (3):
  fanotify.7: bugs still not fixed in 3.17
  fanotify.7: fallocate creates no events
  inotify.7: fallocate does not trigger inotify events

 man7/fanotify.7 | 6 +++++-
 man7/inotify.7  | 4 ++++
 2 files changed, 9 insertions(+), 1 deletion(-)

-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
