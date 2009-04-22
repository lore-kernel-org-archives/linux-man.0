From: Lucian Adrian Grijincu <lucian.grijincu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [patch] epoll.7: fix unfinished string in example code
Date: Thu, 23 Apr 2009 00:22:23 +0300
Message-ID: <acf3f2e60904221422l33e37f8bg969c242d6e7dd1a7@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary=0016e64987c0e2d1b204682b5c01
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

--0016e64987c0e2d1b204682b5c01
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

There is an unfinished string =C3=AEn an example =C3=AEn epoll.7
Patch inline and attached.

diff --git a/man7/epoll.7 b/man7/epoll.7
index ba9ec06..ff67371 100644
--- a/man7/epoll.7
+++ b/man7/epoll.7
@@ -263,7 +263,7 @@ for (;;) {
             ev.data.fd =3D conn_sock;
             if (epoll_ctl(epollfd, EPOLL_CTL_ADD, conn_sock,
                         &ev) =3D=3D \-1) {
-                perror("epoll_ctl: conn_sock);
+                perror("epoll_ctl: conn_sock");
                 exit(EXIT_FAILURE);
             }
         } else {


--=20
 .
..: Lucian

--0016e64987c0e2d1b204682b5c01
Content-Type: text/x-patch; charset=US-ASCII; name="epoll.7-string-unfinished.patch"
Content-Disposition: attachment; filename="epoll.7-string-unfinished.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_ftuj58ax0

ZGlmZiAtLWdpdCBhL21hbjcvZXBvbGwuNyBiL21hbjcvZXBvbGwuNwppbmRleCBiYTllYzA2Li5m
ZjY3MzcxIDEwMDY0NAotLS0gYS9tYW43L2Vwb2xsLjcKKysrIGIvbWFuNy9lcG9sbC43CkBAIC0y
NjMsNyArMjYzLDcgQEAgZm9yICg7OykgewogICAgICAgICAgICAgZXYuZGF0YS5mZCA9IGNvbm5f
c29jazsKICAgICAgICAgICAgIGlmIChlcG9sbF9jdGwoZXBvbGxmZCwgRVBPTExfQ1RMX0FERCwg
Y29ubl9zb2NrLAogICAgICAgICAgICAgICAgICAgICAgICAgJmV2KSA9PSBcLTEpIHsKLSAgICAg
ICAgICAgICAgICBwZXJyb3IoImVwb2xsX2N0bDogY29ubl9zb2NrKTsKKyAgICAgICAgICAgICAg
ICBwZXJyb3IoImVwb2xsX2N0bDogY29ubl9zb2NrIik7CiAgICAgICAgICAgICAgICAgZXhpdChF
WElUX0ZBSUxVUkUpOwogICAgICAgICAgICAgfQogICAgICAgICB9IGVsc2Ugewo=
--0016e64987c0e2d1b204682b5c01--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
