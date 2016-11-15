From: Eugene Syromyatnikov <evgsyr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 1/5] add_key.2: tfix
Date: Tue, 15 Nov 2016 11:43:35 +0300
Message-ID: <20161115084335.GA19948@obsidian>
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
 man2/add_key.2 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man2/add_key.2 b/man2/add_key.2
index 0f4d109..1dfbd7d 100644
--- a/man2/add_key.2
+++ b/man2/add_key.2
@@ -35,7 +35,7 @@ of length
 .IR plen ,
 attaches it to the nominated
 .IR keyring ,
-and return the key's serial number.
+and returns the key's serial number.
 .P
 The key type may reject the data if it is in the wrong format or
 is in some other way invalid.
-- 
2.10.2

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
