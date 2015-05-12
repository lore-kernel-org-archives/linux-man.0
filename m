From: Marko Myllynen <myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] locale.5: fix country_isbn format
Date: Tue, 12 May 2015 17:21:19 +0300
Message-ID: <55520C5F.1030805@redhat.com>
Reply-To: myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Both plain numbers and Unicode code points are used in glibc locales but checking the code reveals that country_isbn is handled like the rest of its category expect for country_num which was clarified earlier.

---
 man5/locale.5 |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/man5/locale.5 b/man5/locale.5
index d2c67dc..bc9ed8e 100644
--- a/man5/locale.5
+++ b/man5/locale.5
@@ -213,7 +213,7 @@ followed by the numeric country code as plain numbers (ISO 3166).
 followed by the code for the country car number.
 .TP
 .I country_isbn
-followed by the ISBN code as plain numbers (for books).
+followed by the ISBN code (for books).
 .TP
 .I lang_name
 followed by the language name in the language of the current document.
-- 
1.7.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
