From: "Michael Kerrisk" <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: memmove.3 description error
Date: Wed, 23 Jul 2008 13:30:53 +0200
Message-ID: <cfd18e0f0807230430x8326155p7b61ac4d7f5898a3@mail.gmail.com>
References: <48870EDA.8040908@mark13.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <48870EDA.8040908-0qgFeOjsUbEdnm+yROfE0A@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?Mark-Andr=E9_Hopf?= <mhopf-0qgFeOjsUbEdnm+yROfE0A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Mark-Andr=E9,

On Wed, Jul 23, 2008 at 12:58 PM, Mark-Andr=E9 Hopf <mhopf-0qgFeOjsUbEdnm+yROfE0A@public.gmane.org> =
wrote:
> The memmove page in release 2.79 states that a temporary copy is used=
 in
> case the memory regions overlap. This is of course nonsense.
> The memory is either copied from front to back or from back to front.

Careful!  The page says:

    copying takes place *as though*...

And that is the crucial point.  How exactly the copying is done
(copied from front to back or from back to front), is an
implementation detail.

Before man-pages-2.55 this page did not contain the "as though" piece.
 It just said that "The memory areas may overlap."  Someone (rightly)
complained that the page didn't say what the semantics were if the
areas *did* overlap, and so the current text was added.  That text is
similar to what POSIX.1 says for memmove.3.

So, I'm not applying this patch, but thanks for taking the time to
make your report.  (I suppose I might consider a patch that mentioned
something about the implementation details under NOTES, if you could
provide me with enough reason to do so.)

Cheers,

Michael


> --- memmove.3.orig      2008-07-23 12:51:56.000000000 +0200
> +++ memmove.3   2008-07-23 12:53:20.000000000 +0200
> @@ -39,15 +39,7 @@
>  .BR memmove ()
>  function copies \fIn\fP bytes from memory area
>  \fIsrc\fP to memory area \fIdest\fP.
> -The memory areas may overlap: copying takes place as though
> -the bytes in
> -.I src
> -are first copied into a temporary array that does not overlap
> -.I src
> -or
> -.IR dest ,
> -and the bytes are then copied from the temporary array to
> -.IR dest .
> +The memory areas may overlap.
>  .SH "RETURN VALUE"
>  The
>  .BR memmove ()
>



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
man-pages online: http://www.kernel.org/doc/man-pages/online_pages.html
=46ound a bug? http://www.kernel.org/doc/man-pages/reporting_bugs.html
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
