From: Eric Paris <eparis-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: fanotify API: FMODE_NONOTIFY, FMODE_EXEC, FMODE_NOCMTIME
Date: Tue, 29 Apr 2014 16:55:53 -0400
Message-ID: <1398804953.2585.5.camel@flatline.rdu.redhat.com>
References: <CAKgNAkiq+yA7_tnvCVXemFy6P5F0eMccw18-GdqFthuzagvF5Q@mail.gmail.com>
	 <20140429201006.GD29634@quack.suse.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140429201006.GD29634-+0h/O2h83AeN3ZZ/Hiejyg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jan Kara <jack-AlSwsSmVLrQ@public.gmane.org>
Cc: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Al Viro <viro-3bDd1+5oDREiFSDQTTA3OLVCufUGDwFn@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Tue, 2014-04-29 at 22:10 +0200, Jan Kara wrote:
>   Hello,
> 
> On Tue 29-04-14 15:29:12, Michael Kerrisk (man-pages) wrote:
> > Can you offer any insight on Heinrich's question, below?
> > 
> > On Sun, Apr 13, 2014 at 4:05 PM, Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org> wrote:
> > > On 06.04.2014 14:18, Michael Kerrisk (man-pages) wrote:
> > >>>
> > >>> ==
> > >>> >
> > >>> >  >> I notice that the FDs returned by read()s from the FAN FD have the
> > >>> >  >> FMODE_NONOTIFY flag (fcntl(F_GETFL)) flag set. If you know what
> > >>> > that's
> > >>> >  >> about, it would be good to say something about. But, if not, do not
> > >>> >  >> worry--just place a FIXME in the page source of fanotify(7)
> > >>> >
> > >>> >Fixed in fanotify.7
> > >>> >If the listener accesses the file through the file descriptor provided
> > >>> >no additional events are created.
> > >>
> > >> Ahh -- thanks for filling in that piece. I see that you refer to
> > >> fcntl(2) when discussing that flag. But fcntl(2) does not
> > >> mention that flag. I would rather see an explanation of this flag
> > >> in the fanotify pages.
> > >>
> > >
> > > I wrote a small test program and found:
> > >
> > > The flag FMODE_NONOTIFY can be read by function fcntl from userspace.
> > > int flag = fcntl(fd, F_GETFL)
> > >
> > > In include/uapi/asm-generic/fcntl.h I found the following comment:
> > >
> > > /*
> > >  * FMODE_EXEC is 0x20
> > >  * FMODE_NONOTIFY is 0x1000000
> > >  * These cannot be used by userspace O_* until internal and external open
> > >  * flags are split.
> > >  * -Eric Paris
> > >  */
> > >
> > > The definition of FMODE_NONOTIFY is in include/linux/fs.h but this
> > > include is only used to compile the Kernel and not supposed to be used by
> > > userspace.
> > >
> > > I think it is quite annoying that fcntl can return a flag that is not
> > > described in the manpage of fcntl and that is not defined in fcntl.h.
> > >
> > > But FMODE_NONOTIFY is not the only flag:
> > >
> > > I was able to pass
> > > 0x20 (FMODE_EXEC), and
> > > 0x800 (FMODE_NOCMTIME)
> > > to fanotify_init and received them as flag in the file descriptors for the
> > > fanotify events.
> > > I wonder why fanotify_init does not check import parameter event_f_flags and
> > > return an error if any inappropriate value is set.
>   It seems to me fanotify_init() should really check event_f_flags have
> only valid flags set. In particular exclude FMODE_EXEC, FMODE_NOCMTIME, or
> FMODE_NONOTIFY.

Agreed.  Clearly a bug on my part.

> > > Should I put this into the BUGS section?
> > >
> > > Should the name of the flag FMODE_NONOTIFY be mentioned at all in the man
> > > pages?
> > >
> > > Or should we write:
> > >
> > > .I fd
> > > This is an open file descriptor for the object being accessed or
> > > .B FAN_NOFD
> > > if a queue overflow occurred.
> > > The file descriptor can be used to access the contents of the monitored file
> > > or
> > > directory.
> > > It has an internal flag set, that suppresses fanotify event generation.
> > > Hence when the receiver of the fanotify event accesses the notified file or
> > > directory using this file descriptor no additional events will be created.
> > > The reading application is responsible for closing the file descriptor.
>   So this is what I would prefer. Just mention the file descriptor does not
> generate new events. I would even go as far as masking kernel internal
> flags like FMODE_EXEC or FMODE_NONOTIFY from the result of F_GETFL. What do
> you think Al?

I agree on this point too...

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
