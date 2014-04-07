From: Jan Kara <jack-AlSwsSmVLrQ@public.gmane.org>
Subject: Re: Things I wish I'd known about Inotify
Date: Mon, 7 Apr 2014 11:31:52 +0200
Message-ID: <20140407093152.GC14927@quack.suse.cz>
References: <CAKgNAkjymzawYMKZGedK=fai55cwo4p=yeYe6GT8MdxWON__zw@mail.gmail.com>
 <20140403205236.GE14107@quack.suse.cz>
 <533E60D6.2000704@gmail.com>
 <20140404124338.GA26806@quack.suse.cz>
 <534117AD.1030708@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <534117AD.1030708-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jan Kara <jack-AlSwsSmVLrQ@public.gmane.org>, John McCutchan <john-jueV0HHMeujJJrXXpGQQMAC/G2K4zDHf@public.gmane.org>, Robert Love <rlove-L7G0xEPcOZbYtjvyW6yDsg@public.gmane.org>, Eric Paris <eparis-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Lennart Poettering <lennart-mdGvqq1h2p+GdvJs77BJ7Q@public.gmane.org>, radu.voicilas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, daniel-dYEgDbNUoShWk0Htik3J/w@public.gmane.org, Christoph Hellwig <hch-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Vegard Nossum <vegard.nossum-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, "linux-fsdevel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-fsdevel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, gamin-list-rDKQcyrBJuzYtjvyW6yDsg@public.gmane.org, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, inotify-tools-general-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Sun 06-04-14 11:00:29, Michael Kerrisk (man-pages) wrote:
> On 04/04/2014 02:43 PM, Jan Kara wrote:
> > On Fri 04-04-14 09:35:50, Michael Kerrisk (man-pages) wrote:
> >> On 04/03/2014 10:52 PM, Jan Kara wrote:
> >>> On Thu 03-04-14 08:34:44, Michael Kerrisk (man-pages) wrote:
>=20
> [...]
>=20
> >>>>    Dealing with rename() events
> >>>>        The  IN_MOVED_FROM  and  IN_MOVED_TO events that are gene=
rated by
> >>>>        rename(2) are usually available as consecutive events whe=
n  read=E2=80=90
> >>>>        ing from the inotify file descriptor.  However, this is n=
ot guar=E2=80=90
> >>>>        anteed.  If multiple processes are triggering  events  fo=
r  moni=E2=80=90
> >>>>        tored  objects,  then  (on rare occasions) an arbitrary n=
umber of
> >>>>        other events may appear between the IN_MOVED_FROM and IN_=
MOVED_TO
> >>>>        events.
> >>>>
> >>>>        Matching  up  the IN_MOVED_FROM and IN_MOVED_TO event pai=
r gener=E2=80=90
> >>>>        ated by rename(2) is thus inherently racy.  (Don't forget=
 that if
> >>>>        an  object is renamed outside of a monitored directory, t=
here may
> >>>>        not even be an IN_MOVED_TO event.)  Heuristic  approaches=
  (e.g.,
> >>>>        assume the events are always consecutive) can be used to =
ensure a
> >>>>        match in most cases, but will inevitably miss some cases,=
 causing
> >>>>        the  application  to  perceive  the IN_MOVED_FROM and IN_=
MOVED_TO
> >>>>        events as being unrelated.  If watch  descriptors  are  d=
estroyed
> >>>>        and  re-created as a result, then those watch descriptors=
 will be
> >>>>        inconsistent with the watch descriptors in  any  pending =
 events.
> >>>>        (Re-creating the inotify file descriptor and rebuilding t=
he cache
> >>>>        may be useful to deal with this scenario.)
> >>>   Well, but there's 'cookie' value meant exactly for matching up
> >>> IN_MOVED_FROM and IN_MOVED_TO events. And 'cookie' is guaranteed =
to be
> >>> unique at least within the inotify instance (in fact currently it=
 is unique
> >>> within the whole system but I don't think we want to give that pr=
omise).
> >>
> >> Yes, that's already assumed by my discussion above (its described =
elsewhere
> >> in the page). But your comment makes me think I should add a few w=
ords to
> >> remind the reader of that fact. I'll do that.
> >   Yes, that would be good.
> >=20
> >> But, the point is that even with the cookie, matching the events i=
s=20
> >> nontrivial, since:
> >>
> >> * There may not even be an IN_MOVED_FROM event
> >> * There may be an arbitrary number of other events in between the=20
> >>   IN_MOVED_FROM and the IN_MOVED_TO.
> >>
> >> Therefore, one has to use heuristic approaches such as "allow at l=
east
> >> N millisconds" or "check the next N events" to see if there is an
> >> IN_MOVED_FROM that matches the IN_MOVED_TO. I can't see any way ar=
ound
> >> that being inherently racy. (It's unfortunate that the kernel can'=
t=20
> >> provide a guarantee that the two events are always consecutive, si=
nce
> >> that would simply user space's life considerably.)
>=20
> >   Yeah, it's unpleasant but doing that would be quite costly/comple=
x at the
> > kernel side.=20
>=20
> Yep, I imagined that was probably the reason.
  I had a look into that code again and it's all designed around the fa=
ct
that there's a single inode to notify. If you liked to have atomic rena=
me
notifications, you'd have to rewrite that to work with two inodes, find=
ing
out whether these two inodes are actually watched by the same group or
not... Doable but complex. Alternatively you could just lock down the w=
hole
notification subsystem while generating rename events. But that's rathe=
r
costly. Just that we have the complications written down somewhere in c=
ase
someone wants to look into this in future.

> > And the race would in the worst case lead to application
> > thinking there's been file moved outside of watched area & a file m=
oved
> > somewhere else inside the watched area. So the application will hav=
e to
> > possibly inspect that file. That doesn't seem too bad.
>=20
> It's actually very bad. See the text above. The point is that one lik=
ely
> treatment on an IN_MOVED_FROM event that has no IN_MOVED_TO is to rem=
ove
> the watches for the moved out subtree. If it turns out that this real=
ly
> was just a rename(), then on the IN_MOVED_TO, the watches will be rec=
reated
> *with different watch descriptors*, thus invalidating the watch descr=
iptors
> in any queued but as yet unprocessed inotify events. See what I mean?=
=20
> That's quite painful for user space.
  But if I understand it right, you loose only the information for recr=
eated
watches. So you effectively loose all the information about what has
happened inside the subtree of moved directory (or what has happened wi=
th
the moved file). But since you think it's a file / dir moved from outsi=
de
of watched area, you have to fully rescan that file / dir anyway.  Sure
that's costly but if your heuristics for detecting rename works 99.9% o=
f
time it should be OK, shouldn't it? And you have to have that code hand=
ling
caching file / dir written anyway for handling real moves from outside =
of
watched hierarchy.

Don't get me wrong, I understand it would be easier for userspace to ge=
t
atomic rename notifications, I'm just trying to understand what exactly=
 is
painful so that I can compare the cost at the kernel side with the cost=
 at
the userspace side...

								Honza
--=20
Jan Kara <jack-AlSwsSmVLrQ@public.gmane.org>
SUSE Labs, CR
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
