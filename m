From: Seonghun Lim <wariua-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [patch] acct.5: tfix
Date: Wed, 8 Nov 2017 16:01:55 +0900
Message-ID: <22a16847-e77a-eb0a-386e-d0789d446e0b@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Language: en-GB
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

 man5/acct.5 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man5/acct.5 b/man5/acct.5
index c54d40d0d..798eb01d4 100644
--- a/man5/acct.5
+++ b/man5/acct.5
@@ -166,7 +166,7 @@ a single accounting record is written for the entire process
 on termination of the last thread in the process.
 .PP
 The
-.I proc/sys/kernel/acct
+.I /proc/sys/kernel/acct
 file, described in
 .BR proc (5),
 defines settings that control the behavior of process accounting
--

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
