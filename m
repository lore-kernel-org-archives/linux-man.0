From: Andi Kleen <andi-Vw/NltI1exuRpAAqCnN02g@public.gmane.org>
Subject: [PATCH] [3/4] Clarify includes/libraries in move_pages page
Date: Sat, 20 Mar 2010 16:29:30 +0100 (CET)
Message-ID: <20100320152930.15367B19E8@basil.firstfloor.org>
References: <20100320429.026463287@firstfloor.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20100320429.026463287-Vw/NltI1exuRpAAqCnN02g@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


Signed-off-by: Andi Kleen <ak-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>

Index: man-pages-3.24/man2/move_pages.2
===================================================================
--- man-pages-3.24.orig/man2/move_pages.2
+++ man-pages-3.24/man2/move_pages.2
@@ -25,6 +25,8 @@ move_pages \- move individual pages of a
 .BI "long move_pages(int " pid ", unsigned long count, void **" pages ,
 .BI "                const int *" nodes ", int *" status ", int " flags );
 .fi
+.sp
+Link with \fI\-lnuma\fP.
 .SH DESCRIPTION
 .BR move_pages ()
 moves the specified
@@ -214,6 +216,12 @@ and/or the specified process [See
 That is, memory policy does not constrain the destination
 nodes used by
 .BR move_pages ().
+
+The
+.I numaif.h
+header is not included with glibc, but requires installing
+.I libnuma-devel
+or a similar package.
 .SH "SEE ALSO"
 .BR get_mempolicy (2),
 .BR mbind (2),
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
