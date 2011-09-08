From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] small improvement for posix_fadvise.2
Date: Thu, 8 Sep 2011 16:15:08 +0200
Message-ID: <CAKgNAkgShVxwFCPK4onfRBbCiRMbwTdgt_7BHzGvyooAScAvqA@mail.gmail.com>
References: <20101218090427.60588090@keeper.home.local>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=KOI8-R
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20101218090427.60588090-CpVCSV+zb/Ftei/ch0jEm2ZHpeb/A1Y/@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Sat, Dec 18, 2010 at 7:04 AM, Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org> wrote=
:
> Hello.
>
> --- man-pages-git/man2/posix_fadvise.2 =9A2010-11-02 13:41:53.0000000=
00 +0300
> +++ /tmp/posix_fadvise.2 =9A =9A =9A =9A2010-12-18 09:02:43.000000000=
 +0300
> @@ -56,7 +56,7 @@
> =9AThe \fIadvice\fP applies to a (not necessarily existent) region st=
arting
> =9Aat \fIoffset\fP and extending for \fIlen\fP bytes (or until the en=
d of
> =9Athe file if \fIlen\fP is 0) within the file referred to by \fIfd\f=
P.
> -The advice is not binding; it merely constitutes an expectation on b=
ehalf of
> +The \fIadvice\fP is not binding; it merely constitutes an expectatio=
n on behalf of
> =9Athe application.
>
> =9APermissible values for \fIadvice\fP include:


Thanks. Applied for man-pages-3.33.

Cheers,

Michael
--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
