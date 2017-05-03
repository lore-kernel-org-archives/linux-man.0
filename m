From: Chema Gonzalez <chema-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH man-pages] tcp.7: tcp_abc was removed in 3.9
Date: Tue,  2 May 2017 18:25:38 -0700
Message-ID: <20170503012538.11867-1-chema@google.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, chemag-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Chema Gonzalez <chema-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

From: Chema Gonzalez <chemag-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Signed-off-by: Chema Gonzalez <chema-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
---
 man7/tcp.7 | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/man7/tcp.7 b/man7/tcp.7
index fe3a30710..38e0d022e 100644
--- a/man7/tcp.7
+++ b/man7/tcp.7
@@ -257,7 +257,9 @@ take an integer value, with a nonzero value ("true") meaning that
 the corresponding option is enabled, and a zero value ("false")
 meaning that the option is disabled.
 .TP
-.IR tcp_abc " (Integer; default: 0; since Linux 2.6.15)"
+.IR tcp_abc " (Integer; default: 0; Linux 2.6.15 to Linux 3.8)"
+.\" Since 2.6.15; removed in 3.8
+.\" commit ca2eb5679f8ddffff60156af42595df44a315ef0
 .\" The following is from 2.6.28-rc4: Documentation/networking/ip-sysctl.txt
 Control the Appropriate Byte Count (ABC), defined in RFC 3465.
 ABC is a way of increasing the congestion window
-- 
2.13.0.rc1.294.g07d810a77f-goog

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
