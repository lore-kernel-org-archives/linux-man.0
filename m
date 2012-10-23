From: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] getdomainname.2: point out it is related to NIS and not DNS
Date: Tue, 23 Oct 2012 23:45:52 +0200
Message-ID: <1351028752-10662-1-git-send-email-spaillard@debian.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Reported-by: Lars Wirzenius <liw-X3B1VOXEql0@public.gmane.org>
See http://bugs.debian.org/295635
---
 man2/getdomainname.2 |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/man2/getdomainname.2 b/man2/getdomainname.2
index 0e24b18..b0ee32c 100644
--- a/man2/getdomainname.2
+++ b/man2/getdomainname.2
@@ -28,7 +28,7 @@
 .\"
 .TH GETDOMAINNAME 2 2009-09-27 "Linux" "Linux Programmer's Manual"
 .SH NAME
-getdomainname, setdomainname \- get/set domain name
+getdomainname, setdomainname \- get/set NIS domain name
 .SH SYNOPSIS
 .B #include <unistd.h>
 .sp
@@ -49,7 +49,7 @@ _BSD_SOURCE || (_XOPEN_SOURCE && _XOPEN_SOURCE\ <\ 500)
 .RE
 .ad
 .SH DESCRIPTION
-These functions are used to access or to change the domain name of the
+These functions are used to access or to change the NIS domain name of the
 host system.
 
 .BR setdomainname ()
-- 
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
