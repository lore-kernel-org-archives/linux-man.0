From: Luke Faraone <lfaraone-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [patch] mktemp.3: tfix
Date: Wed, 18 Feb 2015 14:48:53 -0800
Message-ID: <CAKoptixzT+RZZCwj8D-MVWOXkNc0EG_5RmS4p7ATjbs-dhwgtg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

>From 9b57599ccf6784e76fd782405022dbe279de1d7e Mon Sep 17 00:00:00 2001
From: Luke Faraone <lfaraone-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Date: Wed, 18 Feb 2015 14:46:40 -0800
Subject: [PATCH] mktemp(3) DESCRIPTION reference to BUGS corrected

mktemp(3)'s DESCRIPTION referenced NOTES, but no such section exists. Corrected
to refer to BUGS.
---
 man3/mktemp.3 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man3/mktemp.3 b/man3/mktemp.3
index bc58e2f..cdcc49a 100644
--- a/man3/mktemp.3
+++ b/man3/mktemp.3
@@ -65,7 +65,7 @@ _XOPEN_SOURCE\ &&\ _XOPEN_SOURCE_EXTENDED
 .ad b
 .SH DESCRIPTION
 .IR "Never use this function" ;
-see NOTES.
+see BUGS.

 The
 .BR mktemp ()
-- 
2.1.4
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
