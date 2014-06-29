From: Rich Felker <dalias-8zAoT0mYgF4@public.gmane.org>
Subject: Re: Very bad advice in man 2 dup2
Date: Sun, 29 Jun 2014 11:07:33 -0400
Message-ID: <20140629150733.GZ179@brightrain.aerifal.cx>
References: <20140529210242.GP507@brightrain.aerifal.cx>
 <53884C27.7020207@gmail.com>
 <CAKgNAkhFJ6-_RKfTFXYxAAU3jw-ij9ojgeO9G=V9L-WgKZQ62w@mail.gmail.com>
 <CAKgNAkjdM2ZLY6B4==9Pz1kz4X48NTiq7rnSttbALwJV8ru79g@mail.gmail.com>
 <20140629030554.GW179@brightrain.aerifal.cx>
 <53AFC455.8080707@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <53AFC455.8080707-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Sun, Jun 29, 2014 at 09:46:29AM +0200, Michael Kerrisk (man-pages) w=
rote:
> > This code looks like it works, but it's a lot to be recommending
> > without a really good reason to do so.=20
>=20
> Well, I think the para that precedes the code goes some way toward=20
> explaining why you might want to do this.

I assume you're referring to this text:

       If newfd was open, any errors that would have been reported  at
       close(2) time are lost.  If this is of concern, then=E2=80=94unl=
ess the

The one addition I think would be helpful is some mention of what
exactly these "any errors" might be.

> > I seem to remember someone
> > claiming that the whole "need" to check for error on close is outda=
ted
> > and not applicable to modern Linux (even with NFS?) but I can't
>=20
> All the world is not Linux. And in the future, even Linux
> behavior might change. And I do not recall the details,

My impression is that the kernel folks regard the possibility of error
from close as a design flaw, and would not add additional cases where
it could occur. I can search for citations backing this up.

> but as far as I know some NFS errors can be delivered on=20
> close(). So, it seems to me that robust applications should=20
> check the status from close.

The standards still allow fairly arbitrary failure in a number of
interfaces where there's no reasonable way for an application to
proceed on failure (e.g. pthread_mutex_unlock failing). Many of the
hypothetical errors close can return are borderline for being of this
type.

Conceptually, the failures that potentially happen at the time of
close are equivalent to hardware-level IO errors, which an application
would not detect even on local devices unless (at the very least) it
called fsync after writing. Plenty of applications don't do the latter
(and indeed it's harmful from the standpoint of many users because it
thrashes the disk).

> > remember where. Anyway I think such code should be accompanied by a
> > discussion of why one might care about checking for close errors so
> > programmers can make an informed decision about whether it's worth =
the
> > trouble rather than cargo-culting it.
>=20
> There is some text on this in the close(2) page.

Reading it now.

One thing that should be noted is that your advice for EINTR is
Linux-specific and contrary to the (new) requirements of POSIX which
make EINTR for close consistent with all other interfaces. (See
http://austingroupbugs.net/view.php?id=3D529 for details.) Fortunately
on Linux, as far as I can tell, close never fails with EINTR unless
you write a custom device driver that makes it possible.

Also are you sure the disk quotas text is correct? I can't imagine how
disk quotas could be implemented such that the quota would be enforced
at close time rather than write time.

Anyway, I think referencing the  notes in close(2) would be a good
step for the dup2 man page, but I still think without stronger,
up-to-date details on situations in which close could fail (to allow
programmers to make an educated decision), it all comes across as
promoting cargo-culting.

> So, for the moment, the text as I gave it, is in. It's certainly
> an improvement over what was there before. If you feel strongly that=20
> further a change is needed, please send me a patch (or carefully
> worded free text that I can drop into the page).

I agree fully that it's an improvement. If anything else comes out of
this discussion maybe it can be added later.

Rich
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
