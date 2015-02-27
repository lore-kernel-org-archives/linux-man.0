From: saulery-GANU6spQydw@public.gmane.org
Subject: [patch] intro.2: tfix
Date: Fri, 27 Feb 2015 01:26:15 +0100
Message-ID: <1424996777-10600-2-git-send-email-saulery@free.fr>
References: <1424996777-10600-1-git-send-email-saulery@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1424996777-10600-1-git-send-email-saulery-GANU6spQydw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?St=C3=A9phane=20Aulery?= <saulery-GANU6spQydw@public.gmane.org>
List-Id: linux-man@vger.kernel.org

=46rom: St=C3=A9phane Aulery <saulery-GANU6spQydw@public.gmane.org>

Signed-off-by: St=C3=A9phane Aulery <saulery-GANU6spQydw@public.gmane.org>
---
 man2/intro.2 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/man2/intro.2 b/man2/intro.2
index b65bdfc..d0d18dc 100644
--- a/man2/intro.2
+++ b/man2/intro.2
@@ -46,7 +46,7 @@ copying arguments and the unique system call number t=
o the
 registers where the kernel expects them;
 .IP *
 trapping to kernel mode,
-at which point the kernel does the real work of the system call; and
+at which point the kernel does the real work of the system call;
 .IP *
 setting
 .I errno
@@ -55,7 +55,7 @@ CPU to user mode.
 .LP
 However, in a few cases, a wrapper function may do rather more than th=
is,
 for example, performing some preprocessing
-of the arguments of arguments before trapping to kernel mode,
+of the arguments before trapping to kernel mode,
 or postprocessing of values returned by the system call.
 Where this is the case, the manual pages in Section 2 generally
 try to note the details of both the (usually GNU) C library API
--=20
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
