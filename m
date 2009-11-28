From: Mark Hills <mark-UrrBsZIrrsb10XsdtD+oqA@public.gmane.org>
Subject: [PATCH 3/3] getrusage.2: Bump revision
Date: Sat, 28 Nov 2009 13:57:17 +0000
Message-ID: <1259416637-8118-3-git-send-email-mark@pogo.org.uk>
References: <1259416637-8118-1-git-send-email-mark@pogo.org.uk>
 <1259416637-8118-2-git-send-email-mark@pogo.org.uk>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1259416637-8118-2-git-send-email-mark-UrrBsZIrrsb10XsdtD+oqA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


Signed-off-by: Mark Hills <mark-UrrBsZIrrsb10XsdtD+oqA@public.gmane.org>
---
 man2/getrusage.2 |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/man2/getrusage.2 b/man2/getrusage.2
index a35d0a3..0765e7d 100644
--- a/man2/getrusage.2
+++ b/man2/getrusage.2
@@ -32,8 +32,10 @@
 .\"	when SIGCHLD is being ignored is fixed in 2.6.9.
 .\" 2008-02-22, Sripathi Kodi <sripathik-xthvdsQ13ZrQT0dZR+AlfA@public.gmane.org>: Document RUSAGE_THREAD
 .\" 2008-05-25, mtk, clarify RUSAGE_CHILDREN + other clean-ups.
+.\" 2009-11-28, Mark Hills <mark-UrrBsZIrrsb10XsdtD+oqA@public.gmane.org>: Description of fields,
+.\"     document ru_maxrss
 .\"
-.TH GETRUSAGE 2 2009-08-25 "Linux" "Linux Programmer's Manual"
+.TH GETRUSAGE 2 2009-11-28 "Linux" "Linux Programmer's Manual"
 .SH NAME
 getrusage \- get resource usage
 .SH SYNOPSIS
-- 
1.6.5.2

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
