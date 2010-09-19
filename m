From: Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
Subject: small improvement for lookup_dcookie.2
Date: Sun, 19 Sep 2010 22:01:47 +0400
Message-ID: <20100919220147.01103e22@keeper.home.local>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="MP_/e2ljG2JsnaiyBjfpc/2QC9B"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

--MP_/e2ljG2JsnaiyBjfpc/2QC9B
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello.

--- man-pages-git/man2/lookup_dcookie.2 2010-03-26 17:46:41.000000000 +0300
+++ /tmp/lookup_dcookie.2       2010-09-19 22:00:02.000000000 +0400
@@ -31,8 +31,7 @@
 .BI "int lookup_dcookie(u64 " cookie ", char *" buffer ", size_t " len );
 .SH DESCRIPTION
 Look up the full path of the directory entry specified by the value
-.I cookie
-.
+.IR cookie .
 The cookie is an opaque identifier uniquely identifying a particular
 directory entry.
 The buffer given is filled in with the full path of the directory entry.


-- 
Best Regards,
Yuri Kozlov


--MP_/e2ljG2JsnaiyBjfpc/2QC9B
Content-Type: text/x-patch
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=lookup_dcookie.2.patch

--- man-pages-git/man2/lookup_dcookie.2	2010-03-26 17:46:41.000000000 +0300
+++ /tmp/lookup_dcookie.2	2010-09-19 22:00:02.000000000 +0400
@@ -31,8 +31,7 @@
 .BI "int lookup_dcookie(u64 " cookie ", char *" buffer ", size_t " len );
 .SH DESCRIPTION
 Look up the full path of the directory entry specified by the value
-.I cookie
-.
+.IR cookie .
 The cookie is an opaque identifier uniquely identifying a particular
 directory entry.
 The buffer given is filled in with the full path of the directory entry.

--MP_/e2ljG2JsnaiyBjfpc/2QC9B--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
