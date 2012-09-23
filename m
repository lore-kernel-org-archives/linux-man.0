From: =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 3/5] mcheck.3: Remove already fixed FIXMEs
Date: Sun, 23 Sep 2012 16:35:00 -0400
Message-ID: <1348432502-26050-3-git-send-email-taffit@debian.org>
References: <CAKgNAkgKVXfzKqe8qy+ZWSy-ZvhPrM0_sooKM4HG+UTfhbX6BQ@mail.gmail.com>
 <1348432502-26050-1-git-send-email-taffit@debian.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1348432502-26050-1-git-send-email-taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

---
 man3/mcheck.3 |    3 ---
 1 file changed, 3 deletions(-)

diff --git a/man3/mcheck.3 b/man3/mcheck.3
index d54990b..14e9fc2 100644
--- a/man3/mcheck.3
+++ b/man3/mcheck.3
@@ -203,8 +203,5 @@ main(int argc, char *argv[])
 .fi
 .SH SEE ALSO
 .BR malloc (3),
-.\" FIXME add SEE ALSO pointer from malloc(3) to here
-.\" FIXME add SEE ALSO pointer from mallopt(3) to here
-.\" FIXME add SEE ALSO pointer from mtrace(3) to here
 .BR mallopt (3),
 .BR mtrace (3)
-- 
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
