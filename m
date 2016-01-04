From: Nikola =?ISO-8859-1?Q?Forr=F3?= <nforro-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [patch] rcmd.3: Add missing condition concerning .rhosts file
Date: Mon, 04 Jan 2016 17:18:33 +0100
Message-ID: <1451924313.4749.4.camel@redhat.com>
Reply-To: nforro-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

The list of conditions determining if iruserok() and ruserok()
functions automatically fail is incomplete. According to glibc
source code, the functions also fail if the .rhosts file
is hardlinked anywhere.
---
 man3/rcmd.3 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/man3/rcmd.3 b/man3/rcmd.3
index 33eae3c..f32fe52 100644
--- a/man3/rcmd.3
+++ b/man3/rcmd.3
@@ -200,8 +200,8 @@ in the local user's home directory is checked to see if the request for
 service is allowed.
 .PP
 If this file does not exist, is not a regular file, is owned by anyone
-other than the user or the superuser, or is writable by anyone other
-than the owner, the check automatically fails.
+other than the user or the superuser, is writable by anyone other
+than the owner, or is hardlinked anywhere, the check automatically fails.
 Zero is returned if the machine name is listed in the
 .IR hosts.equiv
 file, or the host and remote username are found in the
-- 
2.4.3


--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
