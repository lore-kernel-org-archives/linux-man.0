From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] wcsncmp.3
Date: Sun, 29 Apr 2012 22:22:59 +1200
Message-ID: <CAKgNAkiRy_ZoO2zWmGkAPD8VJPmcbv6EmFOPx6HK-jMzCZ0KCQ@mail.gmail.com>
References: <20120429084646.25f0dc12@keeper.home.local>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=KOI8-R
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120429084646.25f0dc12-CpVCSV+zb/Ftei/ch0jEm2ZHpeb/A1Y/@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks Yuri. Applied!

On Sun, Apr 29, 2012 at 4:46 PM, Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org> wrote=
:
> Hello.
>
> --- man3/wcsncmp.3 =9A =9A =9A2011-10-11 21:53:58.862937897 +0400
> +++ /tmp/wcsncmp.3 =9A =9A =9A2012-04-29 08:45:26.406282573 +0400
> @@ -30,7 +30,7 @@
> =9Awide-character string pointed to by \fIs2\fP, but at most \fIn\fP =
wide
> =9Acharacters from each string.
> =9AIn each string, the comparison extends only up
> -to the first occurrence of a nulll wide character (L\(aq\\0\(aq), if=
 any.
> +to the first occurrence of a null wide character (L\(aq\\0\(aq), if =
any.
> =9A.SH "RETURN VALUE"
> =9AThe
> =9A.BR wcsncmp ()
>
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
