From: Tobias Stoeckmann <tobias-te0W2B6tFQkGQOE+iOL5gA@public.gmane.org>
Subject: [patch] getauxval.3: tfix
Date: Wed, 15 Jun 2016 22:19:22 +0200
Message-ID: <20160615201922.GA2370@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Fix typo. It's supposed to be "its" not "it's" in this context.

Signed-off-by: Tobias Stoeckmann <tobias-te0W2B6tFQkGQOE+iOL5gA@public.gmane.org>
---
 man3/getauxval.3 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man3/getauxval.3 b/man3/getauxval.3
index fe2b0b8..85d7f41 100644
--- a/man3/getauxval.3
+++ b/man3/getauxval.3
@@ -149,7 +149,7 @@ The address of sixteen bytes containing a random value.
 Has a nonzero value if this executable should be treated securely.
 Most commonly, a nonzero value indicates that the process is
 executing a set-user-ID or set-group-ID binary
-(so that it's real and effective UIDs or GIDs differ from one another),
+(so that its real and effective UIDs or GIDs differ from one another),
 or that it gained capabilities by executing
 a binary file that has capabilities (see
 .BR capabilities (7)).
-- 
2.8.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
