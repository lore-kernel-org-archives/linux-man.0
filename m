From: Christopher Yeoh <cyeoh-8fk3Idey6ehBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH] process_vm_{read,write}v(3): initial man pages
Date: Wed, 21 Mar 2012 13:55:10 +1030
Message-ID: <20120321135510.29380c06@Gantu>
References: <1331358148-17235-1-git-send-email-vapier@gentoo.org>
	<CAKgNAkjhzh+zZ+GhOcbKsZpkeAgn6ua5K=zS=0_AUsUQ3GsQ_A@mail.gmail.com>
	<201203192050.48882.vapier@gentoo.org>
	<CAKgNAkg=3KokH5zFwThOsHt4gaM4fqcauFdmtihCgcFEV8_z1A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKgNAkg=3KokH5zFwThOsHt4gaM4fqcauFdmtihCgcFEV8_z1A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Tue, 20 Mar 2012 19:27:31 +1300
"Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> On Tue, Mar 20, 2012 at 1:50 PM, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
> wrote:
> > On Monday 19 March 2012 16:45:41 Michael Kerrisk (man-pages) wrote:
> >> A quick question about one piece:
> >> > +The count values might be individually capped according to
> >> > \fIUIO_MAXIOV\fP. +If the Linux kernel is capped at smaller
> >> > values, the C library will take care +of emulating the limit it
> >> > exposes (if it is bigger) so the user only needs to +care about
> >> > that (what the C library defines).
> >>
> >> I don't see anything in glibc that does this. Have I missed
> >> something?
> >
> > i think you're correct. =C2=A0the code in glibc atm is merely a
> > syscall(). =C2=A0i think the idea was to have the C library guarant=
ee
> > that and if moving forward the kernel changes, the C library would
> > update by adding a wrapper. =C2=A0maybe just drop this sentence unt=
il
> > that day comes ?
>=20
> So, does the kernel currently impose a limit on the size of the iovec=
?
> It wasn't immediately clear to me from a quick scan of the source.
>=20
>=20

The code calls rw_copy_check_uvector which does check that the iovecs
are smaller than UIO_MAXIOV.

Note that the following bit is not strictly true:
  "So if the counts are too big, or the vectors invalid, or the
  addresses refer to regions that are inaccessible, none of the
  previous vectors will be processed and an +error will be returned
  immediately."

Whilst the code does check that memory regions in the process calling
the system calls are accessible before any work is done, it does not
check the memory regions in the remote process until just before doing
the read/write. So in that case you can end up with a partial
read/write if one of the iovec elements for the remote process points
to an invalid memory region. No further read/writes will be attempted
after this point though.

Regards,

Chris
--=20
cyeoh-hXjcm30GF6XQT0dZR+AlfA@public.gmane.org

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
