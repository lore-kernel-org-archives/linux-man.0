From: Michael Witten <mfwitten-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 4/9] strftime.3: %z is defined by the SUSv3
Date: Thu,  3 Dec 2009 16:39:53 -0600
Message-ID: <1259879998-1140-4-git-send-email-mfwitten@gmail.com>
References: <1259879998-1140-1-git-send-email-mfwitten@gmail.com>
 <1259879998-1140-2-git-send-email-mfwitten@gmail.com>
 <1259879998-1140-3-git-send-email-mfwitten@gmail.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1259879998-1140-3-git-send-email-mfwitten-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On my system, `man 3p strftime' defines %z (much more rigorously).
You can see for yourself here:

  http://www.opengroup.org/onlinepubs/009695399/functions/strftime.html

So, it would appear that %z is no longer just a GNU extension.
Hence, the `(GNU)' tag has been replaced with the `(SU)' tag.

Signed-off-by: Michael Witten <mfwitten-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 man3/strftime.3 |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/man3/strftime.3 b/man3/strftime.3
index 9b1b0b0..0d925fa 100644
--- a/man3/strftime.3
+++ b/man3/strftime.3
@@ -244,7 +244,7 @@ The year as a decimal number including the century.
 .B %z
 The +hhmm or -hhmm numeric time zone (that is, the hour and minute offset from UTC).
 Required to emit RFC\ 822-conformant dates
-(using "%a,\ %d\ %b\ %Y\ %H:%M:%S\ %z"). (GNU)
+(using "%a,\ %d\ %b\ %Y\ %H:%M:%S\ %z"). (SU)
 .TP
 .B %Z
 The timezone or name or abbreviation.
-- 
1.6.5.2.180.gc5b3e

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
