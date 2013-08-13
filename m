From: "D. Barbier" <bouzim-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: linkat.2: tfix
Date: Tue, 13 Aug 2013 22:57:41 +0200
Message-ID: <CAMqf4EHKCgpLAvM8MW7wU=z9tVxxBUZnUsaEbow9=BvrfpK-Ow@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Michael Kerrisk-manpages <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-man@vger.kernel.org

[resending without HTML junk, sorry for the trouble]

diff --git a/man2/linkat.2 b/man2/linkat.2
index 701d341..fd2a91b 100644
--- a/man2/linkat.2
+++ b/man2/linkat.2
@@ -95,7 +95,7 @@ except that a relative pathname is interpreted relative
 to the directory referred to by the file descriptor
 .IR newdirfd .

-The following values can be biwise ORed in
+The following values can be bitwise ORed in
 .IR flags :
 .TP
 .BR AT_EMPTY_PATH " (since Linux 2.6.39)"
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
