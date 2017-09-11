From: Eugene Syromyatnikov <evgsyr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 3/4] keyrings.7: document description restriction for logon
 keys
Date: Mon, 11 Sep 2017 05:11:12 +0200
Message-ID: <20170911031112.GA5300@asgard.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

"logon" type has additional check that enforces colon-separated prefix in key
descriptions.

* man7/keyrings.7 (.SS Key types) <.TP .IR """logon""">: Document
restriction imposed on logon key descriptions.

Signed-off-by: Eugene Syromyatnikov <evgsyr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 man7/keyrings.7 | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/man7/keyrings.7 b/man7/keyrings.7
index 6f2581c..9a4478e 100644
--- a/man7/keyrings.7
+++ b/man7/keyrings.7
@@ -142,6 +142,11 @@ operation),
 meaning that the key payload is never visible from user space.
 This is suitable for storing username-password pairs
 that should not be readable from user space.
+.IP
+Key description of a logon key must start with non-empty colon-delimited
+prefix with the purpose to identify the service to which it belongs.
+(contrary to keys of the "user" type, where this practice is recommended
+but is not enforced).
 .TP
 .IR """big_key""" " (since Linux 3.13)"
 .\" commit ab3c3587f8cda9083209a61dbe3a4407d3cada10
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
