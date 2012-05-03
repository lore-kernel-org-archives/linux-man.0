From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] open(2): document O_PATH
Date: Thu, 3 May 2012 18:47:32 +1200
Message-ID: <CAKgNAkiRH8p=Dp1tqkb3D9oRVCOSnj2bofgFN5x2svntN7vtPg@mail.gmail.com>
References: <1335669917-23970-1-git-send-email-vapier@gentoo.org>
 <CAKgNAkgykZJV59WJXW9c9gVwXhn=WNYKxo_W1GM7ocHEEFqEXg@mail.gmail.com> <877gwxacti.fsf@skywalker.in.ibm.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <877gwxacti.fsf-6yE53ggjAfyqSkle7U1LjlaTQe2KTcn/@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Aneesh Kumar K.V" <aneesh.kumar-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Cc: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, viro-RmSDqhL/yNMiFSDQTTA3OLVCufUGDwFn@public.gmane.org, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Aneesh,

[...]

>> --- a/man2/open.2
>> +++ b/man2/open.2
>> @@ -428,6 +427,66 @@ For a discussion of the effect of
>> =A0in conjunction with mandatory file locks and with file leases, se=
e
>> =A0.BR fcntl (2).
>> =A0.TP
>> +.BR O_PATH " (since Linux 2.6.39)"
>> +.\" commit 1abf0c718f15a56a0a435588d1b104c7a37dc9bd
>> +Obtain a file descriptor that is used only for fetching file attrib=
utes.
>> +The file itself is not opened, and most file operations (e.g.,
>> +.BR read (2),
>> +.BR write (2))
>> +fail with the error
>> +.BR EBADF .
>> +The following operations
>> +.I can
>> +be performed on the resulting file descriptor:
>> +.RS
>> +.IP * 3
>> +Closing the file descriptor
>> +.RB ( close (2)).
>> +.\" FIXME Commit 1abf0c718f15a56a0a435588d1b104c7a37dc9bdcw
>> +.\" message says that closing the file descriptor does not affect
>> +.\" POSIX locks or dnotify.
>> +.\" However, my testing shows that it DOES affect dnotify (and inot=
ify).
>> +.\" Does close() affect POSIX locks?
>> +.IP *
>
>
> IIUC what an O_PATH descritor doesn't do is to flush dnotify markers
>
> =A0 =A0 =A0 =A0if (likely(!(filp->f_mode & FMODE_PATH))) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0dnotify_flush(filp, id);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0locks_remove_posix(filp, id);
> =A0 =A0 =A0 =A0}
>
> I don't know much about markers, but as per fsnotify_backend.h
>
> /*
> =A0* a mark is simply an object attached to an in core inode which al=
lows an
> =A0* fsnotify listener to indicate they are either no longer interest=
ed in events
> =A0* of a type matching mask or only interested in those events.
> =A0*
> =A0* these are flushed when an inode is evicted from core and may be =
flushed
> =A0* when the inode is modified (as seen by fsnotify_access). =A0Some=
 fsnotify users
> =A0* (such as dnotify) will flush these when the open fd is closed an=
d not at
> =A0* inode eviction or modification.
> =A0*/
> struct fsnotify_mark {

Unfortunately, I'm still none the wiser about what this means for
O_PATH file descriptors...

> It also doesn't remove posix locks. I tested this with a test prg
>
> =A0 =A0struct flock flock;
> =A0 =A0flock.l_type =3D F_WRLCK;
> =A0 =A0flock.l_whence =3D SEEK_SET;
> =A0 =A0flock.l_start =3D 0;
> =A0 =A0flock.l_len =3D 0;
> =A0 =A0fd =3D open(argv[1], O_RDWR);
> =A0 =A0fcntl(fd, F_SETLKW, &flock);
> =A0 =A0fd =3D open(argv[1], O_PATH);
> =A0 =A0close(fd);
>
> The close doesn't result in lock release.

Okay -- I'll add mention of this to the O_PATH description.

Thanks,

Michael


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
