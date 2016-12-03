From: Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH] bpf.2: tfix
Date: Fri, 2 Dec 2016 20:37:29 -0800
Message-ID: <20161203043729.GA118799@beast>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Changed to "will" instead of "with".

Signed-off-by: Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---
 man2/bpf.2 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man2/bpf.2 b/man2/bpf.2
index 645f0e4..5339495 100644
--- a/man2/bpf.2
+++ b/man2/bpf.2
@@ -583,7 +583,7 @@ The kernel takes care of allocating and freeing key/value pairs.
 .IP *
 The
 .BR map_update_elem ()
-helper with fail to insert new element when the
+helper will fail to insert new element when the
 .I max_entries
 limit is reached.
 (This ensures that eBPF programs cannot exhaust memory.)
-- 
2.7.4


-- 
Kees Cook
Nexus Security
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
