From: Denis Barbier <bouzim-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [patch] Trivial patch in man3/pthread_sigqueue.3
Date: Sat, 27 Nov 2010 11:01:52 +0100
Message-ID: <AANLkTi=bXMmNmHceP=VXrQAeuFH2pwnK0mL8gE0-QsNm@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello, here it is

Denis

diff --git a/man3/pthread_sigqueue.3 b/man3/pthread_sigqueue.3
index ebf995d..c4faa40 100644
--- a/man3/pthread_sigqueue.3
+++ b/man3/pthread_sigqueue.3
@@ -99,4 +99,4 @@ This function is a GNU extension.
 .BR sigwait (2),
 .BR pthread_sigmask (3),
 .BR pthreads (7),
-.br SIGNAL (7)
+.BR signal (7)
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
