From: Eugene Syromyatnikov <evgsyr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 2/5] requesT_key.2: add information regarding minimal kernel
 version for key instantiation on request
Date: Mon, 21 Nov 2016 23:59:48 +0300
Message-ID: <20161121205948.GA16611@obsidian>
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
 man2/request_key.2 | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/man2/request_key.2 b/man2/request_key.2
index e29ca06..e46dd61 100644
--- a/man2/request_key.2
+++ b/man2/request_key.2
@@ -364,6 +364,8 @@ No matching key was found.
 Insufficient memory to create a key.
 .SH VERSIONS
 This system call first appeared in Linux 2.6.10.
+.\" 3e30148c3d524a9c1c63ca28261bc24c457eb07a
+The ability to instantiate keys upon request has been added in Linux 2.6.13.
 .SH CONFORMING TO
 This system call is a nonstandard Linux extension.
 .SH NOTES
-- 
2.10.2

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
