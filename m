From: Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
Subject: small improvement for migrate_pages.2
Date: Tue, 19 Oct 2010 14:21:34 +0400
Message-ID: <20101019142134.4742bc00@keeper.home.local>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="MP_/8TuacSbL1=iwxR_WCnNdaso"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

--MP_/8TuacSbL1=iwxR_WCnNdaso
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello.
--- man-pages-git/man2/migrate_pages.2  2010-07-17 09:02:09.000000000 +0400
+++ /tmp/migrate_pages.2        2010-10-19 13:36:07.000000000 +0400
@@ -34,7 +34,7 @@
 that are in memory nodes
 .I old_nodes
 to the memory nodes in
-.I new_nodes.
+.IR new_nodes .
 Pages not located in any node in
 .I old_nodes
 will not be migrated.
@@ -64,7 +64,7 @@
 as in
 .BR mbind (2),
 but different from
-.BR select (2))
+.BR select (2)).
 
 The
 .I pid

-- 
Best Regards,
Yuri Kozlov


--MP_/8TuacSbL1=iwxR_WCnNdaso
Content-Type: text/x-patch
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=migrate_pages.2.patch

--- man-pages-git/man2/migrate_pages.2	2010-07-17 09:02:09.000000000 +0400
+++ /tmp/migrate_pages.2	2010-10-19 13:36:07.000000000 +0400
@@ -34,7 +34,7 @@
 that are in memory nodes
 .I old_nodes
 to the memory nodes in
-.I new_nodes.
+.IR new_nodes .
 Pages not located in any node in
 .I old_nodes
 will not be migrated.
@@ -64,7 +64,7 @@
 as in
 .BR mbind (2),
 but different from
-.BR select (2))
+.BR select (2)).
 
 The
 .I pid

--MP_/8TuacSbL1=iwxR_WCnNdaso--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
