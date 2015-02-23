From: wfp5p-rupya+Y+cgAvmQRmTv5wTA@public.gmane.org
Subject: [PATCH 4/4] rpc.3: tfix
Date: Mon, 23 Feb 2015 13:54:17 -0500
Message-ID: <1424717657-9580-5-git-send-email-wfp5p@worldbroken.com>
References: <1424717657-9580-1-git-send-email-wfp5p@worldbroken.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1424717657-9580-1-git-send-email-wfp5p-rupya+Y+cgAvmQRmTv5wTA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

From: Bill Pemberton <wfp5p-rupya+Y+cgAvmQRmTv5wTA@public.gmane.org>

Signed-off-by: Bill Pemberton <wfp5p-rupya+Y+cgAvmQRmTv5wTA@public.gmane.org>
---
 man3/rpc.3 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man3/rpc.3 b/man3/rpc.3
index b89c71db1b6d..10fd669cc0fa 100644
--- a/man3/rpc.3
+++ b/man3/rpc.3
@@ -376,7 +376,7 @@ is to be used.
 Note: unlike
 .BR clnt_sperror ()
 and
-.BR clnt_spcreaterror (),
+.BR clnt_spcreateerror (),
 .BR clnt_sperrno ()
 returns pointer to static data, but the
 result will not get overwritten on each call.
-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
