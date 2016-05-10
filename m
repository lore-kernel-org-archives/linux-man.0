From: elie-Sg7ocfseCdfsq35pWSNszA@public.gmane.org
Subject: [PATCH] getaddrinfo_a.3: tfix
Date: Tue, 10 May 2016 16:28:07 +0200
Message-ID: <1462890487-19482-1-git-send-email-elie@bouttier.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?=C3=89lie=20Bouttier?= <elie-Sg7ocfseCdfsq35pWSNszA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

=46rom: =C3=89lie Bouttier <elie-Sg7ocfseCdfsq35pWSNszA@public.gmane.org>

EAI_CANCELED and EAI_NOTCANCELED are defined without double L in resolv=
/netdb.h from glibc.
See https://sourceware.org/git/?p=3Dglibc.git;a=3Dblob;f=3Dresolv/netdb=
=2Eh;h=3D3aba530932c7a62a4f23e3193e9186da677f552b;hb=3DHEAD#l632
---
 man3/getaddrinfo_a.3 | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/man3/getaddrinfo_a.3 b/man3/getaddrinfo_a.3
index ba7fab5..d8ca129 100644
--- a/man3/getaddrinfo_a.3
+++ b/man3/getaddrinfo_a.3
@@ -229,7 +229,7 @@ function cancels the request
 .IR req .
 If the request has been canceled successfully,
 the error status of the request will be set to
-.B EAI_CANCELLED
+.B EAI_CANCELED
 and normal asynchronous notification will be performed.
 The request cannot be canceled if it is currently being processed;
 in that case, it will be handled as if
@@ -282,17 +282,17 @@ for an unfinished look-up request,
 (as described above), one of the error codes that could be returned by
 .BR getaddrinfo (3),
 or the error code
-.B EAI_CANCELLED
+.B EAI_CANCELED
 if the request has been canceled explicitly before it could be finishe=
d.
=20
 The
 .BR gai_cancel ()
 function can return one of these values:
 .TP
-.B EAI_CANCELLED
+.B EAI_CANCELED
 The request has been canceled successfully.
 .TP
-.B EAI_NOTCANCELLED
+.B EAI_NOTCANCELED
 The request has not been canceled.
 .TP
 .B EAI_ALLDONE
--=20
2.8.2
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
