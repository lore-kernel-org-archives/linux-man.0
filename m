From: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Subject: [PATCH 2/2] ldconfig.8: ffix
Date: Fri, 24 Mar 2017 21:00:24 +0100
Message-ID: <20170324200024.1239-2-jwilk@jwilk.net>
References: <20170324200024.1239-1-jwilk@jwilk.net>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170324200024.1239-1-jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Use italics for metavariables.

Signed-off-by: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
---
 man8/ldconfig.8 | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/man8/ldconfig.8 b/man8/ldconfig.8
index c06212ebc..822a885cc 100644
--- a/man8/ldconfig.8
+++ b/man8/ldconfig.8
@@ -118,15 +118,15 @@ or
 .IR compat
 (default).
 .TP
-.B \-C cache
+.BI "\-C " cache
 Use
-.B cache
+.I cache
 instead of
 .IR /etc/ld.so.cache .
 .TP
-.B \-f conf
+.BI "\-f " conf
 Use
-.B conf
+.I conf
 instead of
 .IR /etc/ld.so.conf .
 .\" FIXME glibc 2.7 added -i
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
