From: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] ffix: add space between word and punctuation if BR or IR
Date: Sat,  8 Feb 2014 13:11:57 +0100
Message-ID: <1391861517-4619-1-git-send-email-spaillard@debian.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Detected through the regex:
	git grep -P '^\.(BR|IR) [^ ]*[,\.]$'

Could probably be extended to match more cases and fix in perl.
---
 man2/prctl.2    | 4 ++--
 man2/quotactl.2 | 2 +-
 man3/string.3   | 2 +-
 man4/hpsa.4     | 2 +-
 man5/gai.conf.5 | 2 +-
 5 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/man2/prctl.2 b/man2/prctl.2
index 314dc5f..b881dde 100644
--- a/man2/prctl.2
+++ b/man2/prctl.2
@@ -332,7 +332,7 @@ set to 0 clears the caller's "ptracer process ID".
 If
 .I arg2
 is
-.BR PR_SET_PTRACER_ANY,
+.BR PR_SET_PTRACER_ANY ,
 the ptrace restrictions introduced by Yama are effectively disabled for the
 calling process.
 
@@ -851,7 +851,7 @@ is
 .BR PR_SET_MM_START_DATA ,
 .BR PR_SET_MM_END_DATA ,
 or
-.BR PR_SET_MM_START_STACK,
+.BR PR_SET_MM_START_STACK ,
 and the permissions of the corresponding memory area are not as required;
 .IP *
 .I arg2
diff --git a/man2/quotactl.2 b/man2/quotactl.2
index 7422076..a8386a9 100644
--- a/man2/quotactl.2
+++ b/man2/quotactl.2
@@ -325,7 +325,7 @@ argument should be a pointer to a
 .I dqstats
 structure in which data should be stored.
 This structure is defined in
-.IR <sys/quota.h>.
+.IR <sys/quota.h> .
 The
 .I special
 and
diff --git a/man3/string.3 b/man3/string.3
index 4f76405..0f33e2c 100644
--- a/man3/string.3
+++ b/man3/string.3
@@ -146,7 +146,7 @@ Compare at most
 bytes of the strings
 .I s1
 and
-.IR s2.
+.IR s2 .
 .TP
 .BI "char *strncpy(char *" dest ", const char *" src ", size_t " n );
 Copy at most
diff --git a/man4/hpsa.4 b/man4/hpsa.4
index 9b67270..6ca1537 100644
--- a/man4/hpsa.4
+++ b/man4/hpsa.4
@@ -70,7 +70,7 @@ and
 the RAID controller via the SCSI generic driver
 .RB ( sg (4)),
 with device nodes named
-.IR /dev/sd*,
+.IR /dev/sd* ,
 .IR /dev/st* ,
 and
 .IR /dev/sg* ,
diff --git a/man5/gai.conf.5 b/man5/gai.conf.5
index be1fc25..050f6e2 100644
--- a/man5/gai.conf.5
+++ b/man5/gai.conf.5
@@ -91,5 +91,5 @@ precedence ::ffff:0:0/96  10
 .\" Ulrich Drepper <drepper-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
 .\"
 .SH SEE ALSO
-.BR getaddrinfo(3),
+.BR getaddrinfo(3) ,
 RFC\ 3484
-- 
1.8.5.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
