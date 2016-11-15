From: Eugene Syromyatnikov <evgsyr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 4/5] add_key.2: add information regarding EFAULT
Date: Tue, 15 Nov 2016 11:44:30 +0300
Message-ID: <20161115084430.GA20968@obsidian>
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
 man2/add_key.2 | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/man2/add_key.2 b/man2/add_key.2
index 78b1b99..082a2b8 100644
--- a/man2/add_key.2
+++ b/man2/add_key.2
@@ -148,6 +148,11 @@ The keyring wasn't available for modification by the user.
 The key quota for this user would be exceeded by creating this key or linking
 it to the keyring.
 .TP
+.B EFAULT
+(Part of)
+.IR type ", " description " or " payload
+points outside process' accessible address space.
+.TP
 .B EINVAL
 The size of the string (including the terminating null byte) specified in
 .I type
-- 
2.10.2

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
