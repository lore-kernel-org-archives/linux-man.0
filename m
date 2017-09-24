From: Oliver Ebert <oe-h0GdYU6q0jndfRFfCFeH3g@public.gmane.org>
Subject: [PATCH 3/4] proc.5: Add mmap-exclusive bit for /proc/[pid]/pagemap
Date: Sun, 24 Sep 2017 23:41:37 +0200
Message-ID: <20170924214138.4852-4-oe@outputenable.net>
References: <20170924214138.4852-1-oe@outputenable.net>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170924214138.4852-1-oe-h0GdYU6q0jndfRFfCFeH3g@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Oliver Ebert <oe-h0GdYU6q0jndfRFfCFeH3g@public.gmane.org>
List-Id: linux-man@vger.kernel.org

see linux 77bb499bb60f4b79cca7d139c8041662860fcf87
and linux 83b4b0bb635eee2b8e075062e4e008d1bc110ed7
---
 man5/proc.5 | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/man5/proc.5 b/man5/proc.5
index f0b84d503..0b31dad2f 100644
--- a/man5/proc.5
+++ b/man5/proc.5
@@ -1490,10 +1490,13 @@ If set, the page is in swap space
 61 (since Linux 3.5)
 The page is a file-mapped page or a shared anonymous page.
 .TP
-60\(en56 (since Linux 3.11)
+60\(en57 (since Linux 3.11)
 Zero
 .\" Not quite true; see commit 541c237c0923f567c9c4cabb8a81635baadc713f
 .TP
+56 (since Linux 4.2)
+The page is exclusively mapped.
+.TP
 55 (since Linux 3.11)
 PTE is soft-dirty
 (see the kernel source file
-- 
2.13.5

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
