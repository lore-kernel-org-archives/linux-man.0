From: Cyrill Gorcunov <gorcunov-GEFAQzZX7r8dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2] prctl: Add PR_SET_MM option description
Date: Tue, 6 Mar 2012 22:22:10 +0400
Message-ID: <20120306182210.GJ29367@moon>
References: <1330518197-12825-1-git-send-email-gorcunov@openvz.org>
 <1330518197-12825-2-git-send-email-gorcunov@openvz.org>
 <CAKgNAkiOY-p7duD_wfed_Tk8T8SR5r1JCTa=0ne3-VQ30mQE-g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAKgNAkiOY-p7duD_wfed_Tk8T8SR5r1JCTa=0ne3-VQ30mQE-g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Pavel Emelyanov <xemul-bzQdu9zFT3WakBO8gow8eQ@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Tejun Heo <tj-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Wed, Mar 07, 2012 at 07:00:14AM +1300, Michael Kerrisk (man-pages) w=
rote:
> Hi Cyrill,
>=20
> Just a couple of comments for the moment.
>=20
> On Thu, Mar 1, 2012 at 1:23 AM, Cyrill Gorcunov <gorcunov-GEFAQzZX7r8dnm+yROfE0A@public.gmane.org>=
 wrote:
> > Signed-off-by: Cyrill Gorcunov <gorcunov-GEFAQzZX7r8dnm+yROfE0A@public.gmane.org>
> > CC: Tejun Heo <tj-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> > CC: Pavel Emelyanov <xemul-bzQdu9zFT3WakBO8gow8eQ@public.gmane.org>
> > ---
> > =A0man2/prctl.2 | =A0104 ++++++++++++++++++++++++++++++++++++++++++=
++++++++++++++++
> > =A01 files changed, 104 insertions(+), 0 deletions(-)
> >
> > diff --git a/man2/prctl.2 b/man2/prctl.2
> > index effad2a..4d6244f 100644
> > --- a/man2/prctl.2
> > +++ b/man2/prctl.2
> > @@ -378,6 +378,110 @@ Return the current per-process machine check =
kill policy.
> > =A0All unused
> > =A0.BR prctl ()
> > =A0arguments must be zero.
> > +.TP
> > +.BR PR_SET_MM " (since Linux 3.3)"
> > +Allows a user to modify certain kernel memory map descriptor field=
s
> > +of the calling process.
> > +Usually these fields are set by the kernel and dynamic loader (see
> > +.BR ld.so (8)
> > +for more information) and a regular application should not use thi=
s feature.
> > +Still there are cases such as self-modifying programs, where a pro=
gram might
> > +find it useful to change its own memory map.
>=20
> By the way, do you have a *simple* program that demonstrates some
> usage of R_SET_MM?

Hi Michael,

well, at moment we've only crtools itself which uses this facility,
so if we need complete standalone example I need to think about it.

>=20
> > +The kernel must be built with
> > +.BR CONFIG_CHECKPOINT_RESTORE
> > +option turned on, otherwise this feature will not be accessible
> > +from a user space level.
> > +The calling process must have
> > +.BR CAP_SYS_ADMIN
> > +(see
> > +.BR capabilities (7)
> > +for details) capability granted.
>=20
> As we discussed earlier (offlist), there are probably better choices
> than the hugely overloaded CAP_SYS_ADMIN (see
> http://man7.org/linux/man-pages/man7/capabilities.7.html). And if the
> capability governing PR_SET_MM is to change, then it would be good to
> do so before 3.3 is released. What are the plans on this point?
>=20

Yeah, I thought about changing it to CAP_SYS_RESOURCE here.
And I'll post a patch. The problem at moment that there another
two snippets needed for prctl -- ability to set new /proc/pid/exe
symlink and to obtaine clear-tid-address. So there is a discussion
now about symlink change. Once we finish with it -- i'll post
update for capability.

If you prefer to have it done earlier -- no problem, I'll cook
a patch today instead on top of everything we've already
merged into linux-next. What would you prefer?


	Cyrill
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
