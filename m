From: Marko Myllynen <myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] locale.5: sfix
Date: Tue, 09 Jun 2015 17:20:01 +0300
Message-ID: <5576F611.1060205@redhat.com>
Reply-To: myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Michael,

the subject says it all, the former is consistent with
other keywords, the latter fixes a rendering issue.

---
 man5/locale.5 |    5 ++---
 1 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/man5/locale.5 b/man5/locale.5
index bbc46b7..ee7c4f6 100644
--- a/man5/locale.5
+++ b/man5/locale.5
@@ -438,7 +438,7 @@ letters.
 If the keyword tolower is not present, the reverse of the
 toupper list is used.
 .TP
-.I map "totitle"
+.I map totitle
 followed by a list of mapping pairs of
 characters and letters
 to be used in titles (headings).
@@ -487,8 +487,7 @@ character will be used instead.
 .I include
 in the transliteration rules section includes
 a transliteration rule file
-(and optionally a repertoire map file)
-.
+(and optionally a repertoire map file).
 .TP
 .I default_missing
 in the transliteration rules section 

Thanks,

-- 
Marko Myllynen
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
