From: Marko Myllynen <myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] strfmon.3: rewrite the example
Date: Tue, 09 Jun 2015 17:18:40 +0300
Message-ID: <5576F5C0.7080208@redhat.com>
Reply-To: myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Michael,

I think the example is more accurate when we use the exact
locale names and also the Euro sign where appropriate.
---
 man3/strfmon.3 |   29 +++++++++++++++--------------
 1 files changed, 15 insertions(+), 14 deletions(-)

diff --git a/man3/strfmon.3 b/man3/strfmon.3
index 1fcfbf0..fe2a086 100644
--- a/man3/strfmon.3
+++ b/man3/strfmon.3
@@ -189,27 +189,28 @@ strfmon(buf, sizeof(buf), "[%^=3D*#6n] [%=3D*#6i]=
",
 outputs
 .in +4n
=20
-[ fl **1234,57] [ NLG  **1 234,57]
+[=E2=82=AC **1234,57] [EUR **1 234,57]
=20
 .in
-in the Dutch locale (with fl for "florijnen" and NLG for Netherlands G=
uilders).
-The grouping character is very ugly because it takes as much space
-as a digit, while it should not take more than half that,
-and will no doubt cause confusion.
-Surprisingly, the "fl" is preceded and followed by a space,
-and "NLG" is preceded by one and followed by two spaces.
-This may be a bug in the locale files.
-The Italian, Australian, Swiss,
-and Portuguese locales yield
+in the
+.I nl_NL
+locale.
+The=20
+.IR de_DE ,
+.IR de_CH ,
+.IR en_AU ,
+and
+.I en_GB
+locales yield
 .in +4n
=20
-[ L. **1235] [ ITL  **1.235]
+[ **1234,57 =E2=82=AC] [ **1.234,57 EUR]
 .br
-[ $**1234.57] [ AUD **1,234.57]
+[ Fr. **1234.57] [ CHF **1'234.57]
 .br
-[Fr. **1234,57] [CHF  **1.234,57]
+[ $**1234.57] [ AUD**1,234.57]
 .br
-[ **1234$57Esc] [ **1.234$57PTE ]
+[ =C2=A3**1234.57] [ GBP**1,234.57]
 .in
 .SH SEE ALSO
 .BR duplocale (3),

Thanks,

--=20
Marko Myllynen
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
