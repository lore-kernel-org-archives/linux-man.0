From: Eugene Syromyatnikov <evgsyr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 5/5] add_key.2: add information regarding EPERM
Date: Tue, 15 Nov 2016 11:44:40 +0300
Message-ID: <20161115084440.GA21255@obsidian>
References: <9a5cc2a7-a505-9d0d-5b78-4bc5ab100ff1@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <9a5cc2a7-a505-9d0d-5b78-4bc5ab100ff1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

---
 man2/add_key.2 | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/man2/add_key.2 b/man2/add_key.2
index 082a2b8..241eb92 100644
--- a/man2/add_key.2
+++ b/man2/add_key.2
@@ -183,6 +183,19 @@ The keyring doesn't exist.
 .TP
 .B ENOMEM
 Insufficient memory to create a key.
+.TP
+.B EPERM
+The
+.I type
+started from dot.
+.TP
+.B EPERM
+.I type
+was
+.I """keyring"""
+and the
+.I description
+started from dot.
 .SH VERSIONS
 This system call first appeared in Linux 2.6.10.
 .SH CONFORMING TO
-- 
2.10.2

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
