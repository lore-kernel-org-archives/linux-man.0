From: ebiederm-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org (Eric W. Biederman)
Subject: Re: Things I wish I'd known about Inotify
Date: Thu, 03 Apr 2014 08:38:40 -0700
Message-ID: <871txeifsv.fsf@x220.int.ebiederm.org>
References: <CAKgNAkjymzawYMKZGedK=fai55cwo4p=yeYe6GT8MdxWON__zw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKgNAkjymzawYMKZGedK=fai55cwo4p=yeYe6GT8MdxWON__zw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
	(Michael Kerrisk's message of "Thu, 3 Apr 2014 08:34:44 +0200")
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: John McCutchan <john-jueV0HHMeujJJrXXpGQQMAC/G2K4zDHf@public.gmane.org>, Robert Love <rlove-L7G0xEPcOZbYtjvyW6yDsg@public.gmane.org>, Eric Paris <eparis-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Lennart Poettering <lennart-mdGvqq1h2p+GdvJs77BJ7Q@public.gmane.org>, radu.voicilas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, daniel-dYEgDbNUoShWk0Htik3J/w@public.gmane.org, Christoph Hellwig <hch-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Vegard Nossum <vegard.nossum-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, "linux-fsdevel@vger.kernel.org" <linux-fsdevel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, gamin-list-rDKQcyrBJuzYtjvyW6yDsg@public.gmane.org, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, inotify-tools-general-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
List-Id: linux-man@vger.kernel.org

"Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> writes:

> (To: =3D=3D [the set of people I believe know a lot about inotify])
>
> Hello all,
>
> Lately, I've been studying the inotify API fairly thoroughly and
> realized that there's a very big gap between knowing what the system
> calls do versus using them to reliably and efficiently monitor the
> state of a set of filesystem objects.
>
> With that in mind, I've drafted some substantial additions to the
> inotify(7) man page. I would be very happy if folk on the "To:" list
> could comment on the text below, since I believe you all have a lot o=
f
> practical experience with Inotify. (Of course, I also welcome comment=
s
> from anyone else.) In particular, I would like comments on the
> accuracy of the various technical points (especially those relating t=
o
> matching up related IN_MOVED_FROM and IN_MOVED_TO events), as well as
> pointers on any other pitfalls that the programmers should be wary of
> that should be added to the page.


Other pitfalls.

Inotify only report events that a user space program triggers through
the filesystem API.  Which means inotify is limited for remote
filesystems, and filesystems like proc and sys have no monitorable
events.

Eric


> Thanks,
>
> Michael
>
>    Limitations and caveats
>        The inotify API provides no information about the user or proc=
ess
>        that triggered the inotify event.  In  particular,  there  is =
 no
>        easy  way  for a process that is monitoring events via inotify=
 to
>        distinguish events that it triggers itself from  those  that  =
are
>        triggered by other processes.
>
>        The  inotify API identifies affected files by filename.  Howev=
er,
>        by the time an application processes an inotify event, the  fi=
le=E2=80=90
>        name may already have been deleted or renamed.
>
>        The  inotify  API identifies events via watch descriptors.  It=
 is
>        the application's responsibility to cache a mapping  (if  one =
 is
>        needed)  between  watch descriptors and pathnames.  Be aware t=
hat
>        directory renamings may affect multiple cached pathnames.
>
>        Inotify monitoring of directories is not  recursive:  to  moni=
tor
>        subdirectories under a directory, additional watches must be c=
re=E2=80=90
>        ated.  This can take a significant amount time for  large  dir=
ec=E2=80=90
>        tory trees.
>
>        If monitoring an entire directory subtree, and a new subdirect=
ory
>        is created in that tree or an existing directory is renamed  i=
nto
>        that  tree,  be aware that by the time you create a watch for =
the
>        new subdirectory, new  files  (and  subdirectories)  may  alre=
ady
>        exist  inside  the subdirectory.  Therefore, you may want to s=
can
>        the contents of the subdirectory  immediately  after  adding  =
the
>        watch (and, if desired, recursively add watches for any subdir=
ec=E2=80=90
>        tories that it contains).
>
>        Note that the event queue can overflow.  In this case, events =
are
>        lost.   Robust applications should handle the possibility of l=
ost
>        events gracefully.  For example, it may be necessary  to  rebu=
ild
>        part  or all of the application cache.  (One simple, but possi=
bly
>        expensive, approach is to  close  the  inotify  file  descript=
or,
>        empty  the  cache, create a new inotify file descriptor, and t=
hen
>        re-create watches and cache entries for the objects to  be  mo=
ni=E2=80=90
>        tored.)
>
>    Dealing with rename() events
>        The  IN_MOVED_FROM  and  IN_MOVED_TO events that are generated=
 by
>        rename(2) are usually available as consecutive events when  re=
ad=E2=80=90
>        ing from the inotify file descriptor.  However, this is not gu=
ar=E2=80=90
>        anteed.  If multiple processes are triggering  events  for  mo=
ni=E2=80=90
>        tored  objects,  then  (on rare occasions) an arbitrary number=
 of
>        other events may appear between the IN_MOVED_FROM and IN_MOVED=
_TO
>        events.
>
>        Matching  up  the IN_MOVED_FROM and IN_MOVED_TO event pair gen=
er=E2=80=90
>        ated by rename(2) is thus inherently racy.  (Don't forget that=
 if
>        an  object is renamed outside of a monitored directory, there =
may
>        not even be an IN_MOVED_TO event.)  Heuristic  approaches  (e.=
g.,
>        assume the events are always consecutive) can be used to ensur=
e a
>        match in most cases, but will inevitably miss some cases, caus=
ing
>        the  application  to  perceive  the IN_MOVED_FROM and IN_MOVED=
_TO
>        events as being unrelated.  If watch  descriptors  are  destro=
yed
>        and  re-created as a result, then those watch descriptors will=
 be
>        inconsistent with the watch descriptors in  any  pending  even=
ts.
>        (Re-creating the inotify file descriptor and rebuilding the ca=
che
>        may be useful to deal with this scenario.)
>
>        Applications should also  allow  for  the  possibility  that  =
the
>        IN_MOVED_FROM event was the last event that could fit in the b=
uf=E2=80=90
>        fer returned by the current call to read(2), and the accompany=
ing
>        IN_MOVED_TO event might be fetched only on the next read(2).
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
