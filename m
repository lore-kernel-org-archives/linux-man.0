From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: [PATCH] fix typo in glibc reference: sigorset and not sigdelset
Date: Fri, 29 Aug 2008 23:36:36 -0400
Message-ID: <1220067396-5425-1-git-send-email-vapier@gentoo.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Christopher Head <chead-EynCeXvFgoheoWH0uzbU5w@public.gmane.org>
List-Id: linux-man@vger.kernel.org

From: Christopher Head <chead-EynCeXvFgoheoWH0uzbU5w@public.gmane.org>

In the man page sigsetops(3), in the last paragraph under the DESCRIPTION
section, is this fragment:

"or the additional glibc functions described below (sigisemptyset(),
sigandset(), and sigdelset())."

In this fragment, sigdelset() should be sigorset().

Signed-off-by: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
---
 man3/sigsetops.3 |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/man3/sigsetops.3 b/man3/sigsetops.3
index d679a14..0ea0d76 100644
--- a/man3/sigsetops.3
+++ b/man3/sigsetops.3
@@ -84,7 +84,7 @@ or the additional glibc functions described below
 .RB ( sigisemptyset (),
 .BR sigandset (),
 and
-.BR sigdelset ()).
+.BR sigorset ()).
 The results are undefined if this is not done.
 .SH "RETURN VALUE"
 .BR sigemptyset (),
-- 
1.6.0

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
