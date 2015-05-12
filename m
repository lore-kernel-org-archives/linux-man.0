From: Marko Myllynen <myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] locale.5: document map to_inpunct, map to_outpunct
Date: Tue, 12 May 2015 16:58:20 +0300
Message-ID: <555206FC.8080709@redhat.com>
Reply-To: myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

See e.g. fa_IR for reference.

---
 man5/locale.5 |   11 ++++++++++-
 1 files changed, 10 insertions(+), 1 deletions(-)

diff --git a/man5/locale.5 b/man5/locale.5
index 5a540f8..b0dca21 100644
--- a/man5/locale.5
+++ b/man5/locale.5
@@ -245,7 +245,6 @@ The following keywords are allowed:
 .\" FIXME The following LC_CTYPE keywords are not documented:
 .\"	translit_start + translit_end
 .\"	include
-.\"	map (to_inpunct, to_outpunct)
 .TP
 .I upper
 followed by a list of uppercase letters.
@@ -439,6 +438,16 @@ which are then to be defined in the locale.
 .TP
 .I outdigit
 followed by a list of alternate output digits for the locale.
+.TP
+.I map to_inpunct
+followed by a list of mapping pairs of
+alternate digits and separators
+for input digits for the locale.
+.TP
+.I map to_outpunct
+followed by a list of mapping pairs of
+alternate separators
+for output for the locale.
 .PP
 The
 .B LC_CTYPE
-- 
1.7.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
