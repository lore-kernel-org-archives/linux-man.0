From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [PATCH] open.2: add some comments on O_SYNC and friends
Date: Sun, 20 Sep 2009 07:41:34 +0200
Message-ID: <cfd18e0f0909192241y5b45aa79u305f1e8e3295aea9@mail.gmail.com>
References: <20090827180004.GA31605@lst.de>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20090827180004.GA31605-jcswGhMUV9g@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Christoph,

Thanks for the patch. A few comments below.

On Thu, Aug 27, 2009 at 8:00 PM, Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org> wrote:
> The language probably needs some editing, but this was the best
> I could come up with.
>
>
> Signed-off-by: Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>
>
> Index: man-pages/man2/open.2
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- man-pages.orig/man2/open.2 =A02009-08-27 14:43:43.589383500 -0300
> +++ man-pages/man2/open.2 =A0 =A0 =A0 2009-08-27 14:51:01.729354515 -=
0300
> @@ -276,12 +276,12 @@ The following symbolic constants are pro
> =A0Try to minimize cache effects of the I/O to and from this file.
> =A0In general this will degrade performance, but it is useful in
> =A0special situations, such as when applications do their own caching=
=2E
> -File I/O is done directly to/from user space buffers.
> -The I/O is synchronous, that is, at the completion of a
> -.BR read (2)
> -or
> -.BR write (2),
> -data is guaranteed to have been transferred.
> +File I/O is done directly to/from user space buffers. =A0The
> +\fBO_DIRECT\fP flag alone does make at an effort to transfer
> +data synchronously, but does not give the guarantees of the
> +\fBO_SYNC\fP that data and nessecary data must be transferred.

Here I wrote "data and necessary metadata".
Okay?

> +To guarantee synchronous I/O the \fBO_SYNC\fP must be used
> +in addition to \fBO_DIRECT\fP.
> =A0See
> =A0.B NOTES
> =A0below for further discussion.
> @@ -661,8 +661,14 @@ amongst others
>
> =A0POSIX provides for three different variants of synchronized I/O,
> =A0corresponding to the flags \fBO_SYNC\fP, \fBO_DSYNC\fP and
> -\fBO_RSYNC\fP.
> -Currently (2.1.130) these are all synonymous under Linux.
> +\fBO_RSYNC\fP. =A0Currently (2.6.31) Linux only implements the
> +\fBO_SYNC\fP but glibc maps \fBO_DSYNC\fP and \fBO_SYNC\fP to
> +the same numerical value.

Here, I made it

    but glibc maps O_DSYNC and O_RSYNC to
    the same numerical value as O_SYNC.

Okay?

> +the same numerical value
> Most Linux filesystems do however not
> +actually implement the Posix \fBO_SYNC\fP, semantics which
> +require all metadata updates of a write to be on disk on returning
> +to userspace, but only the \fBO_DSYNC\fP semantics, which require
> +only actual file data and metadata nessecary to retreive it to
> +be on disk by the time the system call returns.
>
> =A0Note that
> =A0.BR open ()

Aside from the changes notes above, and some language clean-ups, I
applied your patch as given, for man-pages-3.23.

Cheers,

Michael


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Watch my Linux system programming book progress to publication!
http://blog.man7.org/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
