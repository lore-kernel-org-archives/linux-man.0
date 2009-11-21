From: Mark Hills <mark-UrrBsZIrrsb10XsdtD+oqA@public.gmane.org>
Subject: [PATCH 1/2] strcpy.3: Fix typo in reference
Date: Sat, 21 Nov 2009 21:18:46 +0000
Message-ID: <1258838327-31762-1-git-send-email-mark@pogo.org.uk>
References: <alpine.NEB.2.01.0911212052050.25031@jrf.vwaro.pbz>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <alpine.NEB.2.01.0911212052050.25031-4Gsws06j5aKxDRllUHgonQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


Signed-off-by: Mark Hills <mark-UrrBsZIrrsb10XsdtD+oqA@public.gmane.org>
---
 man3/strcpy.3 |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/man3/strcpy.3 b/man3/strcpy.3
index 9d47e37..a3e6d3b 100644
--- a/man3/strcpy.3
+++ b/man3/strcpy.3
@@ -137,6 +137,6 @@ in ways that may make the impossible possible.
 .BR memcpy (3),
 .BR memmove (3),
 .BR strdup (3),
-.BR strpcpy (3),
+.BR stpcpy (3),
 .BR wcscpy (3),
 .BR wcsncpy (3)
-- 
1.6.5.2

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
