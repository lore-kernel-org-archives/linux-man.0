From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] fallocate.2: mention <linux/falloc.h> for flag definitions
Date: Wed, 21 Sep 2011 06:30:57 +0200
Message-ID: <CAKgNAkhRPoo2-LH59wno9aYgst_fwmjUH8vbjt5g03_MrLdD2w@mail.gmail.com>
References: <1307571453-29756-1-git-send-email-egouriou@google.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1307571453-29756-1-git-send-email-egouriou-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eric Gouriou <egouriou-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Ulrich Drepper <drepper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Dave Chinner <dchinner-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Nauman Rafique <nauman-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello Eric,

I am not sure of the right answer to your initial question. Ulrich
Drepper should be able to tell us.

On Thu, Jun 9, 2011 at 12:17 AM, Eric Gouriou <egouriou-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org> wro=
te:
> Document that <linux/falloc.h> is needed to have the definition
> of FALLOC_FL_* flags.

I was about to apply this patch, and then I realized that the problem
may be really lie outside the man page.

Ulrich, the glibc headers declare Linux's fallocate() syscall is
_GNU_SOURCE is defined, but not the associated FALLOC_FL_PUNCH_HOLE
and FALLOC_FL_KEEP_SIZE constants. Probably this needs to be fixed. Is
this a glibc lack or is it that the constants are not exported from
kernel headers in the way that glibc needs?

> ---
> Notes:
> 1) <linux/falloc.h> also defines fallocate(), so one does not have
> to include <fcntl.h> or define _GNU_SOURCE when <linux/falloc.h> is u=
sed.
> However it is true that including <fcntl.h> defines fallocate() if an=
d only
> if _GNU_SOURCE is defined.

Yes, but probably don't need to document this. See my question to Ulric=
h above.

> Please let me know if this kind of minutiae deserves to be noted in
> the page. If so, please direct me to other pages I could use as guide=
s
> on how to convey such subtleties.
>
> 2) Currently only FALLOC_FL_KEEP_SIZE is defined. In progress patches
> may add FALLOC_FL_PUNCH_HOLE when they land.

See the other mail that I just CCed you.

Cheers,

Michael


> ---
> =A0man2/fallocate.2 | =A0 =A01 +
> =A01 files changed, 1 insertions(+), 0 deletions(-)
>
> diff --git a/man2/fallocate.2 b/man2/fallocate.2
> index 42eefbd..963c39f 100644
> --- a/man2/fallocate.2
> +++ b/man2/fallocate.2
> @@ -9,6 +9,7 @@ fallocate \- manipulate file space
> =A0.nf
> =A0.BR "#define _GNU_SOURCE" " =A0 =A0 =A0 =A0 =A0 =A0 /* See feature=
_test_macros(7) */"
> =A0.B #include <fcntl.h>
> +.BR "#include <linux/falloc.h>" " =A0 =A0 =A0 /* For FALLOC_FL_* def=
initions */"
>
> =A0.BI "int fallocate(int " fd ", int " mode ", off_t " offset \
> =A0", off_t " len ");
> --
> 1.7.3.1
>
>



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
