From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: small improvement for fd.4
Date: Sun, 29 Aug 2010 06:48:00 +0200
Message-ID: <AANLkTinM+5B-zrs9wHwvVJ2ukwc+4AjTBKfvg8kOP+=s@mail.gmail.com>
References: <20100724082640.17bf7e97@keeper.home.local>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=KOI8-R
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20100724082640.17bf7e97-CpVCSV+zb/Ftei/ch0jEm2ZHpeb/A1Y/@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Yuri,

On Sat, Jul 24, 2010 at 6:26 AM, Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org> wrote=
:
> Hello.
> --- man-pages-git/man4/fd.4 =9A =9A 2010-03-26 17:46:41.000000000 +03=
00
> +++ /tmp/fd.4 =9A 2010-07-24 08:25:43.000000000 +0400
> @@ -187,7 +187,7 @@
> =9A.PP
> =9AFor more precise information, consult also the \fI<linux/fd.h>\fP =
and
> =9A\fI<linux/fdreg.h>\fP include files, as well as the manual page fo=
r
> -floppycontrol.
> +floppycontrol(1).
> =9A.SH FILES
> =9A/dev/fd*
> =9A.SH NOTES

Thanks for reporting this. I made a slightly different change:

--- a/man4/fd.4
+++ b/man4/fd.4
@@ -186,8 +186,9 @@ resets the floppy controller under certain conditio=
ns.
 sends a raw command to the floppy controller.
 .PP
 For more precise information, consult also the \fI<linux/fd.h>\fP and
-\fI<linux/fdreg.h>\fP include files, as well as the manual page for
-floppycontrol.
+\fI<linux/fdreg.h>\fP include files, as well as the
+.BR floppycontrol (1)
+manual page.
 .SH FILES
 /dev/fd*
 .SH NOTES

Thanks,

Michael

--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface" http://blog.man7.org/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
