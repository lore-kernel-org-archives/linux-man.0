From: Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
Subject: [PATCH 19/20] getutent.3: fix prototypes
Date: Tue, 20 May 2014 01:02:25 +0200
Message-ID: <1400540546-25578-20-git-send-email-rv@rasmusvillemoes.dk>
References: <1400540546-25578-1-git-send-email-rv@rasmusvillemoes.dk>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1400540546-25578-1-git-send-email-rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
List-Id: linux-man@vger.kernel.org

The arguments to getutid(), getutline() and pututline() are const.
---
 man3/getutent.3 | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/man3/getutent.3 b/man3/getutent.3
index 6c7ff1b..5f5ac68 100644
--- a/man3/getutent.3
+++ b/man3/getutent.3
@@ -37,11 +37,11 @@ utmpname \- access utmp file entries
 .sp
 .B struct utmp *getutent(void);
 .br
-.BI "struct utmp *getutid(struct utmp *" ut );
+.BI "struct utmp *getutid(const struct utmp *" ut );
 .br
-.BI "struct utmp *getutline(struct utmp *" ut );
+.BI "struct utmp *getutline(const struct utmp *" ut );
 .sp
-.BI "struct utmp *pututline(struct utmp *" ut );
+.BI "struct utmp *pututline(const struct utmp *" ut );
 .sp
 .B void setutent(void);
 .br
-- 
1.9.2

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
