From: Andi Kleen <andi-Vw/NltI1exuRpAAqCnN02g@public.gmane.org>
Subject: [PATCH] MAN: Clarify mremap.2 prototype
Date: Thu, 3 Jun 2010 11:08:18 +0200
Message-ID: <20100603090818.GA4741@basil.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, ak-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
List-Id: linux-man@vger.kernel.org

MAN: Clarify mremap.2 prototype

mremap sometimes accepts more arguments and sometimes less.
Clarify this in the prototype and initial description in the manpage.

Signed-off-by: Andi Kleen <ak-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>

---
 man2/mremap.2 |    8 ++++++++
 1 file changed, 8 insertions(+)

Index: man-pages-3.24/man2/mremap.2
===================================================================
--- man-pages-3.24.orig/man2/mremap.2
+++ man-pages-3.24/man2/mremap.2
@@ -39,6 +39,9 @@ mremap \- remap a virtual memory address
 .sp
 .BI "void *mremap(void *" old_address ", size_t " old_size ,
 .BI "             size_t " new_size ", int " flags );
+.sp
+.BI "void *mremap(void *" old_address ", size_t " old_size ,
+.BI "             size_t " new_size ", int " flags ", void *" new_address );
 .fi
 .SH DESCRIPTION
 .BR mremap ()
@@ -54,6 +57,11 @@ aligned.
 virtual memory block.
 \fInew_size\fP is the requested size of the
 virtual memory block after the resize.
+\fInew_address\fP is the new address to move the block to. Only valid when
+.I MREMAP_FIXED
+and
+.I MREMAP_MAYMOVE
+are specified. The function is declared in a way that this argument can be omitted.
 
 In Linux the memory is divided into pages.
 A user process has (one or)
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
