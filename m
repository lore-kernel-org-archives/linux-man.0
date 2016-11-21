From: Eugene Syromyatnikov <evgsyr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 4/5] request_key.2: wfix
Date: Tue, 22 Nov 2016 00:00:01 +0300
Message-ID: <20161121210001.GA16802@obsidian>
References: <528b203d-ac72-e4a6-8517-e8c5c11055a4@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <528b203d-ac72-e4a6-8517-e8c5c11055a4-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

---
 man2/request_key.2 | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/man2/request_key.2 b/man2/request_key.2
index 63e8206..1a3af3f 100644
--- a/man2/request_key.2
+++ b/man2/request_key.2
@@ -198,8 +198,7 @@ in the requesting program.
 The payload of the key is taken from the data specified in
 .IR callout_info .
 .IP *
-Internally, the kernel also records a record of the PID of the process
-that called
+Internally, the kernel also records the PID of the process that called
 .BR request_key (2).
 .RE
 .IP c)
-- 
2.10.2

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
