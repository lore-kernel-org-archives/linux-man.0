From: "D. Barbier" <bouzim-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: sigaltstack.2: tfix
Date: Tue, 29 Jul 2014 19:53:48 +0200
Message-ID: <CAMqf4EFSuwzxeW==8eAe2+s-vaZ3PKkeZd_43UdX=cTk8gMwSw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Michael Kerrisk-manpages <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Fix typo introduced in 0c892e5.

Denis

diff --git a/man2/sigaltstack.2 b/man2/sigaltstack.2
index 69b663a..fb58593 100644
--- a/man2/sigaltstack.2
+++ b/man2/sigaltstack.2
@@ -148,7 +148,7 @@ a nonzero value other than
 .B ENOMEM
 The specified size of the new alternate signal stack
 .I ss.ss_size
-as less than
+was less than
 .BR MINSTKSZ .
 .TP
 .B EPERM
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
