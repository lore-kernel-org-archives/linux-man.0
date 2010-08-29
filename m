From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: write(2) man page missing error code
Date: Sun, 29 Aug 2010 15:52:45 +0200
Message-ID: <AANLkTi=Qqd5BBMjuXbxqOPJ0ZYv9LE3ckuiCF3ne0uHq@mail.gmail.com>
References: <E2C0377E93FA8B4194658987E40226F001073EDC@UUSMNEL1.na.utcmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <E2C0377E93FA8B4194658987E40226F001073EDC-JC38xCScHSXe46enX5xh1IkgB36zAFJh@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Sutin, Brian M HS" <Brian.Sutin-ErF4HNK4sl3QT0dZR+AlfA@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Brian,

On Thu, Aug 26, 2010 at 10:30 PM, Sutin, Brian M            HS
<Brian.Sutin-ErF4HNK4sl3QT0dZR+AlfA@public.gmane.org> wrote:
> Manpages-dev 3.23-1
> Linux 2.6.32-24
> Ubuntu Lucid
>
> I am getting the error code EDESTADDRREQ from a write() to a udp port=
=2E =A0It isn't mentioned in the man page as a possibility.

Thanks for the report. For upstream man-pages-3.26, I added the followi=
ng

--- a/man2/write.2
+++ b/man2/write.2
@@ -128,6 +128,11 @@ so a portable application should check for both
possibilities.
 .I fd
 is not a valid file descriptor or is not open for writing.
 .TP
+.B EDESTADDRREQ
+.I fd
+refers to a datagram socket for which a peer address has not been set =
using
+.BR connect (2).
+.TP
 .B EFAULT
 .I buf
 is outside your accessible address space.


Cheers,

Michael

--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface" http://blog.man7.org/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
