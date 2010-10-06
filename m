From: Ivana Hutarova Varekova <varekova-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: gai_{error,suspend,cancel}.3 man-pages typo
Date: Wed, 06 Oct 2010 17:03:18 +0200
Message-ID: <4CAC8FB6.8010907@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------000107010602050100080009"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

This is a multi-part message in MIME format.
--------------000107010602050100080009
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello,
there is a small typo in gai_{error,suspend,cancel}.3 man-pages (Btw I'm 
not sure whether it is intentional, but these man-pages are identical 
copies. Iḿ not sure why there is not used link.). There is used ".ID" 
instead of ".IR" in all these pages in one place.
The patch is attached.
Have a nice day.
Ivana Hutarova Varekova


--------------000107010602050100080009
Content-Type: text/x-patch;
 name="man-pages-3.28-typo.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="man-pages-3.28-typo.patch"

diff -up man-pages-3.28/man3/gai_cancel.3.pom man-pages-3.28/man3/gai_cancel.3
--- man-pages-3.28/man3/gai_cancel.3.pom	2010-10-04 05:04:35.000000000 +0200
+++ man-pages-3.28/man3/gai_cancel.3	2010-10-06 16:31:24.000000000 +0200
@@ -180,7 +180,7 @@ The
 .BR gai_suspend ()
 function suspends execution of the calling thread,
 waiting for the completion of one or more requests in the array
-.ID list .
+.IR list .
 The
 .I nitems
 argument specifies the size of the array
diff -up man-pages-3.28/man3/gai_error.3.pom man-pages-3.28/man3/gai_error.3
--- man-pages-3.28/man3/gai_error.3.pom	2010-10-04 05:04:35.000000000 +0200
+++ man-pages-3.28/man3/gai_error.3	2010-10-06 16:35:57.000000000 +0200
@@ -180,7 +180,7 @@ The
 .BR gai_suspend ()
 function suspends execution of the calling thread,
 waiting for the completion of one or more requests in the array
-.ID list .
+.IR list .
 The
 .I nitems
 argument specifies the size of the array
diff -up man-pages-3.28/man3/gai_suspend.3.pom man-pages-3.28/man3/gai_suspend.3
--- man-pages-3.28/man3/gai_suspend.3.pom	2010-10-04 05:04:35.000000000 +0200
+++ man-pages-3.28/man3/gai_suspend.3	2010-10-06 16:33:01.000000000 +0200
@@ -180,7 +180,7 @@ The
 .BR gai_suspend ()
 function suspends execution of the calling thread,
 waiting for the completion of one or more requests in the array
-.ID list .
+.IR list .
 The
 .I nitems
 argument specifies the size of the array

--------------000107010602050100080009--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
