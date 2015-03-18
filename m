From: =?UTF-8?q?St=C3=A9phane=20Aulery?= <saulery-GANU6spQydw@public.gmane.org>
Subject: [PATCH] aio_return.3: Specifies the return values for errors
Date: Wed, 18 Mar 2015 20:51:13 +0100
Message-ID: <1426708273-9475-1-git-send-email-saulery@free.fr>
References: <5509315A.1040103@ahsoftware.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5509315A.1040103-SXC+2es9fhnfWeYVQQPykw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: holler-SXC+2es9fhnfWeYVQQPykw@public.gmane.org, =?UTF-8?q?St=C3=A9phane=20Aulery?= <saulery-GANU6spQydw@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Reported by Alexander Holler <holler-SXC+2es9fhnfWeYVQQPykw@public.gmane.org>

Signed-off-by: St=C3=A9phane Aulery <saulery-GANU6spQydw@public.gmane.org>
---
 man3/aio_return.3 | 1 +
 1 file changed, 1 insertion(+)

diff --git a/man3/aio_return.3 b/man3/aio_return.3
index 3e6f334..37d735c 100644
--- a/man3/aio_return.3
+++ b/man3/aio_return.3
@@ -55,6 +55,7 @@ the value that would have been returned in case of a =
synchronous
 or
 .BR fdatasync (2),
 call.
+On error, \-1 is returned, and \fIerrno\fP is set appropriately.
=20
 If the asynchronous I/O operation has not yet completed,
 the return value and effect of
--=20
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
