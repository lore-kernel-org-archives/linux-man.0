From: Marko Myllynen <myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] localedef.1: list default path for compiled files
Date: Mon, 20 Oct 2014 08:21:53 +0300
Message-ID: <54449BF1.3050109@redhat.com>
Reply-To: myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org


---
 man1/localedef.1 |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/man1/localedef.1 b/man1/localedef.1
index 24da5d0..1f2cd7a 100644
--- a/man1/localedef.1
+++ b/man1/localedef.1
@@ -291,6 +291,9 @@ Usual default repertoire map path.
 .TP
 .I /usr/lib/locale/locale-archive
 Usual default locale archive location.
+.TP 
+.I /usr/lib/locale               
+Usual default path for compiled individual locale data files.
 .TP
 .I outputpath/LC_ADDRESS
 An output file that contains information about formatting of
-- 
1.7.1

-- 
Marko Myllynen
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
