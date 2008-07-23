From: =?ISO-8859-1?Q?Mark-Andr=E9_Hopf?= <mhopf-0qgFeOjsUbEdnm+yROfE0A@public.gmane.org>
Subject: memmove.3 description error
Date: Wed, 23 Jul 2008 12:58:34 +0200
Message-ID: <48870EDA.8040908@mark13.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The memmove page in release 2.79 states that a temporary copy is used in
case the memory regions overlap. This is of course nonsense.
The memory is either copied from front to back or from back to front.

--- memmove.3.orig      2008-07-23 12:51:56.000000000 +0200
+++ memmove.3   2008-07-23 12:53:20.000000000 +0200
@@ -39,15 +39,7 @@
  .BR memmove ()
  function copies \fIn\fP bytes from memory area
  \fIsrc\fP to memory area \fIdest\fP.
-The memory areas may overlap: copying takes place as though
-the bytes in
-.I src
-are first copied into a temporary array that does not overlap
-.I src
-or
-.IR dest ,
-and the bytes are then copied from the temporary array to
-.IR dest .
+The memory areas may overlap.
  .SH "RETURN VALUE"
  The
  .BR memmove ()
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
