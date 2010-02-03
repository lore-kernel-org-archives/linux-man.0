From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: elf.5: EI_BRAND is not exist in Linux
Date: Wed, 3 Feb 2010 07:08:03 +0100
Message-ID: <cfd18e0f1002022208j7e78def6ycee31e0c818b9351@mail.gmail.com>
References: <20100107133046.7d380dcb@keeper.home.local>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20100107133046.7d380dcb-CpVCSV+zb/Ftei/ch0jEm2ZHpeb/A1Y/@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hey Mike,

You've done a patch or two to the elf.5 page in the past. Are you able
to comment on the below? I confirmed Yuri's statement: EI_BRAND isn't
in glibc 2.11 source.

Cheers,

Michael


On Thu, Jan 7, 2010 at 11:30 AM, Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org> wrote=
:
> Hello.
>
> From elf.5:
> =A0e_ident =A0 =A0 This array of bytes specifies to interpret the fil=
e, ...
> =A0 =A0EI_BRAND =A0 =A0Start of architecture identification.
>
> Value for EI_BRAND is not defined in the linux/elf.h (and gabi too).
> Maybe add some comment, that is for *BSD only?
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
