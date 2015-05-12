From: Marko Myllynen <myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] locale.5: document default_missing
Date: Tue, 12 May 2015 16:59:11 +0300
Message-ID: <5552072F.4080205@redhat.com>
Reply-To: myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org


---
 man5/locale.5 |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/man5/locale.5 b/man5/locale.5
index ae60879..2519ad2 100644
--- a/man5/locale.5
+++ b/man5/locale.5
@@ -483,6 +483,12 @@ a transliteration rule file
 (and optionally a repertoire map file)
 .
 .TP
+.I default_missing
+in the transliteration rules section 
+defines the default character to be used for 
+transliteration where none of the targets cannot be presented
+in the target character set.
+.TP
 .I translit_end
 marks the end of the transliteration rules.
 .PP
-- 
1.7.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
