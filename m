From: Matthew Flaschen <matthew.flaschen-/4noJB3qBVQ3uPMLIKxrzw@public.gmane.org>
Subject: [patch] log2.3: log2 functions do not conform to C89
Date: Sun, 02 May 2010 20:43:15 -0400
Message-ID: <4BDE1C23.2090707@gatech.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Patch against latest git.  log2, log2f, and log2l do not conform to C89.
 They are defined in C99.  See http://flash-gordon.me.uk/ansi.c.txt and
http://www.schweikhardt.net/identifiers.html

-Matthew Flaschen

diff --git a/man3/log2.3 b/man3/log2.3
index 6a86b9a..7505039 100644
--- a/man3/log2.3
+++ b/man3/log2.3
@@ -86,7 +86,7 @@ C99, POSIX.1-2001.
 The variant returning
 .I double
 also conforms to
-SVr4, 4.3BSD, C89.
+SVr4, 4.3BSD.
 .SH "SEE ALSO"
 .BR cbrt (3),
 .BR clog2 (3),
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
