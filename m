From: saulery-GANU6spQydw@public.gmane.org
Subject: [PATCH 1/3] resolv.conf.5: document use-vc option added to glibc 2.14
Date: Wed, 22 Apr 2015 02:21:09 +0200
Message-ID: <1429662071-23797-1-git-send-email-saulery@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, saulery-GANU6spQydw@public.gmane.org
List-Id: linux-man@vger.kernel.org

=46rom: St=C3=A9phane Aulery <saulery-GANU6spQydw@public.gmane.org>

=46ix Ubuntu bug #1110781:
https://bugs.launchpad.net/ubuntu/+source/manpages/+bug/1110781

Reported-by: Thomas Hood
Signed-off-by: St=C3=A9phane Aulery <saulery-GANU6spQydw@public.gmane.org>
---
 man5/resolv.conf.5 | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/man5/resolv.conf.5 b/man5/resolv.conf.5
index f5c8cad..7b6804a 100644
--- a/man5/resolv.conf.5
+++ b/man5/resolv.conf.5
@@ -272,6 +272,13 @@ as if it were a top level domain (TLD).
 This option can cause problems if the site has ``localhost'' as a TLD
 rather than having localhost on one or more elements of the search lis=
t.
 This option has no effect if neither RES_DEFNAMES or RES_DNSRCH is set=
=2E
+.TP
+.BR use-vc " (since glibc 2.14)"
+sets
+.BR RES_USEVC
+in
+.IR _res.options .
+This option forces the usage of TCP for DNS resolutions.
 .RE
 .LP
 The \fIdomain\fP and \fIsearch\fP keywords are mutually exclusive.
--=20
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
