From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] prctl.2
Date: Tue, 1 May 2012 17:42:48 +1200
Message-ID: <CAKgNAkjTQCPo4GcM-jPv8r8gNbhJWTWV4sf9qJPOt-59vAgE_g@mail.gmail.com>
References: <20120430141425.08ed0175@keeper.home.local>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=KOI8-R
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120430141425.08ed0175-CpVCSV+zb/Ftei/ch0jEm2ZHpeb/A1Y/@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Mon, Apr 30, 2012 at 10:14 PM, Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org> wrot=
e:
> Hello.

Thanks. Applied!

Cheers,

Michael

> --- man-pages-git/man2/prctl.2 =9A2012-04-29 11:15:54.881831526 +0400
> +++ /tmp/prctl.2 =9A =9A =9A =9A2012-04-30 14:12:59.192008396 +0400
> @@ -224,7 +224,7 @@
> =9AThis value is cleared for the child of a
> =9A.BR fork (2)
> =9Aand (since Linux 2.5.36 / 2.6.23)
> -when execing a set-user_ID or set-group-ID binary.
> +when executing a set-user_ID or set-group-ID binary.
> =9A.TP
> =9A.BR PR_GET_PDEATHSIG " (since Linux 2.3.15)"
> =9AReturn the current value of the parent process death signal,
>
> --
> Best Regards,
> Yuri Kozlov
>



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
