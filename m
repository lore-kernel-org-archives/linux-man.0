From: Folkert van Heusden <folkert.mobiel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] open.2: O_CLOEXEC no longer is Linux specific
Date: Mon, 30 May 2011 15:02:35 +0200
Message-ID: <BANLkTine_kFx7Bo2qiy8U0T7Z-ntMogWXA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary=90e6ba6e8146e2b65f04a47de7d6
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

--90e6ba6e8146e2b65f04a47de7d6
Content-Type: text/plain; charset=ISO-8859-1

Hi,

Here's a patch to the problem described in the subject.

I gained this knowledge by reading
http://pubs.opengroup.org/onlinepubs/9699919799/functions/open.html

Patch against version 3.32 of the man-pages.


diff -uNrBbd man-pages-3.32.org/man2/open.2 man-pages-3.32/man2/open.2
--- man-pages-3.32.org/man2/open.2	2010-12-03 08:01:59.000000000 +0100
+++ man-pages-3.32/man2/open.2	2011-05-30 14:55:53.766064010 +0200
@@ -43,6 +43,8 @@
 .\" 2008-01-11, Greg Banks <gnb-cP1dWloDopni96+mSzHFpQC/G2K4zDHf@public.gmane.org>: add more detail
 .\"     on O_DIRECT.
 .\" 2008-02-26, Michael Haardt: Reorganized text for O_CREAT and mode
+.\" 2011-05-30, Folkert van Heusden <folkert-Beo89p9qyDM6GGFevw1D/A@public.gmane.org: O_CLOEXEC
+.\"     no longer is Linux-specific
 .\"
 .\" FIXME . Apr 08: The next POSIX revision has O_EXEC, O_SEARCH, and
 .\" O_TTYINIT.  Eventually these may need to be documented.  --mtk
@@ -79,7 +81,7 @@
 .B FD_CLOEXEC
 file descriptor flag described in
 .BR fcntl (2)
-is initially disabled; the Linux-specific
+is initially disabled; the
 .B O_CLOEXEC
 flag, described below, can be used to change this default).
 The file offset is set to the beginning of the file (see


Really hoping that I'm not mistaken while waisting your time :-)



-- 
www.vanheusden.com

--90e6ba6e8146e2b65f04a47de7d6
Content-Type: application/x-bzip2; name="mp-3.32-CLOEXEC.patch.bz2"
Content-Disposition: attachment; filename="mp-3.32-CLOEXEC.patch.bz2"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_gobfeiph0

QlpoOTFBWSZTWWfcX68AARjfgCIwUG///X/n3GS/79/wQAIpbsndXdCVCaMKNPUYkyMIZGhhPUGQ
0ZGaRoDU0aSfo1GVP1R+oQ0aA9QAAAaDQAJU9JNTaSejKY1B6gDTIMQBkDQBtQJU00TESep6TyjQ
9TQAaAeobUANGg0LJYF7Vt1bFzS+qsY9LmvtR7I5RDxxXXBl6+2Br7LaA3YISZhzrtUzS4UyisY1
Oy+dlj0+LKED786LlecWzeP0F4EpSbcqxDzW99+zFwtbcXkr+QR10wPFrSzADTFrrhRhgTfy9OTT
xoxUsVcH1sRCREqrgUkgxt4P0Xz5bqooSBBA8Kk5If93TbvsJBruvTCZPbGxT2NOjkkenVyl0liQ
UHoI5s4XPXAFQNmLhIrSNDXQnDA3SogWEMyWWx5Vj3qWPSRt++ifSlcIcxaG94KMJwrUi5kJzRBn
qBSde3fH4AnciRyDOkq273VpESD07uNSOCwPeprHU6b3vddMLWCLqgYZMZflI/nsfoW5SzRn3wJE
nX62h3vC98SgQgUqKieJGwwszTvONvKoyh8oCBkRmSpEk4EauCEdDtxBo/oJjQNwKqTq01AJ2Hgl
9AgHspnGrfPco2Kr2DZehnFihDBFTOYYLkktZHWDfFFUoRCjjpAXGyMCEN4SidOzudaMcWTyBtXV
mCczIMQ0WLDhtugSBYC6oMUW4zRSQM4QVIvylp9pUPGFY24mItEiZ8LzRQ4e6ecI3uxkttk4cpMG
aviiG024v6hrK2bEDgnigKCCMcImayWpNUZyJbXstW2TGRMSqyhT7tmad41gnBoXHQKLI5Nj/F3J
FOFCQZ9xfrw=
--90e6ba6e8146e2b65f04a47de7d6--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
