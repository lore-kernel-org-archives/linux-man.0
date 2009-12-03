From: Michael Witten <mfwitten-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 6/9] strftime.3: Expanded introduction
Date: Thu,  3 Dec 2009 16:39:55 -0600
Message-ID: <1259879998-1140-6-git-send-email-mfwitten@gmail.com>
References: <1259879998-1140-1-git-send-email-mfwitten@gmail.com>
 <1259879998-1140-2-git-send-email-mfwitten@gmail.com>
 <1259879998-1140-3-git-send-email-mfwitten@gmail.com>
 <1259879998-1140-4-git-send-email-mfwitten@gmail.com>
 <1259879998-1140-5-git-send-email-mfwitten@gmail.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1259879998-1140-5-git-send-email-mfwitten-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Michael Witten <mfwitten-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 man3/strftime.3 |   19 ++++++++++++-------
 1 files changed, 12 insertions(+), 7 deletions(-)

diff --git a/man3/strftime.3 b/man3/strftime.3
index e8400f0..c42607a 100644
--- a/man3/strftime.3
+++ b/man3/strftime.3
@@ -51,13 +51,18 @@ result in the character array \fIs\fP of size \fImax\fP.
 .\" FIXME POSIX says: Local timezone information is used as though
 .\" strftime() called tzset().  But this doesn't appear to be the case
 .PP
-Ordinary characters placed in the format string are copied to \fIs\fP
-without conversion.
-.I "Conversion specifications"
-are introduced by a \(aq%\(aq
-character, and terminated by a
-.IR "conversion specifier character" ,
-and are replaced in \fIs\fP as follows:
+The format specification is a null-terminated string and may contain
+special character sequences called
+.IR "conversion specifications",
+each of which is introduced by a \(aq%\(aq character and terminated by
+some other character known as a
+.IR "conversion specifier character".
+All other character sequences are
+.IR "ordinary character sequences".
+.PP
+The characters of ordinary character sequences (including the null byte)
+are copied verbatim from \fIformat\fP to \fIs\fP. However, the characters
+of conversion specifications are replaced as follows:
 .TP
 .B %a
 The abbreviated weekday name according to the current locale.
-- 
1.6.5.2.180.gc5b3e

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
