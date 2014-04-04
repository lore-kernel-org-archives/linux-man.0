From: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Subject: Re: Things I wish I'd known about Inotify
Date: Fri, 04 Apr 2014 09:35:50 +0200
Message-ID: <533E60D6.2000704@gmail.com>
References: <CAKgNAkjymzawYMKZGedK=fai55cwo4p=yeYe6GT8MdxWON__zw@mail.gmail.com> <20140403205236.GE14107@quack.suse.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20140403205236.GE14107@quack.suse.cz>
Sender: linux-kernel-owner@vger.kernel.org
To: Jan Kara <jack@suse.cz>
Cc: mtk.manpages@gmail.com, John McCutchan <john@johnmccutchan.com>, Robert Love <rlove@rlove.org>, Eric Paris <eparis@redhat.com>, Lennart Poettering <lennart@poettering.net>, radu.voicilas@gmail.com, daniel@veillard.com, Christoph Hellwig <hch@infradead.org>, Vegard Nossum <vegard.nossum@oracle.com>, "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, linux-man <linux-man@vger.kernel.org>, gamin-list@gnome.org, lkml <linux-kernel@vger.kernel.org>, inotify-tools-general@lists.sourceforge.net
List-Id: linux-man@vger.kernel.org

On 04/03/2014 10:52 PM, Jan Kara wrote:
> On Thu 03-04-14 08:34:44, Michael Kerrisk (man-pages) wrote:
>>    Limitations and caveats
>>        The inotify API provides no information about the user or pro=
cess
>>        that triggered the inotify event.  In  particular,  there  is=
  no
>>        easy  way  for a process that is monitoring events via inotif=
y to
>>        distinguish events that it triggers itself from  those  that =
 are
>>        triggered by other processes.
>>
>>        The  inotify API identifies affected files by filename.  Howe=
ver,
>>        by the time an application processes an inotify event, the  f=
ile=E2=80=90
>>        name may already have been deleted or renamed.
>>
>>        The  inotify  API identifies events via watch descriptors.  I=
t is
>>        the application's responsibility to cache a mapping  (if  one=
  is
>>        needed)  between  watch descriptors and pathnames.  Be aware =
that
>>        directory renamings may affect multiple cached pathnames.
>>
>>        Inotify monitoring of directories is not  recursive:  to  mon=
itor
>>        subdirectories under a directory, additional watches must be =
cre=E2=80=90
>>        ated.  This can take a significant amount time for  large  di=
rec=E2=80=90
>>        tory trees.
>   And also there's a problem with the limit on the number of watches =
a user
> can have.

What is the problem exactly (given that the limit is configurable)?

>>        If monitoring an entire directory subtree, and a new subdirec=
tory
>>        is created in that tree or an existing directory is renamed  =
into
>>        that  tree,  be aware that by the time you create a watch for=
 the
>>        new subdirectory, new  files  (and  subdirectories)  may  alr=
eady
>>        exist  inside  the subdirectory.  Therefore, you may want to =
scan
>>        the contents of the subdirectory  immediately  after  adding =
 the
>>        watch (and, if desired, recursively add watches for any subdi=
rec=E2=80=90
>>        tories that it contains).
>>
>>        Note that the event queue can overflow.  In this case, events=
 are
>>        lost.   Robust applications should handle the possibility of =
lost
>>        events gracefully.  For example, it may be necessary  to  reb=
uild
>>        part  or all of the application cache.  (One simple, but poss=
ibly
>>        expensive, approach is to  close  the  inotify  file  descrip=
tor,
>>        empty  the  cache, create a new inotify file descriptor, and =
then
>>        re-create watches and cache entries for the objects to  be  m=
oni=E2=80=90
>>        tored.)
>>
>>    Dealing with rename() events
>>        The  IN_MOVED_FROM  and  IN_MOVED_TO events that are generate=
d by
>>        rename(2) are usually available as consecutive events when  r=
ead=E2=80=90
>>        ing from the inotify file descriptor.  However, this is not g=
uar=E2=80=90
>>        anteed.  If multiple processes are triggering  events  for  m=
oni=E2=80=90
>>        tored  objects,  then  (on rare occasions) an arbitrary numbe=
r of
>>        other events may appear between the IN_MOVED_FROM and IN_MOVE=
D_TO
>>        events.
>>
>>        Matching  up  the IN_MOVED_FROM and IN_MOVED_TO event pair ge=
ner=E2=80=90
>>        ated by rename(2) is thus inherently racy.  (Don't forget tha=
t if
>>        an  object is renamed outside of a monitored directory, there=
 may
>>        not even be an IN_MOVED_TO event.)  Heuristic  approaches  (e=
=2Eg.,
>>        assume the events are always consecutive) can be used to ensu=
re a
>>        match in most cases, but will inevitably miss some cases, cau=
sing
>>        the  application  to  perceive  the IN_MOVED_FROM and IN_MOVE=
D_TO
>>        events as being unrelated.  If watch  descriptors  are  destr=
oyed
>>        and  re-created as a result, then those watch descriptors wil=
l be
>>        inconsistent with the watch descriptors in  any  pending  eve=
nts.
>>        (Re-creating the inotify file descriptor and rebuilding the c=
ache
>>        may be useful to deal with this scenario.)
>   Well, but there's 'cookie' value meant exactly for matching up
> IN_MOVED_FROM and IN_MOVED_TO events. And 'cookie' is guaranteed to b=
e
> unique at least within the inotify instance (in fact currently it is =
unique
> within the whole system but I don't think we want to give that promis=
e).

Yes, that's already assumed by my discussion above (its described elsew=
here
in the page). But your comment makes me think I should add a few words =
to
remind the reader of that fact. I'll do that.

But, the point is that even with the cookie, matching the events is=20
nontrivial, since:

* There may not even be an IN_MOVED_FROM event
* There may be an arbitrary number of other events in between the=20
  IN_MOVED_FROM and the IN_MOVED_TO.

Therefore, one has to use heuristic approaches such as "allow at least
N millisconds" or "check the next N events" to see if there is an
IN_MOVED_FROM that matches the IN_MOVED_TO. I can't see any way around
that being inherently racy. (It's unfortunate that the kernel can't=20
provide a guarantee that the two events are always consecutive, since
that would simply user space's life considerably.)

Cheers,

Michael


>>        Applications should also  allow  for  the  possibility  that =
 the
>>        IN_MOVED_FROM event was the last event that could fit in the =
buf=E2=80=90
>>        fer returned by the current call to read(2), and the accompan=
ying
>>        IN_MOVED_TO event might be fetched only on the next read(2).
>=20
> 								Honza
>=20


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
