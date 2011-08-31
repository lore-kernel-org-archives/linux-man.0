From: Seonghun Lim <wariua-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [patch] mprotect.2: update example program
Date: Thu, 01 Sep 2011 00:08:27 +0900
Message-ID: <4E5E4E6B.10703@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=EUC-KR
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

man-pages version: latest git repository
why: The description of the example program says that it makes
the third page "read-only". Thus PROT_READ instead of PROT_NONE.


diff --git a/man2/mprotect.2 b/man2/mprotect.2
--- a/man2/mprotect.2
+++ b/man2/mprotect.2
@@ -207,7 +207,7 @@ main(int argc, char *argv[])
printf("Start of region: 0x%lx\\n", (long) buffer);

if (mprotect(buffer + pagesize * 2, pagesize,
- PROT_NONE) == \-1)
+ PROT_READ) == \-1)
handle_error("mprotect");

for (p = buffer ; ; )

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
