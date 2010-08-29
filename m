From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: small improvement for st.4
Date: Sun, 29 Aug 2010 06:35:09 +0200
Message-ID: <AANLkTi=NoA9WScpbTWM_v=kJoqHQ5F9FUKMhQNAZ6tx_@mail.gmail.com>
References: <20100731144909.528c8104@keeper.home.local>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=KOI8-R
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20100731144909.528c8104-CpVCSV+zb/Ftei/ch0jEm2ZHpeb/A1Y/@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Yuri,

Thanks. Applied for 3.26.

Cheers,

Michael

On Sat, Jul 31, 2010 at 12:49 PM, Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org> wrot=
e:
> Hello.
>
> --- man-pages-git/man4/st.4 =9A =9A 2010-03-26 17:46:41.000000000 +03=
00
> +++ /tmp/st.4 =9A 2010-07-31 14:48:15.000000000 +0400
> @@ -490,6 +490,7 @@
> =9AIf this option is false and the drive uses a fixed block size, the=
n
> =9Aall write operations must be for a multiple of the block size.
> =9AThis option must be set false to write reliable multivolume archiv=
es.
> +.TP
> =9A.BR MT_ST_ASYNC_WRITES " (Default: true)"
> =9AWhen this option is true, write operations return immediately with=
out
> =9Awaiting for the data to be transferred to the drive if the data fi=
ts
>
>
> --
> Best Regards,
> Yuri Kozlov
>
>



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface" http://blog.man7.org/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
