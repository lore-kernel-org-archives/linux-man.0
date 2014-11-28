From: Laurent Georget <laurent.georget-vbcOdlJ0SulGWvitb5QawA@public.gmane.org>
Subject: [patch] adjtimex.2: add explanation about ADJ_TAI action
Date: Fri, 28 Nov 2014 14:40:44 +0100
Message-ID: <54787B5C.1080802@supelec.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Here is another fix for adjtimex(2) for one of the FIXME. Other three
FIXMEs remain in the file but as those are my first patches, I prefer to
have them reviewed first before I submit other.

Information for ADJ_TAI was obtained through reading the source code of
the last version available on the kernel repo, exploring the git logs,
and through external documentation on the NTP protocol and TAI.

Thanks,

Laurent


diff --git a/man2/adjtimex.2 b/man2/adjtimex.2
index 20a2f0b..8418b4f 100644
--- a/man2/adjtimex.2
+++ b/man2/adjtimex.2
@@ -26,9 +26,6 @@
 .\" Modified 2004-05-27 by Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
 .\" Modified 2014-11-28 by Laurent Georget <laurent.georget-vbcOdlJ0SulGWvitb5QawA@public.gmane.org>
 .\"
-.\" FIXME Document ADJ_TAI (added in Linux 2.6.26)
-.\"		commit 153b5d054ac2d98ea0d86504884326b6777f683d
-.\"
 .\" FIXME Document ADJ_MICRO and ADJ_NANO (added in Linux 2.6.26)
 .\"		commit eea83d896e318bda54be2d2770d2c5d6668d11db
 .\"		Author: Roman Zippel <zippel-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
@@ -93,6 +90,7 @@ combination of zero or more of the following bits:
 #define ADJ_ESTERROR          0x0008 /* estimated time error */
 #define ADJ_STATUS            0x0010 /* clock status */
 #define ADJ_TIMECONST         0x0020 /* pll time constant */
+#define ADJ_TAI               0x0080 /* TAI offset */
 #define ADJ_TICK              0x4000 /* tick value */
 #define ADJ_OFFSET_SINGLESHOT 0x8001 /* old-fashioned adjtime() */
 .fi
@@ -101,7 +99,19 @@ combination of zero or more of the following bits:
 Ordinary users are restricted to a zero value for
 .IR modes .
 Only the superuser may set any parameters.
+.PP
+Support for TAI (Atomic International Time, for a complete explanation
about
+what it is and what is the difference between TAI and UTC, see
+.UR http://www.bipm.org/en/bipm/tai/tai.html
+.I BIPM
+.UE )
+has been added in version 2.6.29. For any clock, the TAI offset may
+be calculated by adding a value to the UTC offset which is updated when a
+leap second is added or deleted.
 .br
+All the offsets in the timex structure are expressed between the value
of the
+clock and the corresponding value (e.g. TAI offset is the difference
between
+the clock and the TAI, not between TAI and another value such as UTC).
 .ne 12v
 .SH RETURN VALUE
 On success,
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
