From: Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
Subject: small improvement for st.4
Date: Sat, 31 Jul 2010 14:49:09 +0400
Message-ID: <20100731144909.528c8104@keeper.home.local>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="MP_/gsZSrJHU.JY0T/MX627vsKR"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

--MP_/gsZSrJHU.JY0T/MX627vsKR
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello.

--- man-pages-git/man4/st.4     2010-03-26 17:46:41.000000000 +0300
+++ /tmp/st.4   2010-07-31 14:48:15.000000000 +0400
@@ -490,6 +490,7 @@
 If this option is false and the drive uses a fixed block size, then
 all write operations must be for a multiple of the block size.
 This option must be set false to write reliable multivolume archives.
+.TP
 .BR MT_ST_ASYNC_WRITES " (Default: true)"
 When this option is true, write operations return immediately without
 waiting for the data to be transferred to the drive if the data fits


-- 
Best Regards,
Yuri Kozlov


--MP_/gsZSrJHU.JY0T/MX627vsKR
Content-Type: text/x-patch
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=st.4.patch

--- man-pages-git/man4/st.4	2010-03-26 17:46:41.000000000 +0300
+++ /tmp/st.4	2010-07-31 14:48:15.000000000 +0400
@@ -490,6 +490,7 @@
 If this option is false and the drive uses a fixed block size, then
 all write operations must be for a multiple of the block size.
 This option must be set false to write reliable multivolume archives.
+.TP
 .BR MT_ST_ASYNC_WRITES " (Default: true)"
 When this option is true, write operations return immediately without
 waiting for the data to be transferred to the drive if the data fits

--MP_/gsZSrJHU.JY0T/MX627vsKR--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
