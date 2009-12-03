From: Michael Witten <mfwitten-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 5/9] strftime.3: Move 822-compliant date format example to EXAMPLES section
Date: Thu,  3 Dec 2009 16:39:54 -0600
Message-ID: <1259879998-1140-5-git-send-email-mfwitten@gmail.com>
References: <1259879998-1140-1-git-send-email-mfwitten@gmail.com>
 <1259879998-1140-2-git-send-email-mfwitten@gmail.com>
 <1259879998-1140-3-git-send-email-mfwitten@gmail.com>
 <1259879998-1140-4-git-send-email-mfwitten@gmail.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1259879998-1140-4-git-send-email-mfwitten-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The RFC 822-compliant date format given in the description of `%z'
is now moved to the EXAMPLE section (and EXAMPLE has been renamed
EXAMPLES).

Furthermore, that format example is now actually RFC 822-compliant
(using `%y' instead of `%Y') and has been qualified as being correct
only when in the context of at least an English locale. Also, `%T'
is used in place of `%H:%M:%S'.

For completeness, an RFC 2822-compliant format example has been
similarly added.

The formatting of the EXAMPLES section has been improved.

Signed-off-by: Michael Witten <mfwitten-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 man3/strftime.3 |   28 ++++++++++++++++++++++------
 1 files changed, 22 insertions(+), 6 deletions(-)

diff --git a/man3/strftime.3 b/man3/strftime.3
index 0d925fa..e8400f0 100644
--- a/man3/strftime.3
+++ b/man3/strftime.3
@@ -242,9 +242,7 @@ The year as a decimal number without a century (range 00 to 99).
 The year as a decimal number including the century.
 .TP
 .B %z
-The +hhmm or -hhmm numeric time zone (that is, the hour and minute offset from UTC).
-Required to emit RFC\ 822-conformant dates
-(using "%a,\ %d\ %b\ %Y\ %H:%M:%S\ %z"). (SU)
+The +hhmm or -hhmm numeric time zone (that is, the hour and minute offset from UTC). (SU)
 .TP
 .B %Z
 The timezone or name or abbreviation.
@@ -442,13 +440,29 @@ Nowadays,
 provides the \fI\-Wno\-format\-y2k\fP option to prevent the warning,
 so that the above workaround is no longer required.
 .SH EXAMPLE
+.BR "RFC\ 2822-compliant date format"
+(with an English locale for %a and %b)
+.PP
+.in +2n
+"%a,\ %d\ %b\ %Y\ %T\ %z"
+.PP
+.BR "RFC\ 822-compliant date format"
+(with an English locale for %a and %b)
+.PP
+.in +2n
+"%a,\ %d\ %b\ %y\ %T\ %z"
+.PP
+.BR "Sample program"
+.PP
+.in +2n
 The program below can be used to experiment with
 .BR strftime ().
 .PP
+.in +2n
 Some examples of the result string produced by the glibc implementation of
 .BR strftime ()
 are as follows:
-.in +4n
+.in +2n
 .nf
 
 .RB "$" " ./a.out \(aq%m\(aq"
@@ -457,9 +471,11 @@ Result string is "11"
 Result string is "00011"
 .RB "$" " ./a.out \(aq%_5m\(aq"
 Result string is "   11"
+
 .fi
-.in
-.SS Program source
+.in -2n
+Here is the program source:
+.in +2n
 \&
 .nf
 #include <time.h>
-- 
1.6.5.2.180.gc5b3e

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
