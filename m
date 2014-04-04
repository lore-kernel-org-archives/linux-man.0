From: Jan Kara <jack-AlSwsSmVLrQ@public.gmane.org>
Subject: Re: Things I wish I'd known about Inotify
Date: Fri, 4 Apr 2014 14:43:38 +0200
Message-ID: <20140404124338.GA26806@quack.suse.cz>
References: <CAKgNAkjymzawYMKZGedK=fai55cwo4p=yeYe6GT8MdxWON__zw@mail.gmail.com>
 <20140403205236.GE14107@quack.suse.cz>
 <533E60D6.2000704@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <533E60D6.2000704-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jan Kara <jack-AlSwsSmVLrQ@public.gmane.org>, John McCutchan <john-jueV0HHMeujJJrXXpGQQMAC/G2K4zDHf@public.gmane.org>, Robert Love <rlove-L7G0xEPcOZbYtjvyW6yDsg@public.gmane.org>, Eric Paris <eparis-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Lennart Poettering <lennart-mdGvqq1h2p+GdvJs77BJ7Q@public.gmane.org>, radu.voicilas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, daniel-dYEgDbNUoShWk0Htik3J/w@public.gmane.org, Christoph Hellwig <hch-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Vegard Nossum <vegard.nossum-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, "linux-fsdevel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-fsdevel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, gamin-list-rDKQcyrBJuzYtjvyW6yDsg@public.gmane.org, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, inotify-tools-general-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Fri 04-04-14 09:35:50, Michael Kerrisk (man-pages) wrote:
> On 04/03/2014 10:52 PM, Jan Kara wrote:
> > On Thu 03-04-14 08:34:44, Michael Kerrisk (man-pages) wrote:
> >>    Limitations and caveats
> >>        The inotify API provides no information about the user or p=
rocess
> >>        that triggered the inotify event.  In  particular,  there  =
is  no
> >>        easy  way  for a process that is monitoring events via inot=
ify to
> >>        distinguish events that it triggers itself from  those  tha=
t  are
> >>        triggered by other processes.
> >>
> >>        The  inotify API identifies affected files by filename.  Ho=
wever,
> >>        by the time an application processes an inotify event, the =
 file=E2=80=90
> >>        name may already have been deleted or renamed.
> >>
> >>        The  inotify  API identifies events via watch descriptors. =
 It is
> >>        the application's responsibility to cache a mapping  (if  o=
ne  is
> >>        needed)  between  watch descriptors and pathnames.  Be awar=
e that
> >>        directory renamings may affect multiple cached pathnames.
> >>
> >>        Inotify monitoring of directories is not  recursive:  to  m=
onitor
> >>        subdirectories under a directory, additional watches must b=
e cre=E2=80=90
> >>        ated.  This can take a significant amount time for  large  =
direc=E2=80=90
> >>        tory trees.
> >   And also there's a problem with the limit on the number of watche=
s a user
> > can have.
>=20
> What is the problem exactly (given that the limit is configurable)?
  Well, if you want to watch the whole home directory and you have a la=
rge
one, you may run into that limit. Sure you can ask sysadmin to raise th=
e
limit but it's a bit anoying.

> >>        If monitoring an entire directory subtree, and a new subdir=
ectory
> >>        is created in that tree or an existing directory is renamed=
  into
> >>        that  tree,  be aware that by the time you create a watch f=
or the
> >>        new subdirectory, new  files  (and  subdirectories)  may  a=
lready
> >>        exist  inside  the subdirectory.  Therefore, you may want t=
o scan
> >>        the contents of the subdirectory  immediately  after  addin=
g  the
> >>        watch (and, if desired, recursively add watches for any sub=
direc=E2=80=90
> >>        tories that it contains).
> >>
> >>        Note that the event queue can overflow.  In this case, even=
ts are
> >>        lost.   Robust applications should handle the possibility o=
f lost
> >>        events gracefully.  For example, it may be necessary  to  r=
ebuild
> >>        part  or all of the application cache.  (One simple, but po=
ssibly
> >>        expensive, approach is to  close  the  inotify  file  descr=
iptor,
> >>        empty  the  cache, create a new inotify file descriptor, an=
d then
> >>        re-create watches and cache entries for the objects to  be =
 moni=E2=80=90
> >>        tored.)
> >>
> >>    Dealing with rename() events
> >>        The  IN_MOVED_FROM  and  IN_MOVED_TO events that are genera=
ted by
> >>        rename(2) are usually available as consecutive events when =
 read=E2=80=90
> >>        ing from the inotify file descriptor.  However, this is not=
 guar=E2=80=90
> >>        anteed.  If multiple processes are triggering  events  for =
 moni=E2=80=90
> >>        tored  objects,  then  (on rare occasions) an arbitrary num=
ber of
> >>        other events may appear between the IN_MOVED_FROM and IN_MO=
VED_TO
> >>        events.
> >>
> >>        Matching  up  the IN_MOVED_FROM and IN_MOVED_TO event pair =
gener=E2=80=90
> >>        ated by rename(2) is thus inherently racy.  (Don't forget t=
hat if
> >>        an  object is renamed outside of a monitored directory, the=
re may
> >>        not even be an IN_MOVED_TO event.)  Heuristic  approaches  =
(e.g.,
> >>        assume the events are always consecutive) can be used to en=
sure a
> >>        match in most cases, but will inevitably miss some cases, c=
ausing
> >>        the  application  to  perceive  the IN_MOVED_FROM and IN_MO=
VED_TO
> >>        events as being unrelated.  If watch  descriptors  are  des=
troyed
> >>        and  re-created as a result, then those watch descriptors w=
ill be
> >>        inconsistent with the watch descriptors in  any  pending  e=
vents.
> >>        (Re-creating the inotify file descriptor and rebuilding the=
 cache
> >>        may be useful to deal with this scenario.)
> >   Well, but there's 'cookie' value meant exactly for matching up
> > IN_MOVED_FROM and IN_MOVED_TO events. And 'cookie' is guaranteed to=
 be
> > unique at least within the inotify instance (in fact currently it i=
s unique
> > within the whole system but I don't think we want to give that prom=
ise).
>=20
> Yes, that's already assumed by my discussion above (its described els=
ewhere
> in the page). But your comment makes me think I should add a few word=
s to
> remind the reader of that fact. I'll do that.
  Yes, that would be good.

> But, the point is that even with the cookie, matching the events is=20
> nontrivial, since:
>=20
> * There may not even be an IN_MOVED_FROM event
> * There may be an arbitrary number of other events in between the=20
>   IN_MOVED_FROM and the IN_MOVED_TO.
>=20
> Therefore, one has to use heuristic approaches such as "allow at leas=
t
> N millisconds" or "check the next N events" to see if there is an
> IN_MOVED_FROM that matches the IN_MOVED_TO. I can't see any way aroun=
d
> that being inherently racy. (It's unfortunate that the kernel can't=20
> provide a guarantee that the two events are always consecutive, since
> that would simply user space's life considerably.)
  Yeah, it's unpleasant but doing that would be quite costly/complex at=
 the
kernel side. And the race would in the worst case lead to application
thinking there's been file moved outside of watched area & a file moved
somewhere else inside the watched area. So the application will have to
possibly inspect that file. That doesn't seem too bad.

								Honza
--=20
Jan Kara <jack-AlSwsSmVLrQ@public.gmane.org>
SUSE Labs, CR
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
