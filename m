From: Marko Myllynen <myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] locale.5: document charclass and charconv
Date: Tue, 12 May 2015 16:57:58 +0300
Message-ID: <555206E6.6020807@redhat.com>
Reply-To: myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

See e.g. the locales ja_JP and ko_KR and

http://en.cppreference.com/w/cpp/string/wide/towctrans
http://en.cppreference.com/w/cpp/string/wide/wctrans

---
 man5/locale.5 |   10 ++++++++--
 1 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/man5/locale.5 b/man5/locale.5
index d2c67dc..b7e1d15 100644
--- a/man5/locale.5
+++ b/man5/locale.5
@@ -244,8 +244,6 @@ in the first column.
 The following keywords are allowed:
 .\" FIXME The following LC_CTYPE keywords are not documented:
 .\"	translit_start + translit_end
-.\"	charclass
-.\"	charconv
 .\"	outdigit
 .\"	include
 .\"	map (to_inpunct, to_outpunct)
@@ -431,6 +429,14 @@ followed by a list of mappings from uppercase to lowercase
 letters.
 If the keyword tolower is not present, the reverse of the
 toupper list is used.
+.TP
+.I charclass
+followed by a list of locale-specific character class names
+which are then to be defined in the locale.
+.TP
+.I charconv
+followed by a list of locale-specific character map names
+which are then to be defined in the locale.
 .PP
 The
 .B LC_CTYPE
-- 
1.7.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
