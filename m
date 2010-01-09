From: Michael Witten <mfwitten-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 3/9] strftime.3: Clarification of %z
Date: Sat,  9 Jan 2010 17:45:31 -0600
Message-ID: <1263080737-2868-4-git-send-email-mfwitten@gmail.com>
References: <1263080737-2868-1-git-send-email-mfwitten@gmail.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1263080737-2868-1-git-send-email-mfwitten-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Michael Witten <mfwitten-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 man3/strftime.3 |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/man3/strftime.3 b/man3/strftime.3
index e356ccb..9b1b0b0 100644
--- a/man3/strftime.3
+++ b/man3/strftime.3
@@ -242,7 +242,7 @@ The year as a decimal number without a century (range 00 to 99).
 The year as a decimal number including the century.
 .TP
 .B %z
-The time-zone as hour offset from UTC.
+The +hhmm or -hhmm numeric time zone (that is, the hour and minute offset from UTC).
 Required to emit RFC\ 822-conformant dates
 (using "%a,\ %d\ %b\ %Y\ %H:%M:%S\ %z"). (GNU)
 .TP
-- 
1.6.6.102.gd6f8f

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
