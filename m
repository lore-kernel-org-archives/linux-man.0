From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 0/1] Manpages for the fanotify API
Date: Sun, 06 Apr 2014 14:18:34 +0200
Message-ID: <5341461A.3090405@gmail.com>
References: <5330A257.9080100@gmail.com> <1396742468-4752-1-git-send-email-xypron.glpk@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1396742468-4752-1-git-send-email-xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: xypron.glpk-Mmb7MZpHnFY@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, eparis-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, jack-AlSwsSmVLrQ@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Heinrich,

Thanks for the new drafts.

I'm teaching a course over the coming week, so it may sometime before I=
 can
do a detailed review of the pages. I have a few comments in the meantim=
e:

On 04/06/2014 02:01 AM, xypron.glpk-Mmb7MZpHnFY@public.gmane.org wrote:
> From: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
>=20
> Hello Michael,
>=20
> please, find the answer to your most prominent questions
> in this mail.
>=20
> I put the patch into a separate mail.
>=20
> Best regards
>=20
> Heinrich Schuchardt
>=20
> =3D=3D
>=20
>  >> The pages say nothing about merging of events. Merging can happen
>  >> for non-permission events, but not for permission events.
>  >> Something needs to be said about this, probably in fanotify(7)
>  >> If you are unsure of what I mean, just add the following in
>  >> fanotify(7)
>=20
> You missed this sentence: "The bitmask in mask signals which events
> have occured for a single file system object. More than one of the
> following flags can be set at once in the bitmask."
>=20
> Jan Kara wrote, that the only guarantee given is, that no two
> permission events will be merged.
>=20
> I reworked fanotify.7.

I think you've misunderstood what I mean by merging.

Say there is a read on a file being monitored with FAN_CLASS_NOTIFY.=20
Suppose also that the reader of the fanotify FD does not yet
read the event. Now suppose a second read occurs on the monitored
file. Are there now two events in the queue, or one (because the=20
identical events have been merged)? For "inotify", the answer=20
is "1". I suspect it is the same for fanotify. The man page
should say something about this (if I am correct).

> =3D=3D
>=20
> There needs to be some explanation of the events that are generated
> for directories. To begin with, *which* events are generated for
> directories?
>=20
> * opening a directory for reading gives FAN_OPEN
> * closing the file descriptor from the previous
>   step gives FAN_CLOSE
> * Changing the directory contents (adding a file)
>   seems to give no event for the directory itself
>   (but will give an event on the new file, if we
>   are monitoring children of the directory)
> * Other???

Did the piece of text above get overlooked?

> =3D=3D
>=20
>  >> I asked this earlier (in a different wording), but it seems not t=
o
>  >> have been addressed:
>  >>
>  >>    What happens if the application hits its file descriptor limit
>  >>    (RLIMIT_NOFILES) when handling read()s from the FAN FD? (EMFIL=
E).
>  >>
>  >> This needs to be covered under the errors for read(2).
> When diving deeper into the code EMFILE can be found in get_unusedfd.
> FIXED in fanotify.7

Your text needs to explicitly mention the RLIMIT_NOFILES limit.
There are other reasons for "too many files open" (e.g., ENFILE).

>  >> And now I think of a related question: what if we hit the system-=
wide
>  >> limit on the number of open files (/proc/sys/fs/file-max)? (I sus=
pect
>  >> ENFILE.)
> I could not verify this. But I guess you can reproduce all error code=
s
> of open(2) in some part of the fanotify API.

I'd add ENFILE to the list of errors, mentioning that its cause is hitt=
ing
the system-wide limit on the number of open files (/proc/sys/fs/file-ma=
x)

> =3D=3D
>=20
>  >> I notice that the FDs returned by read()s from the FAN FD have th=
e
>  >> FMODE_NONOTIFY flag (fcntl(F_GETFL)) flag set. If you know what t=
hat's
>  >> about, it would be good to say something about. But, if not, do n=
ot
>  >> worry--just place a FIXME in the page source of fanotify(7)
>=20
> Fixed in fanotify.7
> If the listener accesses the file through the file descriptor provide=
d
> no additional events are created.

