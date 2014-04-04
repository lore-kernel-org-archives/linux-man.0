From: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Subject: Re: Things I wish I'd known about Inotify
Date: Fri, 04 Apr 2014 09:59:47 +0200
Message-ID: <533E6673.4020606@gmail.com>
References: <CAKgNAkjymzawYMKZGedK=fai55cwo4p=yeYe6GT8MdxWON__zw@mail.gmail.com> <871txeifsv.fsf@x220.int.ebiederm.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <871txeifsv.fsf@x220.int.ebiederm.org>
Sender: linux-fsdevel-owner@vger.kernel.org
To: "Eric W. Biederman" <ebiederm@xmission.com>, John McCutchan <john@johnmccutchan.com>, Robert Love <rlove@rlove.org>, Eric Paris <eparis@redhat.com>, Lennart Poettering <lennart@poettering.net>, radu.voicilas@gmail.com, daniel@veillard.com
Cc: mtk.manpages@gmail.com, Christoph Hellwig <hch@infradead.org>, Vegard Nossum <vegard.nossum@oracle.com>, "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, linux-man <linux-man@vger.kernel.org>, gamin-list@gnome.org, lkml <linux-kernel@vger.kernel.org>, inotify-tools-general@lists.sourceforge.net, Al Viro <viro@zeniv.linux.org.uk>, Linus Torvalds <torvalds@linux-foundation.org>
List-Id: linux-man@vger.kernel.org

[CC +=3D Al Viro & Linux, since they also discussed the point about
remote filesystems and /proc and /sys here:
http://thread.gmane.org/gmane.linux.file-systems/83641/focus=3D83713 .]

On 04/03/2014 05:38 PM, Eric W. Biederman wrote:
> "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com> writes:
>=20
>> (To: =3D=3D [the set of people I believe know a lot about inotify])
>>
>> Hello all,
>>
>> Lately, I've been studying the inotify API fairly thoroughly and
>> realized that there's a very big gap between knowing what the system
>> calls do versus using them to reliably and efficiently monitor the
>> state of a set of filesystem objects.
>>
>> With that in mind, I've drafted some substantial additions to the
>> inotify(7) man page. I would be very happy if folk on the "To:" list
>> could comment on the text below, since I believe you all have a lot =
of
>> practical experience with Inotify. (Of course, I also welcome commen=
ts
>> from anyone else.) In particular, I would like comments on the
>> accuracy of the various technical points (especially those relating =
to
>> matching up related IN_MOVED_FROM and IN_MOVED_TO events), as well a=
s
>> pointers on any other pitfalls that the programmers should be wary o=
f
>> that should be added to the page.
>=20
>=20
> Other pitfalls.
>=20
> Inotify only report events that a user space program triggers through
> the filesystem API.  Which means inotify is limited for remote
> filesystems, and filesystems like proc and sys have no monitorable

Good point. I recently got CCed on that very point, but hadn't=20
added it to the page. I've added it now.=20

Revised text below, after incorporating changes from your comments and =
those
of Jan Kara.

Cheers,

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

       Inotify  reports  only  events that a user-space program trigger=
s
       through the filesystem API.  As  a  result,  it  does  not  catc=
h
       remote  events  that occur on network filesystems.  (Application=
s
       must fall back to polling the filesystem to catch  such  events.=
)
       Furthermore, various virtual filesystems such as /proc, /sys, an=
d
       /dev/pts are not monitorable with inotify.

       The inotify API identifies affected files by filename.   However=
,
       by  the time an application processes an inotify event, the file=
=E2=80=90
       name may already have been deleted or renamed.

       The inotify API identifies events via watch descriptors.   It  i=
s
       the  application's  responsibility  to cache a mapping (if one i=
s
       needed) between watch descriptors and pathnames.  Be  aware  tha=
t
       directory renamings may affect multiple cached pathnames.

       Inotify  monitoring  of  directories is not recursive: to monito=
r
       subdirectories under a directory, additional watches must be cre=
=E2=80=90
       ated.   This  can take a significant amount time for large direc=
=E2=80=90
       tory trees.

       If monitoring an entire directory subtree, and a new subdirector=
y
       is  created in that tree or an existing directory is renamed int=
o
       that tree, be aware that by the time you create a watch  for  th=
e
       new  subdirectory,  new  files  (and  subdirectories) may alread=
y
       exist inside the subdirectory.  Therefore, you may want  to  sca=
n
       the  contents  of  the  subdirectory immediately after adding th=
e
       watch (and, if desired, recursively add watches for any subdirec=
=E2=80=90
       tories that it contains).

       Note that the event queue can overflow.  In this case, events ar=
e
       lost.  Robust applications should handle the possibility of  los=
t
       events  gracefully.   For example, it may be necessary to rebuil=
d
       part or all of the application cache.  (One simple, but  possibl=
y
       expensive,  approach  is  to  close  the inotify file descriptor=
,
       empty the cache, create a new inotify file descriptor,  and  the=
n
       re-create  watches  and cache entries for the objects to be moni=
=E2=80=90
       tored.)

   Dealing with rename() events
       As noted above, the IN_MOVED_FROM and IN_MOVED_TO event pair tha=
t
       is  generated  by  rename(2)  can  be matched up via their share=
d
       cookie value.  However, the task of matching has some challenges=
=2E

       These two events are usually  consecutive  in  the  event  strea=
m
       available  when  reading  from the inotify file descriptor.  How=
=E2=80=90
       ever, this is not guaranteed.  If multiple processes are trigger=
=E2=80=90
       ing  events  for  monitored  objects, then (on rare occasions) a=
n
       arbitrary  number  of  other  events  may  appear   between   th=
e
       IN_MOVED_FROM and IN_MOVED_TO events.

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
To unsubscribe from this list: send the line "unsubscribe linux-fsdevel=
" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
