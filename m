From: =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 1/3] perf_event_open.2: tfix
Date: Sun, 17 Nov 2013 15:38:43 -0400
Message-ID: <1384717125-6012-2-git-send-email-taffit@debian.org>
References: <20131117182608.GB20757@aym.net2.nerim.net>
 <1384717125-6012-1-git-send-email-taffit@debian.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1384717125-6012-1-git-send-email-taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

---
 man2/perf_event_open.2 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man2/perf_event_open.2 b/man2/perf_event_open.2
index 1889689..9eb92cb 100644
--- a/man2/perf_event_open.2
+++ b/man2/perf_event_open.2
@@ -699,7 +699,7 @@ records from various different event sources with different
 settings.
 Parsing the event stream properly was not possible because the
 format of the record was needed to find SAMPLE_ID, but
-the the format could not be found without knowing what
+the format could not be found without knowing what
 event the sample belonged to (causing a circular
 dependency).
 
-- 
1.8.4.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
