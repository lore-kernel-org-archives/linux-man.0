From: Seonghun Lim <wariua-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [patch] malloc.3: reorder prototypes in SYNOPSIS
Date: Wed, 31 Aug 2011 23:48:13 +0900
Message-ID: <4E5E49AD.8030704@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=EUC-KR
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

man-pages version: latest git repository
why: calloc() comes before realloc() in the other sections, so
should do in SYNOPSIS, too.


diff --git a/man3/malloc.3 b/man3/malloc.3
--- a/man3/malloc.3
+++ b/man3/malloc.3
@@ -34,8 +34,8 @@ malloc, free, calloc, realloc \- Allocate and free
dynamic memory
.sp
.BI "void *malloc(size_t " "size" );
.BI "void free(void " "*ptr" );
-.BI "void *realloc(void " "*ptr" ", size_t " "size" );
.BI "void *calloc(size_t " "nmemb" ", size_t " "size" );
+.BI "void *realloc(void " "*ptr" ", size_t " "size" );
.fi
.SH DESCRIPTION
.PP

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
