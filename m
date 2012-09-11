From: Todd Lewis <utoddl-vEoVa6Jh+/J4piUD7e9S/g@public.gmane.org>
Subject: [patch] resolv.conf.5 add "single-request-reopen" option
Date: Tue, 11 Sep 2012 14:35:52 -0400
Message-ID: <504F8488.6030900@email.unc.edu>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------080607070602020809040304"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

This is a multi-part message in MIME format.
--------------080607070602020809040304
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

The attached "diff -u" formatted patch applies to
http://git.kernel.org/?p=docs/man-pages/man-pages.git;a=blob_plain;f=man5/resolv.conf.5;hb=HEAD
as it existed on 2012-09-11--14:31.

It adds documentation for the "single-request-reopen" option. This
information was found in the changelog notes
(http://sourceware.org/ml/libc-alpha/2009-10/msg00063.html) from Ulrich
Drepper. The issue and solution were both brought to my attention by a
discussion on our internal mailing list which mentioned this undocumented
feature. Several users indicated they have been suffering from slow DNS
resolutions on machines behind certain firewalls and that this solved
their problems. Seems like others would like to know about it.
-- 
   +--------------------------------------------------------------+
  / Todd_Lewis-gpQNmkgQrW4@public.gmane.org  919-445-0091  http://www.unc.edu/~utoddl /
 /               Honk if you love peace and quiet.              /
+--------------------------------------------------------------+

--------------080607070602020809040304
Content-Type: text/x-patch;
 name="resolv.conf-single-request-reopen.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="resolv.conf-single-request-reopen.patch"

--- /tmp/man5_resolv.conf.5-orig	2012-09-11 14:25:26.406461617 -0400
+++ /tmp/man5_resolv.conf.5	2012-09-11 14:29:16.972540431 -0400
@@ -168,6 +168,12 @@
 (currently 2, see \fI<resolv.h>\fP).
 The value for this option is silently capped to 5.
 .TP
+.BR single-request-reopen " (since glibc 2.11)"
+closes the socket and opens a new one before sending a second DNS lookup
+if the first one is not handled correctly. This greatly speeds up lookups
+in broken DNS environments that would otherwise await timeouts before
+rediscovering the need to reset connections in every process. 
+.TP
 .B rotate
 .\" Since glibc 2.2
 sets

--------------080607070602020809040304--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
