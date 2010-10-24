From: =?UTF-8?B?RGF2aWQgUHLDqXZvdA==?= <davidp-whniv8GeeGkdnm+yROfE0A@public.gmane.org>
Subject: [patch] armscii-8.7: Capitalize ARMSCII (Was: [patch] armscii-8.7:
 Capitalize hexadecimal numbers)
Date: Sun, 24 Oct 2010 15:19:35 -0400
Message-ID: <ia20s8$jts$1@dough.gmane.org>
References: <ia1s60$sqs$1@dough.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <ia1s60$sqs$1@dough.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi,

Le 24/10/2010 13:59, David Pr=C3=A9vot a =C3=A9crit :

> The inline patch (and the gzipped one
> attached, hopefully not messing with encoding) address this
> minor issue for armscii-8.7 [...]

This inline patch also propose to keep ARMSCII capitalize (as it
is already written in two other places of these documents). One
could also prefer to use =E2=80=9CArmSCII=E2=80=9D instead (which shoul=
d be the
correct way to write it, even if =E2=80=9CARMSCII=E2=80=9C is accepted)=
=2E

The second patch (at your choice), propose the use of =E2=80=9CArmSCII=E2=
=80=9D.


diff --git a/man7/armscii-8.7 b/man7/armscii-8.7
index a8ee929..b5319af 100644
--- a/man7/armscii-8.7
+++ b/man7/armscii-8.7
@@ -36,7 +36,7 @@ are printable and unlisted in the
 .BR ascii (7)
 manual page.
 The fourth column will only show the proper glyphs
-in an environment configured for armscii-8.
+in an environment configured for ARMSCII-8.
 .TS
 l l l c lp-1.
 Oct    Dec     Hex     Char    Description


diff --git a/man7/armscii-8.7 b/man7/armscii-8.7
index a8ee929..9cd8bd1 100644
--- a/man7/armscii-8.7
+++ b/man7/armscii-8.7
@@ -30,13 +30,13 @@ hexadecimal
 .SH DESCRIPTION
 The Armenian Standard Code for Information Interchange,
 8-bit coded character set.
-.SS "ARMSCII-8 Characters"
-The following table displays the characters in ARMSCII-8, which
+.SS "ArmSCII-8 Characters"
+The following table displays the characters in ArmSCII-8, which
 are printable and unlisted in the
 .BR ascii (7)
 manual page.
 The fourth column will only show the proper glyphs
-in an environment configured for armscii-8.
+in an environment configured for ArmSCII-8.
 .TS
 l l l c lp-1.
 Oct    Dec     Hex     Char    Description


Regards

David

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
