From: Marko Myllynen <myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] locale.5: document class in LC_CTYPE
Date: Tue, 12 May 2015 16:59:23 +0300
Message-ID: <5552073B.8060102@redhat.com>
Reply-To: myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

See e.g. the locale zh_CN and

http://en.cppreference.com/w/cpp/string/wide/towctrans
http://en.cppreference.com/w/cpp/string/wide/wctrans

---
 man5/locale.5 |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/man5/locale.5 b/man5/locale.5
index 2519ad2..314adf6 100644
--- a/man5/locale.5
+++ b/man5/locale.5
@@ -437,6 +437,11 @@ followed by a list of mapping pairs of
 characters and letters
 to be used in titles (headings).
 .TP
+.I class
+followed by a locale-specific character class definition,
+starting with the class name followed by the characters
+belonging to the class.
+.TP
 .I charclass
 followed by a list of locale-specific character class names
 which are then to be defined in the locale.
-- 
1.7.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
