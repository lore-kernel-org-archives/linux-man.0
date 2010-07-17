From: Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
Subject: small fix for open.2
Date: Sat, 17 Jul 2010 12:58:48 +0400
Message-ID: <20100717125848.41342e70@keeper.home.local>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="MP_/tIVIJVpwxV3t_peQ8=/pNNM"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

--MP_/tIVIJVpwxV3t_peQ8=/pNNM
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello.

--- man-pages-git/man2/open.2   2010-07-17 09:02:09.000000000 +0400
+++ /tmp/open.2 2010-07-17 12:56:34.000000000 +0400
@@ -679,7 +679,7 @@
 and
 .B O_RSYNC
 to the same numerical value as
-.BR O_SYNC
+.BR O_SYNC .
 Most Linux file systems don't actually implement the POSIX
 .B O_SYNC
 semantics, which require all metadata updates of a write



-- 
Best Regards,
Yuri Kozlov


--MP_/tIVIJVpwxV3t_peQ8=/pNNM
Content-Type: text/x-patch
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=open.2.patch

--- man-pages-git/man2/open.2	2010-07-17 09:02:09.000000000 +0400
+++ /tmp/open.2	2010-07-17 12:56:34.000000000 +0400
@@ -679,7 +679,7 @@
 and
 .B O_RSYNC
 to the same numerical value as
-.BR O_SYNC
+.BR O_SYNC .
 Most Linux file systems don't actually implement the POSIX
 .B O_SYNC
 semantics, which require all metadata updates of a write

--MP_/tIVIJVpwxV3t_peQ8=/pNNM--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
