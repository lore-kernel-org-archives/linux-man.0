From: Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
Subject: small improvement for futex.2
Date: Sun, 22 Aug 2010 18:40:47 +0400
Message-ID: <20100822184047.7d233455@keeper.home.local>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="MP_/JoRry3p4+8O.f+fLacHtx_s"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

--MP_/JoRry3p4+8O.f+fLacHtx_s
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello.
futex.2 describe syscall with 6 arguments.

--- man-pages-git/man2/futex.2  2010-07-17 09:02:09.000000000 +0400
+++ /tmp/futex.2        2010-08-22 18:39:05.000000000 +0400
@@ -239,7 +239,7 @@
 Initial futex support was merged in Linux 2.5.7 but with different semantics
 from what was described above.
 A 4-argument system call with the semantics
-given here was introduced in Linux 2.5.40.
+was introduced in Linux 2.5.40.
 In Linux 2.5.70 one argument
 was added.
 In Linux 2.6.7 a sixth argument was added \(em messy, especially

-- 
Best Regards,
Yuri Kozlov


--MP_/JoRry3p4+8O.f+fLacHtx_s
Content-Type: text/x-patch
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=futex.2.patch

--- man-pages-git/man2/futex.2	2010-07-17 09:02:09.000000000 +0400
+++ /tmp/futex.2	2010-08-22 18:39:05.000000000 +0400
@@ -239,7 +239,7 @@
 Initial futex support was merged in Linux 2.5.7 but with different semantics
 from what was described above.
 A 4-argument system call with the semantics
-given here was introduced in Linux 2.5.40.
+was introduced in Linux 2.5.40.
 In Linux 2.5.70 one argument
 was added.
 In Linux 2.6.7 a sixth argument was added \(em messy, especially

--MP_/JoRry3p4+8O.f+fLacHtx_s--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
