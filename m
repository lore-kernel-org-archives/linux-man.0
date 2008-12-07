From: Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org>
Subject: [PATCH] printf.3: Add a note about sprintf(s, "%s", s)
Date: Mon, 8 Dec 2008 00:37:21 +0100
Message-ID: <20081207233721.GN10491@machine.or.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The result of this operation is undefined as specified in C99, see

	http://sourceware.org/bugzilla/show_bug.cgi?id=7075

Signed-off-by: Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org>

diff --git a/man3/printf.3 b/man3/printf.3
index b2ed86a..f8377a7 100644
--- a/man3/printf.3
+++ b/man3/printf.3
@@ -750,6 +750,9 @@ or
 The array must contain a terminating null wide character, unless a
 precision is given and it is so small that the number of bytes written
 exceeds it before the end of the array is reached.
+
+If the source array and the target buffer of the function overlap,
+results are undefined.
 .TP
 .B C
 (Not in C99, but in SUSv2.)
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
