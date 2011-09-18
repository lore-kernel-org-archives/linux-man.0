From: =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] ptrace.2: tfix
Date: Sun, 18 Sep 2011 17:43:38 -0400
Message-ID: <1316382218-8088-1-git-send-email-taffit@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org


Signed-off-by: David Pr=C3=A9vot <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
---
 man2/ptrace.2 |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/man2/ptrace.2 b/man2/ptrace.2
index 8af246f..ea41a26 100644
--- a/man2/ptrace.2
+++ b/man2/ptrace.2
@@ -208,7 +208,7 @@ as a bit mask of options, which are specified by th=
e following flags:
 .TP
 .BR PTRACE_O_TRACESYSGOOD " (since Linux 2.4.6)"
 When delivering syscall traps, set bit 7 in the signal number
-(i.e., deliver \fI(SIGTRAP | 0x80)\fP.
+(i.e., deliver \fISIGTRAP | 0x80\fP).
 This makes it easy for the tracer to tell the difference
 between normal traps and those caused by a syscall.
 .RB ( PTRACE_O_TRACESYSGOOD
--=20
1.7.6.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
