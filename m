From: =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 1/2] netdevice.7: ffix
Date: Sat,  1 Feb 2014 18:37:36 -0400
Message-ID: <1391294257-25320-1-git-send-email-taffit@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Michael,

I=E2=80=99m not totally sure for this one, but it seems to fit the usua=
l usage,
even if man-pages(7) =E2=80=94=C2=A0Font conventions=C2=A0=E2=80=94 sug=
gests to rather use
something like:

	.BI "sizeof(struct " ifreq )

Regards

David
---
 man7/netdevice.7 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/man7/netdevice.7 b/man7/netdevice.7
index ff2ac82..c1cb8a2 100644
--- a/man7/netdevice.7
+++ b/man7/netdevice.7
@@ -309,8 +309,8 @@ with
 .I ifc_req
 set to NULL, or to retry the call with a bigger buffer whenever
 .I ifc_len
-upon return differs by less than sizeof(struct
-.IR ifreq )
+upon return differs by less than
+.I sizeof(struct ifreq)
 from its original value.
=20
 If an error occurs accessing the
--=20
1.9.rc1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
