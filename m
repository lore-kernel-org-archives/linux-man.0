From: =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 3/3] inet_net_pton.3: wfix
Date: Sat,  3 May 2014 21:24:35 -0400
Message-ID: <1399166675-16019-3-git-send-email-taffit@debian.org>
References: <1399166675-16019-1-git-send-email-taffit@debian.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1399166675-16019-1-git-send-email-taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

---
 man3/inet_net_pton.3 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/man3/inet_net_pton.3 b/man3/inet_net_pton.3
index 5017886..ec6a381 100644
--- a/man3/inet_net_pton.3
+++ b/man3/inet_net_pton.3
@@ -93,7 +93,7 @@ On success,
 returns the number of bits in the network number field
 of the result placed in
 .IR netp .
-For a discussion of the input presentation format and the return value,
+For a discussion on the input presentation format and the return value,
 see NOTES.
 
 .IR Note :
@@ -253,7 +253,7 @@ and
 It uses
 .BR inet_net_pton ()
 to convert the presentation format network address provided in
-its first command-line to binary form, displays the return value from
+its first command-line argument to binary form, displays the return value from
 .BR inet_net_pton ().
 It then uses
 .BR inet_net_ntop ()
-- 
2.0.0.rc0

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
