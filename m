From: Rich Felker <dalias-8zAoT0mYgF4@public.gmane.org>
Subject: Re: Very bad advice in man 2 dup2
Date: Sat, 28 Jun 2014 23:05:54 -0400
Message-ID: <20140629030554.GW179@brightrain.aerifal.cx>
References: <20140529210242.GP507@brightrain.aerifal.cx>
 <53884C27.7020207@gmail.com>
 <CAKgNAkhFJ6-_RKfTFXYxAAU3jw-ij9ojgeO9G=V9L-WgKZQ62w@mail.gmail.com>
 <CAKgNAkjdM2ZLY6B4==9Pz1kz4X48NTiq7rnSttbALwJV8ru79g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAKgNAkjdM2ZLY6B4==9Pz1kz4X48NTiq7rnSttbALwJV8ru79g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Thu, Jun 12, 2014 at 08:53:38PM +0200, Michael Kerrisk (man-pages) w=
rote:
> Another ping....

Sorry for not getting back to you on this!

> >>> Here is a proposed alternate text that was recommended to me by a=
 user
> >>> on Stack Overflow:
> >>
> >> It'd be great to add URLs when citing such discussions... With som=
e
> >> effort, I found
> >> http://stackoverflow.com/questions/23440216/race-condition-when-us=
ing-dup
> >>
> >>>     A careful programmer will first dup() the target descriptor, =
then
> >>>     use dup2()/dup3() to replace the target descriptor atomically=
, and
> >>>     finally close the initially duplicated target descriptor. Thi=
s
> >>>     replaces the target descriptor atomically, but also retains a
> >>>     duplicate for closing so that close-time errors may be checke=
d
> >>>     for. (In Linux, close() should only be called once, as the
> >>>     referred to descriptor is always closed, even in case of
> >>>     errno=3D=3DEINTR.)
> >>>
> >>> I'm not sure this is the best wording, since it suggests doing a =
lot
> >>> of work that's likely overkill (and useless in the case where the
> >>> target descriptor was read-only, for instance). I might balance s=
uch
> >>> text with a warning that it's an error to use dup2 or dup3 when t=
he
> >>> target descriptor is not known to be open unless you know the cod=
e
> >>> will only be used in single-threaded programs. And I'm a little b=
it
> >>> hesitant on the parenthetical text about close() since the behavi=
or
> >>> it's documenting is contrary to the requirements of the upcoming =
issue
> >>> 8 of POSIX,
> >>
> >> Again citing the Issue 8 discussion would be helpful. Could
> >> you tell me where it is? (It could be useful for the change log.)

See the issue that added all the new atomic close-on-exec operations:
http://austingroupbugs.net/view.php?id=3D411

    The resolution of 0000149 documented that using close( ) on
    arbitrary file descriptors is unsafe, and that applications should
    instead atomically create file descriptors with FD_CLOEXEC already
    set. [...]

And the issue referenced there:
http://austingroupbugs.net/view.php?id=3D149

> >>> and rather irrelevant since EINTR cannot happen in Linux's
> >>> close() except with custom device drivers anyway.
> >>
> >> So, how about something like the following (code not
> >> compile-tested...):
> >>
> >>        If newfd was open, any errors that would have been reported=
  at
> >>        close(2) time are lost.  If this is of concern, then=E2=80=94=
unless the
> >>        program is single-threaded and does not allocate file  desc=
rip=E2=80=90
> >>        tors  in  signal  handlers=E2=80=94the correct approach is =
not to close
> >>        newfd before calling dup2(),  because  of  the  race  condi=
tion
> >>        described  above.   Instead,  code something like the follo=
wing
> >>        could be used:
> >>
> >>            /* Obtain a duplicate of 'newfd' that can subsequently
> >>               be used to check for close() errors; an EBADF error
> >>               means that 'newfd' was not open. */
> >>
> >>            tmpfd =3D dup(newfd);
> >>            if (tmpfd =3D=3D -1 && errno !=3D EBADF) {
> >>                /* Handle unexpected dup() error */
> >>            }
> >>
> >>            /* Atomically duplicate 'oldfd' on 'newfd' */
> >>
> >>            if (dup2(oldfd, newfd) =3D=3D -1) {
> >>                /* Handle dup2() error */
> >>            }
> >>
> >>            /* Now check for close() errors on the file originally
> >>               referred to by 'newfd' */
> >>
> >>            if (tmpfd !=3D -1) {
> >>                if (close(tmpfd) =3D=3D -1) {
> >>                    /* Handle errors from close */
> >>                }
> >>            }

This code looks like it works, but it's a lot to be recommending
without a really good reason to do so. I seem to remember someone
claiming that the whole "need" to check for error on close is outdated
and not applicable to modern Linux (even with NFS?) but I can't
remember where. Anyway I think such code should be accompanied by a
discussion of why one might care about checking for close errors so
programmers can make an informed decision about whether it's worth the
trouble rather than cargo-culting it.

Rich
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
