From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: incomplete si_codes for waitid(2) [patch available]
Date: Tue, 21 Apr 2009 16:45:50 +1200
Message-ID: <cfd18e0f0904202145u498f2469vf98b688df70ac499@mail.gmail.com>
References: <49E758A8.1080406@gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <49E758A8.1080406-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gokdeniz Karadag <gokdenizk-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi,

On Fri, Apr 17, 2009 at 4:11 AM, Gokdeniz Karadag <gokdenizk-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>=
 wrote:
> Hi,
>
> In a program I was debugging, waitid(2) returned a strange value in s=
iginfo_t
> structure's si_code field. It was different that those stated in the =
man page
> for waitid(2) [ waitid(2) man page is the same as wait(2) ].
>
> When I looked at the relevant file "/usr/include/bits/siginfo.h" ther=
e were two
> more values for si_code:
>
> =A0CLD_DUMPED, =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* Child terminate=
d abnormally. =A0*/
> =A0CLD_TRAPPED, =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/* Traced child ha=
s trapped. =A0*/
>
> I was getting CLD_DUMPED value along with core dumps so I state that =
as an
> example in the patch. =A0I'm not sure about how a process can get CLD=
_TRAPPED but
> I include it for completeness' sake.
>
> The diff applies to today's git version.

Thanks for spotting that.  I tweaked your patch a little to make the
text as follows:

[[
=2EB CLD_DUMPED
(child killed by signal, and dumped core);
=2EB CLD_TRAPPED
(traced child has trapped); or
]]

The change will be in man-pages-3.22.

Thanks,

Michael

> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D diff =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
>
> diff --git a/man2/wait.2 b/man2/wait.2
> index c95ff2c..4028fae 100644
> --- a/man2/wait.2
> +++ b/man2/wait.2
> @@ -310,6 +310,10 @@ Set to one of:
> =A0.BR _exit (2));
> =A0.B CLD_KILLED
> =A0(child killed by signal);
> +.B CLD_DUMPED
> +(child terminated abnormally, ie. core dump);
> +.B CLD_TRAPPED
> +(child has trapped while being traced);
> =A0.B CLD_STOPPED
> =A0(child stopped by signal); or
> =A0.B CLD_CONTINUED
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
>
> --
> Gokdeniz Karadag
>
>



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
git://git.kernel.org/pub/scm/docs/man-pages/man-pages.git
man-pages online: http://www.kernel.org/doc/man-pages/online_pages.html
=46ound a bug? http://www.kernel.org/doc/man-pages/reporting_bugs.html
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
