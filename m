From: Douglas Caetano dos Santos <douglascs-6ANAkuZINJhwFqzsTH5u/w@public.gmane.org>
Subject: [PATCH] if_nametoindex.3: add possible errno for if_nametoindex()
Date: Tue, 9 May 2017 11:45:17 -0300
Message-ID: <44e09423-9043-26c1-b6e3-7a6eea5be7ff@taghos.com.br>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Language: en-US
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Checked against glibc and kernel code: when given name isn't a valid interface,
kernel returns ENODEV and glibc just forwards it.

Signed-off-by: Douglas Caetano dos Santos <douglascs-6ANAkuZINJhwFqzsTH5u/w@public.gmane.org>
---
 man3/if_nametoindex.3 | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/man3/if_nametoindex.3 b/man3/if_nametoindex.3
index 9689cdbd7..cfe49bc91 100644
--- a/man3/if_nametoindex.3
+++ b/man3/if_nametoindex.3
@@ -67,6 +67,14 @@ on error, NULL is returned and
 .I errno
 is set appropriately.
 .SH ERRORS
+.BR if_nametoindex ()
+may fail and set
+.I errno
+if:
+.TP
+.B ENODEV
+No interface found with given name.
+.PP
 .BR if_indextoname ()
 may fail and set
 .I errno
-- 
2.12.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
