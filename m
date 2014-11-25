From: Tobias Werth <werth-n+aIp8eCc/CzQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH] ascii.7: tfix
Date: Tue, 25 Nov 2014 12:59:11 +0100
Message-ID: <1416916751-19627-1-git-send-email-werth@cs.fau.de>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: Tobias Werth <werth-n+aIp8eCc/CzQB+pC5nmwQ@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The ' in the compact tables were not escaped correctly resulting in
UTF-8 in the ASCII table.
---
 man7/ascii.7 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/man7/ascii.7 b/man7/ascii.7
index 93a404a..d0fbe6b 100644
--- a/man7/ascii.7
+++ b/man7/ascii.7
@@ -138,9 +138,9 @@ For convenience, below are more compact tables in hex and decimal.
 4: $ 4 D T d t     4: "  ,  6  @  J  T  ^  h   r   |
 5: % 5 E U e u     5: #  \-  7  A  K  U  _  i   s   }
 6: & 6 F V f v     6: $  .  8  B  L  V  \`  j   t   ~
-7: \' 7 G W g w     7: %  /  9  C  M  W  a  k   u  DEL
+7: \(aq 7 G W g w     7: %  /  9  C  M  W  a  k   u  DEL
 8: ( 8 H X h x     8: &  0  :  D  N  X  b  l   v
-9: ) 9 I Y i y     9: \'  1  ;  E  O  Y  c  m   w
+9: ) 9 I Y i y     9: \(aq  1  ;  E  O  Y  c  m   w
 A: * : J Z j z
 B: + ; K [ k {
 C: , < L \e l |
-- 
2.1.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
