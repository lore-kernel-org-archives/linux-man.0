From: Patrick McLean <patrickm-aTCcZBytkHbQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] document FIONREAD on pipe
Date: Mon, 26 Sep 2016 13:18:29 -0700
Message-ID: <CAE2NFgWzwoCYo5HxNBPLWPvTAoMUdP_ksfmrDPDRohRjjOfPig@mail.gmail.com>
References: <CAE2NFgU-hfRvNBxDBhN9=QpZ2AVwmNxx-kCXNajcRv0wfrwYPQ@mail.gmail.com>
 <453f4338-96aa-63de-339f-ce53a44bebd3@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <453f4338-96aa-63de-339f-ce53a44bebd3-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, David Coles <coles.david-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Roderick Colenbrander <roderick-aTCcZBytkHbQT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

That sounds good to me, thanks.

On Sun, Sep 25, 2016 at 3:10 AM, Michael Kerrisk (man-pages)
<mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Hello Patrick
>
> On 09/24/2016 12:17 AM, Patrick McLean wrote:
>> The FIONREAD ioctl can be used on a pipe to get the current amount of
>> data in the pipe. This ioctl is currently only documented in tty_ioctl
>> (4). This adds a blurb to the pipe(7) man page about this ioctl.
>
> Thanks for the patch. In the end, I wrote something more extensive.
> See below.
>
> Cheers,
>
> Michael
>
> diff --git a/man7/pipe.7 b/man7/pipe.7
> index 9977acc..b6a3007 100644
> --- a/man7/pipe.7
> +++ b/man7/pipe.7
> @@ -143,6 +143,21 @@ operations.
>  See
>  .BR fcntl (2)
>  for more information.
> +
> +The following
> +.BR ioctl (2)
> +operation, which can be applied to a file descriptor
> +that refers to either end of a pipe,
> +places a count of the number of unread bytes in the pipe in the
> +.I int
> +buffer pointed to by the final argument of the call:
> +
> +    ioctl(fd, FIONREAD, &nbytes);
> +
> +The
> +.B FIONREAD
> +operation is not specified in any standard,
> +but is provided on many implementations.
>
> --
> Michael Kerrisk
> Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
> Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
