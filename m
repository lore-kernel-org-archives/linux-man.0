From: =?utf-8?q?Adeodato=20Sim=C3=B3?= <dato-JJw9D8aLpibbgu9M4EVuLg@public.gmane.org>
Subject: [PATCH] malloc.3: don't write realloc in RETURN VALUE section when it means calloc.
Date: Sun, 28 Dec 2008 12:14:20 +0100
Message-ID: <1230462860-22036-1-git-send-email-dato@net.com.org.es>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?utf-8?q?Adeodato=20Sim=C3=B3?= <dato-JJw9D8aLpibbgu9M4EVuLg@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Signed-off-by: Adeodato Sim=C3=B3 <dato-JJw9D8aLpibbgu9M4EVuLg@public.gmane.org>
---

Common sense tells me this fix is correct, but that's about it. :-)

 man3/malloc.3 |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/man3/malloc.3 b/man3/malloc.3
index 4ba2763..263d022 100644
--- a/man3/malloc.3
+++ b/man3/malloc.3
@@ -133,7 +133,7 @@ with a
 .I size
 of zero,
 or by a successful call to
-.BR realloc ()
+.BR calloc ()
 with
 .I nmemb
 or
--=20
1.6.1.307.g07803

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
