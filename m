From: =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 5/5] random.4: ffix
Date: Sun, 23 Sep 2012 16:35:02 -0400
Message-ID: <1348432502-26050-5-git-send-email-taffit@debian.org>
References: <CAKgNAkgKVXfzKqe8qy+ZWSy-ZvhPrM0_sooKM4HG+UTfhbX6BQ@mail.gmail.com>
 <1348432502-26050-1-git-send-email-taffit@debian.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1348432502-26050-1-git-send-email-taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

---
 man4/random.4 |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man4/random.4 b/man4/random.4
index 1d50aa7..ed35fd9 100644
--- a/man4/random.4
+++ b/man4/random.4
@@ -214,6 +214,6 @@ generated once.
 .\" The kernel's random number generator was written by
 .\" Theodore Ts'o (tytso-f/2Lh7Kzk888qNwGfFDJ/Q@public.gmane.org).
 .SH "SEE ALSO"
-mknod (1)
+.BR mknod (1)
 .br
 RFC\ 1750, "Randomness Recommendations for Security"
-- 
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
