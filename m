From: Seonghun Lim <wariua-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [patch] random_r.3: wfix
Date: Wed, 8 Nov 2017 16:13:57 +0900
Message-ID: <a43524f9-1e1e-11cb-c12b-46d387606919@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Language: en-GB
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

buf.state is a field of struct random_data - not a file.

---

man3/random_r.3 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man3/random_r.3 b/man3/random_r.3
index d3561aa0d..1406cf0e8 100644
--- a/man3/random_r.3
+++ b/man3/random_r.3
@@ -185,7 +185,7 @@ It appears that the
 type is intended to be opaque,
 but the implementation requires the user to either initialize the
 .I buf.state
-file to NULL or zero out the entire structure before the call.
+field to NULL or zero out the entire structure before the call.
 .SH SEE ALSO
 .BR drand48 (3),
 .BR rand (3),
-- 

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
