From: "penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org" <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] sigvec.3: wfix phrasing
Date: Mon, 24 Mar 2014 08:48:50 +0000
Message-ID: <1395650777-11717-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Language: en-US
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/sigvec.3 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/man3/sigvec.3 b/man3/sigvec.3
index 39b39f9..8cc380f 100644
--- a/man3/sigvec.3
+++ b/man3/sigvec.3
@@ -155,7 +155,7 @@ function; the POSIX replacement is
 .PP
 The
 .BR sigmask ()
-function constructs and returns a "signal mask" for
+macro constructs and returns a "signal mask" for
 .IR signum .
 For example, we can initialize the
 .I vec.sv_mask
@@ -211,7 +211,7 @@ functions return the previous signal mask.
 
 The
 .BR sigmask ()
-function returns the signal mask for
+macro returns the signal mask for
 .IR signum .
 .SH ERRORS
 See the ERRORS under
-- 
1.8.5.3
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
