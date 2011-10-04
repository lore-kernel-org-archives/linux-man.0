From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: aio(7) and the aio_* pages
Date: Tue, 4 Oct 2011 07:44:29 +0200
Message-ID: <CAKgNAkgd5q3UiG+0kLB4Kq9fgVK+xk124nqLdX0bq9sLVf1_dg@mail.gmail.com>
References: <CAGc9Evcy_gas=qGzJp7gq_9DUCq7ff3SRfkfbuuF=Nbfz3eWhA@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAGc9Evcy_gas=qGzJp7gq_9DUCq7ff3SRfkfbuuF=Nbfz3eWhA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Grant <jg-hus3n9K41k0@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Jon,

On Mon, Oct 3, 2011 at 8:34 PM, Jon Grant <jg-hus3n9K41k0@public.gmane.org> wrote:
> Hello
>
> I noticed that aio(7) contains a description of the each function,
> e.g. aio_read(3). I noticed that descriptions are a little different.
> Could the text be the same for both? I don't intend this to sound
> pedantic! The pages are great :)
>
>
> e.g.
>
> http://man7.org/linux/man-pages/online/pages/man7/aio.7.html
>
> "aio_cancel(3) =A0 Attempt to cancel outstanding I/O requests on a sp=
ecified file
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 descriptor."
>
> "aio_suspend(3) =A0Suspend the caller until one or more of a specifie=
d set of I/O
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 requests completes."
>
>
>
> http://man7.org/linux/man-pages/online/pages/man3/aio_cancel.3.html
> "aio_cancel - cancel an outstanding asynchronous I/O request"
>
> http://man7.org/linux/man-pages/online/pages/man3/aio_suspend.3.html
> "aio_suspend - wait for asynchronous I/O operation or timeout"

The one line descriptions in the SH section of man pages are usually
always very short. aio(7) had room to allow for longer descriptions. I
don't think any change is needed.

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
