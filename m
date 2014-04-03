From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Things I wish I'd known about Inotify
Date: Thu, 3 Apr 2014 08:34:44 +0200
Message-ID: <CAKgNAkjymzawYMKZGedK=fai55cwo4p=yeYe6GT8MdxWON__zw@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: John McCutchan <john-jueV0HHMeujJJrXXpGQQMAC/G2K4zDHf@public.gmane.org>, Robert Love <rlove-L7G0xEPcOZbYtjvyW6yDsg@public.gmane.org>, Eric Paris <eparis-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Lennart Poettering <lennart-mdGvqq1h2p+GdvJs77BJ7Q@public.gmane.org>, radu.voicilas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, daniel-dYEgDbNUoShWk0Htik3J/w@public.gmane.org
Cc: Christoph Hellwig <hch-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Vegard Nossum <vegard.nossum-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, "linux-fsdevel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-fsdevel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, gamin-list-rDKQcyrBJuzYtjvyW6yDsg@public.gmane.org, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, inotify-tools-general-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
List-Id: linux-man@vger.kernel.org

(To: =3D=3D [the set of people I believe know a lot about inotify])

Hello all,

Lately, I've been studying the inotify API fairly thoroughly and
realized that there's a very big gap between knowing what the system
calls do versus using them to reliably and efficiently monitor the
state of a set of filesystem objects.

With that in mind, I've drafted some substantial additions to the
inotify(7) man page. I would be very happy if folk on the "To:" list
could comment on the text below, since I believe you all have a lot of
practical experience with Inotify. (Of course, I also welcome comments
from anyone else.) In particular, I would like comments on the
accuracy of the various technical points (especially those relating to
matching up related IN_MOVED_FROM and IN_MOVED_TO events), as well as
pointers on any other pitfalls that the programmers should be wary of
that should be added to the page.

Thanks,

Michael

   Limitations and caveats
       The inotify API provides no information about the user or proces=
s
       that triggered the inotify event.  In  particular,  there  is  n=
o
       easy  way  for a process that is monitoring events via inotify t=
o
       distinguish events that it triggers itself from  those  that  ar=
e
       triggered by other processes.

       The  inotify API identifies affected files by filename.  However=
,
       by the time an application processes an inotify event, the  file=
=E2=80=90
       name may already have been deleted or renamed.

       The  inotify  API identifies events via watch descriptors.  It i=
s
       the application's responsibility to cache a mapping  (if  one  i=
s
       needed)  between  watch descriptors and pathnames.  Be aware tha=
t
       directory renamings may affect multiple cached pathnames.

       Inotify monitoring of directories is not  recursive:  to  monito=
r
       subdirectories under a directory, additional watches must be cre=
=E2=80=90
       ated.  This can take a significant amount time for  large  direc=
=E2=80=90
       tory trees.

       If monitoring an entire directory subtree, and a new subdirector=
y
       is created in that tree or an existing directory is renamed  int=
o
       that  tree,  be aware that by the time you create a watch for th=
e
       new subdirectory, new  files  (and  subdirectories)  may  alread=
y
       exist  inside  the subdirectory.  Therefore, you may want to sca=
n
       the contents of the subdirectory  immediately  after  adding  th=
e
       watch (and, if desired, recursively add watches for any subdirec=
=E2=80=90
       tories that it contains).

       Note that the event queue can overflow.  In this case, events ar=
e
       lost.   Robust applications should handle the possibility of los=
t
       events gracefully.  For example, it may be necessary  to  rebuil=
d
       part  or all of the application cache.  (One simple, but possibl=
y
       expensive, approach is to  close  the  inotify  file  descriptor=
,
       empty  the  cache, create a new inotify file descriptor, and the=
n
       re-create watches and cache entries for the objects to  be  moni=
=E2=80=90
       tored.)

   Dealing with rename() events
       The  IN_MOVED_FROM  and  IN_MOVED_TO events that are generated b=
y
       rename(2) are usually available as consecutive events when  read=
=E2=80=90
       ing from the inotify file descriptor.  However, this is not guar=
=E2=80=90
       anteed.  If multiple processes are triggering  events  for  moni=
=E2=80=90
       tored  objects,  then  (on rare occasions) an arbitrary number o=
f
       other events may appear between the IN_MOVED_FROM and IN_MOVED_T=
O
       events.

       Matching  up  the IN_MOVED_FROM and IN_MOVED_TO event pair gener=
=E2=80=90
       ated by rename(2) is thus inherently racy.  (Don't forget that i=
f
       an  object is renamed outside of a monitored directory, there ma=
y
       not even be an IN_MOVED_TO event.)  Heuristic  approaches  (e.g.=
,
       assume the events are always consecutive) can be used to ensure =
a
       match in most cases, but will inevitably miss some cases, causin=
g
       the  application  to  perceive  the IN_MOVED_FROM and IN_MOVED_T=
O
       events as being unrelated.  If watch  descriptors  are  destroye=
d
       and  re-created as a result, then those watch descriptors will b=
e
       inconsistent with the watch descriptors in  any  pending  events=
=2E
       (Re-creating the inotify file descriptor and rebuilding the cach=
e
       may be useful to deal with this scenario.)

       Applications should also  allow  for  the  possibility  that  th=
e
       IN_MOVED_FROM event was the last event that could fit in the buf=
=E2=80=90
       fer returned by the current call to read(2), and the accompanyin=
g
       IN_MOVED_TO event might be fetched only on the next read(2).


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
