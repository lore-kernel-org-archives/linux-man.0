From: William Woodruff <william-d4iiUcZhRQBWk0Htik3J/w@public.gmane.org>
Subject: [PATCH]  undocumented.3: remove documented functions
Date: Mon, 20 Apr 2015 16:41:04 -0400
Message-ID: <55356460.4090103@tuffbizz.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Removed documented functions from undocumented(3).
Applies to 3.83.


Signed-off-by: William Woodruff <william-d4iiUcZhRQBWk0Htik3J/w@public.gmane.org>
---
 man3/undocumented.3 | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/man3/undocumented.3 b/man3/undocumented.3
index a483710..c120639 100644
--- a/man3/undocumented.3
+++ b/man3/undocumented.3
@@ -25,6 +25,7 @@
 .\"
 .\" 1996-11-08, meem-HWoMVPdnuBlk8Cqr0lzv/je48wsgrGvP@public.gmane.org, corrections
 .\" 2004-10-31, aeb, changed maintainer address, updated list
+.\" 2015-04-20, william-d4iiUcZhRQBWk0Htik3J/w@public.gmane.org, updated list
 .\"
 .TH UNDOCUMENTED 3 2012-12-21 "Linux" "Linux Programmer's Manual"
 .SH NAME
@@ -67,8 +68,6 @@ for inclusion in the next man page release.
 .BR getdirentries64 (3),
 .BR getmsg (3),
 .BR getnetname (3),
-.BR get_nprocs (3),
-.BR get_nprocs_conf (3),
 .BR get_phys_pages (3),
 .BR getpublickey (3),
 .BR getsecretkey (3),
@@ -79,7 +78,6 @@ for inclusion in the next man page release.
 .BR inet_nsap_ntoa (3),
 .BR init_des (3),
 .BR libc_nls_init (3),
-.BR lio_listio (3),
 .BR mstats (3),
 .BR netname2host (3),
 .BR netname2user (3),
@@ -123,8 +121,6 @@ for inclusion in the next man page release.
 .BR ufc_dofinalperm (3),
 .BR ufc_doit (3),
 .BR user2netname (3),
-.BR vlimit (3),
-.BR vtimes (3),
 .BR wcschrnul (3),
 .BR wcsftime (3),
 .BR wscanf (3),
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
