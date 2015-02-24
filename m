From: saulery-GANU6spQydw@public.gmane.org
Subject: [patch] Clarified incompatibility and correct usage of XDR API
Date: Tue, 24 Feb 2015 19:20:07 +0100
Message-ID: <1424802007-14827-1-git-send-email-saulery@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?St=C3=A9phane=20Aulery?= <saulery-GANU6spQydw@public.gmane.org>
List-Id: linux-man@vger.kernel.org

=46rom: St=C3=A9phane Aulery <saulery-GANU6spQydw@public.gmane.org>

Debian Bug #628099
Report and patch of Taisuke Yamada <tai-f4p32tzkXghg9hUCZPvPmw@public.gmane.org>

Signed-off-by: St=C3=A9phane Aulery <saulery-GANU6spQydw@public.gmane.org>
---
 man3/xdr.3 | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/man3/xdr.3 b/man3/xdr.3
index 8f931db..f4bb3e9 100644
--- a/man3/xdr.3
+++ b/man3/xdr.3
@@ -291,9 +291,11 @@ Note: the XDR stream's
 .I op
 field must be set by the caller.
 .IP
-Warning: this XDR stream implements an intermediate record stream.
-Therefore there are additional bytes in the stream
-to provide record boundary information.
+Warning: To read from XDR stream created by this API, you'll need to
+call xdrrec_skiprecord(3) first before calling any other XDR APIs.
+This is because this inserts additional bytes in the stream to provide
+record boundary information. Also, XDR streams created with different
+xdr*_create APIs are not compatible for the same reason.
 .LP
 .nf
 .BI "bool_t xdrrec_endofrecord(XDR *" xdrs ", int " sendnow );
--=20
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
