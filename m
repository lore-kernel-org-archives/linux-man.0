From: Seonghun Lim <wariua-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [patch] aio.7: tfix
Date: Wed, 8 Nov 2017 16:03:14 +0900
Message-ID: <25ec9874-045e-cb1d-d129-49a1fd0b1f1f@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Language: en-GB
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

 man7/aio.7 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man7/aio.7 b/man7/aio.7
index b32a08589..248c98ec3 100644
--- a/man7/aio.7
+++ b/man7/aio.7
@@ -105,7 +105,7 @@ enum { LIO_READ, LIO_WRITE, LIO_NOP };
 .PP
 The fields of this structure are as follows:
 .TP 16
-.I aio_filedes
+.I aio_fildes
 The file descriptor on which the I/O operation is to be performed.
 .TP
 .I aio_offset
--

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
