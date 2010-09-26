From: Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
Subject: small typo in rand.3 ?
Date: Sun, 26 Sep 2010 17:32:56 +0400
Message-ID: <20100926173256.69b0440e@keeper.home.local>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="MP_/_g9qAuxyALQSa55TUK6KXA5"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

--MP_/_g9qAuxyALQSa55TUK6KXA5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Content-Disposition: inline

Hello.

--- man-pages-git/man3/rand.3   2010-09-26 17:14:11.000000000 +0400
+++ /tmp/rand.3 2010-09-26 17:27:12.000000000 +0400
@@ -34,7 +34,7 @@
 .\" Modified 1998-04-10, Nicol�s Lichtmaier <nick-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
 .\"          with contribution from Francesco Potorti <F.Potorti-Z3/l7hFotWqRIi+8W+d3eg@public.gmane.org>
 .\" Modified 2003-11-15, aeb, added rand_r
-.\| 2010-09-13, mtk, added example program
+.\" 2010-09-13, mtk, added example program
 .\"
 .TH RAND 3 2010-09-13 "" "Linux Programmer's Manual"
 .SH NAME

-- 
Best Regards,
Yuri Kozlov


--MP_/_g9qAuxyALQSa55TUK6KXA5
Content-Type: text/x-patch
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment; filename=rand.3.patch

--- man-pages-git/man3/rand.3	2010-09-26 17:14:11.000000000 +0400
+++ /tmp/rand.3	2010-09-26 17:27:12.000000000 +0400
@@ -34,7 +34,7 @@
 .\" Modified 1998-04-10, Nicol=E1s Lichtmaier <nick-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
 .\"          with contribution from Francesco Potorti <F.Potorti-Z3/l7hFotWpQFI55V6+gNQ@public.gmane.org=
.it>
 .\" Modified 2003-11-15, aeb, added rand_r
-.\| 2010-09-13, mtk, added example program
+.\" 2010-09-13, mtk, added example program
 .\"
 .TH RAND 3 2010-09-13 "" "Linux Programmer's Manual"
 .SH NAME

--MP_/_g9qAuxyALQSa55TUK6KXA5--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
