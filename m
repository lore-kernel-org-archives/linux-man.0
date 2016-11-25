From: Eugene Syromyatnikov <evgsyr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH draft_keys 1/7] keyctl.2: tfix
Date: Fri, 25 Nov 2016 04:00:50 +0300
Message-ID: <20161125010050.GA32715@obsidian>
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
 man2/keyctl.2 | 1 -
 1 file changed, 1 deletion(-)

diff --git a/man2/keyctl.2 b/man2/keyctl.2
index d723b9a..cf2c991 100644
--- a/man2/keyctl.2
+++ b/man2/keyctl.2
@@ -931,7 +931,6 @@ Use the process-specific keyring
 .RB ( process-keyring (7))
 as the new default keyring.
 .TP
-.TP
 .BR KEY_REQKEY_DEFL_SESSION_KEYRING
 Use the session-specific keyring
 .RB ( session-keyring (7))
-- 
2.10.2

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
