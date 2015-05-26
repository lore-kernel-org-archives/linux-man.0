From: Shawn Landden <shawn-01I/ocv1qBBILuwUvNxBeQ@public.gmane.org>
Subject: [PATCH] utf-8: include RFC 3629 and clarify endianness which is left ambiguous
Date: Mon, 25 May 2015 23:53:06 -0700
Message-ID: <1432623186-26328-1-git-send-email-shawn@churchofgit.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Shawn Landden <shawn-01I/ocv1qBBILuwUvNxBeQ@public.gmane.org>
List-Id: linux-man@vger.kernel.org

The endianness is suggested by the order the bytes are displayed, but the
text is ambiguous.
---
 man7/utf-8.7 | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/man7/utf-8.7 b/man7/utf-8.7
index 597fad4..bbb016c 100644
--- a/man7/utf-8.7
+++ b/man7/utf-8.7
@@ -133,12 +133,14 @@ The sequence to be used depends on the UCS code number of the character:
 The
 .I xxx
 bit positions are filled with the bits of the character code number in
-binary representation.
+binary representation, most significant bit first (big-endian).
 Only the shortest possible multibyte sequence
 which can represent the code number of the character can be used.
 .PP
 The UCS code values 0xd800\(en0xdfff (UTF-16 surrogates) as well as 0xfffe and
-0xffff (UCS noncharacters) should not appear in conforming UTF-8 streams.
+0xffff (UCS noncharacters) should not appear in conforming UTF-8 streams. According
+to RFC 3629 no point above U+10FFFF should be used, which limits characters to four
+bytes.
 .SS Example
 The Unicode character 0xa9 = 1010 1001 (the copyright sign) is encoded
 in UTF-8 as
-- 
2.2.1.209.g41e5f3a

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