Ahh -- thanks for filling in that piece. I see that you refer to=20
fcntl(2) when discussing that flag. But fcntl(2) does not
mention that flag. I would rather see an explanation of this flag=20
in the fanotify pages.

> =3D=3D
>=20
>  >> It all depends how you pronounce the name, but I assume "F-A-noti=
fy"
>  >> and so I'd always write it as "an fanotify" (and in multiple plac=
es below).
>=20
> No indication has been given by Eric Paris that the first letters of =
fanotify
> are an abbreviation, so I think of fanotify as a proper name pronounc=
ed
> [f=C3=A6noutifai].
> Cf. http://lkml.iu.edu/hypermail/linux/kernel/0907.3/00243.html

I'm not sure what I should be noting in that URL.

See Eric's usage ("an fanotify") in these places:

http://lwn.net/Articles/339253/
https://lkml.org/lkml/2010/8/22/94
https://lkml.org/lkml/2009/8/28/258

> =3D=3D
>=20
>  >> +    // Mark the mount for
>  >> >+    // \- permission events before opening files
>  >> >+    // \- notification events after closing a write enabled fil=
e descriptor.
>  >> >+    if (fanotify_mark(fd, FAN_MARK_ADD | FAN_MARK_MOUNT,
>  >> >+                      FAN_OPEN_PERM | FAN_CLOSE_WRITE, FAN_NOFD=
,
>> Why 'FAN_NOFD' here?
>>
>  >> >+                      argv[1]) =3D=3D \-1) {
>  >> >+        perror("fanotify_mark");
>  >> >+        close(fd);
>  >> >+        return EXIT_FAILURE;
>  >> >+    }
>=20
> As described in fanotify_mark(2) the value of dfd is irrelevant if pa=
thname is not NULL.
>=20
> FAN_NOFD takes the value -1, which no file descriptor ever can have.
>=20
> I changed this to -1 now.

My point was that FAN_NOFD is a constant used by another part of the AP=
I. It's
confusing to have it pop up here, even if it is ignored. Thanks for mak=
ing
the change.

> =3D=3D
>  >>> The structures fanotify_event_metadata and fanotify_response hav=
e been
>  >>> changed repeatedly.
>=20
>  >> Have they? I don't know. But this statement is rather strong. Is =
it correct?
>  >> If it is true, it would be good to mention a few of the changes, =
and when
>  >> they occurred.
> In the Git log you will find at least 4 different version. With field=
s added
> and removed, alignment changed, and fieldtype changed. The last chang=
e was in
>  2.6.37. I removed the sentence with repeatedly. It is sufficient to =
indicate
> that the value of the field should be checked.

Thanks. This was my point really: there have been no version
changes since the API was released to user space. Thanks
for the wording change.

=3D=3D

I noticed some of the following that need to be fixed:
* "file system" =3D=3D> "filesystem"
* New sentences should be started on new source lines.

=3D=3D

Some other questions that I think of in the light of recent changes I m=
ade to
inotify(7) (see http://man7.org/linux/man-pages/man7/inotify.7.html#NOT=
ES):

       Inotify reports only events that a user-space program triggers
       through the filesystem API.  As a result, it does not catch remo=
te
       events that occur on network filesystems. [...]  Furthermore,
       various pseudo-filesystems such as /proc, /sys, and /dev/pts are=
 not
       monitorable with inotify.

       The inotify API does not report file accesses and modifications =
that
       may occur because of mmap(2) and msync(2).

Do there need to be analogous statements in fanotify(7)? I expect so.

Could I ask you to address the comments in this mail in a new draft of
the pages. I'd hope then to be able to review that next draft in a
week or so.

Cheers,

Michael



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
