From: Eugene Syromyatnikov <evgsyr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH draft_keys 6/7] keyrings.7: tfix
Date: Fri, 25 Nov 2016 04:01:25 +0300
Message-ID: <20161125010125.GA784@obsidian>
References: <51643019-bb42-4066-c824-c55b9e668ac6@man7.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <51643019-bb42-4066-c824-c55b9e668ac6-ASgREoAs3yw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

---
 man7/keyrings.7 | 2 --
 1 file changed, 2 deletions(-)

diff --git a/man7/keyrings.7 b/man7/keyrings.7
index 2da882c..9dac4db 100644
--- a/man7/keyrings.7
+++ b/man7/keyrings.7
@@ -588,8 +588,6 @@ The key type (user, keyring, etc.)
 .TP
 Description
 The key description (name).
-.TP
-Description
 This field contains descriptive information about the key.
 For most key types, it has the form
 
-- 
2.10.2

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
