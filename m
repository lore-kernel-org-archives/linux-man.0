From: Cyrill Gorcunov <gorcunov-GEFAQzZX7r8dnm+yROfE0A@public.gmane.org>
Subject: [RFC 2/2] proc.5: Start describing /proc/fdinfo format
Date: Tue, 16 Jul 2013 01:00:29 +0400
Message-ID: <1373922029-1923-3-git-send-email-gorcunov@openvz.org>
References: <1373922029-1923-1-git-send-email-gorcunov@openvz.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1373922029-1923-1-git-send-email-gorcunov-GEFAQzZX7r8dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Cyrill Gorcunov <gorcunov-GEFAQzZX7r8dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Signed-off-by: Cyrill Gorcunov <gorcunov-GEFAQzZX7r8dnm+yROfE0A@public.gmane.org>
---
 man5/proc.5 | 43 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/man5/proc.5 b/man5/proc.5
index c1e01db..b177bab 100644
--- a/man5/proc.5
+++ b/man5/proc.5
@@ -349,6 +349,49 @@ field is an octal number that displays the
 file access mode and file status flags (see
 .BR open (2)).
 
+The files such as
+.BR eventfd (2),
+.BR signalfd (2),
+.BR epoll (2)
+among regular
+.I pos
+and
+.I flags
+fields pair provide additional information specific to the objects
+they represent (only additional fields are posted here):
+.in +4n
+.nf
+
+.RB "" "eventfd files"
+eventfd-count:	5a
+
+.RB "" "signalfd files"
+sigmask:	0000000000000200
+
+.RB "" "epoll files"
+tfd:        5 events:       1d data: ffffffffffffffff
+
+.fi
+.in
+
+All fields except
+.IR tfd
+are provided in hex format.
+
+Former idea of providing additional data was to give user space applications
+enough information to recreate (or, more precisely, to restore) these objects
+using appropriate library or system calls.
+
+.IR eventfd-count
+and
+.IR sigmask
+represent values of counter and signal mask associated with appropriate files.
+
+.IR tfd,
+.IR events,
+.IR data
+represent file descriptor number, event mask and data associated with epoll file.
+
 The files in this directory are readable only by the owner of the process.
 .\" FIXME document /proc/[pid]/io
 .\" .TP
-- 
1.8.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
