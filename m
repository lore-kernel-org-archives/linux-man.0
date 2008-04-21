From: "Michael Kerrisk" <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [PATCH] utimensat() non-conformances and fixes
Date: Mon, 21 Apr 2008 17:41:57 +0200
Message-ID: <cfd18e0f0804210841v600c9e7w5081146a68590630@mail.gmail.com>
References: <47FA9DA1.8040508@gmail.com> <480C323B.3060608@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <480C323B.3060608-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ulrich Drepper <drepper-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Mon, Apr 21, 2008 at 8:20 AM, Ulrich Drepper <drepper-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Michael Kerrisk wrote:
> > 1. The draft POSIX.1-200x specification for utimensat() says that if a
> > times[n].tv_nsec field is UTIME_OMIT or UTIME_NOW, then the value in the
> > corresponding tv_sec field is ignored.  However the current Linux
> > implementation requires the tv_sec value to be zero (or the EINVAL error
> > results).  This requirement should be removed.
>
> OK, for now.  I think the implemented behavior is better, though.

My only real objection to the implemented behavior is that it doesn't
follow the spec.  It doesn't seem unreasonable to change the spec
here.  Or is it already too late for that?  (I suppose it may well
be.)

> > However, the current implementation does not generate
> > EPERM if one tv_nsec field is UTIME_NOW while the other is UTIME_OMIT -- it
> > should give this error for that case.
>
> This is probably a necessary change.  Non-synchronized changes might be
> a security problem.

Yes.

> > However, in
> > the same circumstances, when utimensat() is given a 'times' array in which
> > both tv_nsec fields are UTIME_NOW, which provides equivalent functionality
> > to specifying 'times' as NULL, the call succeeds.  I think that it should fail
> > with the error EACCES in this case.
>
> I guess so.

Ok.

> > (times == NULL && times[0].tv_nsec == UTIME_NOW && times[1].tv_nsec ==
> > UTIME_NOW)
> >
> > case should be treated like the traditional utimes() case where 'times'
> > is NULL.  That is, the call should succeed for a file marked append-only
> > and should give the error EACCES if the file is marked as immutable.
>
> Is this something I changed?  I doubt I added this.

Well, I just went away and tested yet again, and utime[s]() with a
NULL second argument gives the behavior I describe (and always did) --
and utimensat() should behave the same way for the
(times == NULL && times[0].tv_nsec == UTIME_NOW && times[1].tv_nsec ==
UTIME_NOW)
case, but does not.

Cheers,

Michael

-- 
Michael Kerrisk
Maintainer of the Linux man-pages project
http://www.kernel.org/doc/man-pages/
Want to report a man-pages bug? Look here:
http://www.kernel.org/doc/man-pages/reporting_bugs.html
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
