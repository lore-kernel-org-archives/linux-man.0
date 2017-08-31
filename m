From: Eugene Syromyatnikov <evgsyr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [RFC PATCH 3/5] keyrings.7: add pointers to kernel's documentation
Date: Thu, 31 Aug 2017 17:58:32 +0200
Message-ID: <20170831155832.GA5165@asgard.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, David Howells <dhowells-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Mat Martineau <mathew.j.martineau-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Stephan Mueller <smueller-T9tCv8IpfcWELgA04lAiVw@public.gmane.org>, keyrings-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Mostly because of assymmetric-keys.txt, which is outside security/keys
for some reason.
---
 man7/keyrings.7 | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/man7/keyrings.7 b/man7/keyrings.7
index ba980da..0cb1190 100644
--- a/man7/keyrings.7
+++ b/man7/keyrings.7
@@ -866,3 +866,8 @@ scripts can use them.
 .BR user\-session\-keyring (7),
 .BR pam_keyinit (8),
 .BR request-key (8)
+.PP
+The kernel source files
+.IR Documentation/crypto/asymmetric-keys.txt
+and under
+.IR Documentation/security/keys .
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
