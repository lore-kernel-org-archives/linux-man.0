From: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Subject: [PATCH 2/2] io_submit.2: tfix
Date: Mon, 20 Nov 2017 23:44:09 +0100
Message-ID: <20171120224409.5568-2-jwilk@jwilk.net>
References: <20171120224409.5568-1-jwilk@jwilk.net>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171120224409.5568-1-jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
---
 man2/io_submit.2 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/man2/io_submit.2 b/man2/io_submit.2
index 25c152d46..397fd0b75 100644
--- a/man2/io_submit.2
+++ b/man2/io_submit.2
@@ -59,13 +59,13 @@ struct iocb {
 The fields of this structure are as follows:
 .TP
 .I aio_data
-This is a internal field used by the kernel.
+This is an internal field used by the kernel.
 Do not modify this field after an
 .BR io_submit (2)
 call.
 .TP
 .I aio_key
-This is a internal field used by the kernel.
+This is an internal field used by the kernel.
 Do not modify this field after an
 .BR io_submit (2)
 call.
-- 
2.15.0

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
