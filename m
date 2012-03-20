From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: ld.so.8: formatting fix
Date: Tue, 20 Mar 2012 23:09:21 +1300
Message-ID: <CAKgNAkgSh-V0ZjNnwK2+cnCg5Qx-k+4RwQqwzZ60BoG_TgxJnQ@mail.gmail.com>
References: <CAMqf4EHbGwsucygbk4cw+cjjH=1Uh0tktai9mi7zcfrJJRhnpw@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAMqf4EHbGwsucygbk4cw+cjjH=1Uh0tktai9mi7zcfrJJRhnpw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "D. Barbier" <bouzim-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Denis,

On Sat, Mar 10, 2012 at 8:47 AM, D. Barbier <bouzim-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Hello,
>
> diff --git a/man8/ld.so.8 b/man8/ld.so.8
> index 5c02204..2fbacae 100644
> --- a/man8/ld.so.8
> +++ b/man8/ld.so.8
> @@ -126,6 +126,7 @@ Ignore RPATH and RUNPATH information in object
> names in LIST.
> =A0This option is ignored if
> =A0.B ld.so
> =A0is set-user-ID or set-group-ID.
> +.TP
> =A0.B \-\-audit LIST
> =A0Use objects named in LIST as auditors.
> =A0.SH ENVIRONMENT

Applied for 3.38.

Thanks,

Michael

--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
