From: "Aneesh Kumar K.V" <aneesh.kumar@linux.vnet.ibm.com>
Subject: Re: [PATCH] open(2): document O_PATH
Date: Mon, 30 Apr 2012 13:09:05 +0530
Message-ID: <877gwxacti.fsf@skywalker.in.ibm.com>
References: <1335669917-23970-1-git-send-email-vapier@gentoo.org> <CAKgNAkgykZJV59WJXW9c9gVwXhn=WNYKxo_W1GM7ocHEEFqEXg@mail.gmail.com>User-Agent: Notmuch/0.11.1+346~g13d19c3 (http://notmuchmail.org) Emacs/23.3.1 (x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAKgNAkgykZJV59WJXW9c9gVwXhn=WNYKxo_W1GM7ocHEEFqEXg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mike Frysinger <vapier@gentoo.org>
Cc: linux-man@vger.kernel.org, viro@zeniv.linux.org.uk, Richard Weinberger <richard@nod.at>, lkml <linux-kernel@vger.kernel.org>, Michael Kerrisk <mtk.manpages@gmail.com>
List-Id: linux-man@vger.kernel.org

"Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com> writes:

> Hi Mike,
>
> [Al, Aneesh, there is a question for you below]
>
> On Sun, Apr 29, 2012 at 3:25 PM, Mike Frysinger <vapier@gentoo.org> w=
rote:
>> Signed-off-by: Mike Frysinger <vapier@gentoo.org>
>> ---
>> =C2=A0man2/open.2 | =C2=A0 16 +++++++++++++++-
>> =C2=A01 file changed, 15 insertions(+), 1 deletion(-)
>>
>> diff --git a/man2/open.2 b/man2/open.2
>> index a655fae..61689cf 100644
>> --- a/man2/open.2
>> +++ b/man2/open.2
>> @@ -47,7 +47,6 @@
>> =C2=A0.\" FIXME . Apr 08: The next POSIX revision has O_EXEC, O_SEAR=
CH, and
>> =C2=A0.\" O_TTYINIT. =C2=A0Eventually these may need to be documente=
d. =C2=A0--mtk
>> =C2=A0.\" FIXME Linux 2.6.33 has O_DSYNC, and a hidden __O_SYNC.
>> -.\" FIXME: Linux 2.6.39 added O_PATH
>> =C2=A0.\"
>> =C2=A0.TH OPEN 2 2012-02-27 "Linux" "Linux Programmer's Manual"
>> =C2=A0.SH NAME
>> @@ -428,6 +427,21 @@ For a discussion of the effect of
>> =C2=A0in conjunction with mandatory file locks and with file leases,=
 see
>> =C2=A0.BR fcntl (2).
>> =C2=A0.TP
>> +.B O_PATH
>> +The path is opened for accessing its file attributes only. =C2=A0Si=
nce the file
>> +itself is not opened, most operations (such as
>> +.BR read (2)
>> +or
>> +.BR write (2))
>> +will return
>> +.BR EBADF .
>> +You may however use functions that operate on the file descriptor i=
tself
>> +such as
>> +.BR close (2),
>> +functions that duplicate file descriptors, and as the dirfd argumen=
t with
>> +all the *at style of functions (e.g.
>> +.BR openat (2)).
>> +.TP
>> =C2=A0.B O_SYNC
>> =C2=A0The file is opened for synchronous I/O.
>> =C2=A0Any
>
> Thanks for the prod. Adding this has been on my list for a while.
> There's actually quite a lot more to say, and I've written the patch
> below. Could you check it over.
>
> Al, Aneesh, there is one question for you in a FIXME below. Could you
> take a look please?
>
> Thanks,
>
> Michael
>
>
> --- a/man2/open.2
> +++ b/man2/open.2
> @@ -428,6 +427,66 @@ For a discussion of the effect of
>  in conjunction with mandatory file locks and with file leases, see
>  .BR fcntl (2).
>  .TP
> +.BR O_PATH " (since Linux 2.6.39)"
> +.\" commit 1abf0c718f15a56a0a435588d1b104c7a37dc9bd
> +Obtain a file descriptor that is used only for fetching file attribu=
tes.
> +The file itself is not opened, and most file operations (e.g.,
> +.BR read (2),
> +.BR write (2))
> +fail with the error
> +.BR EBADF .
> +The following operations
> +.I can
> +be performed on the resulting file descriptor:
> +.RS
> +.IP * 3
> +Closing the file descriptor
> +.RB ( close (2)).
> +.\" FIXME Commit 1abf0c718f15a56a0a435588d1b104c7a37dc9bdcw
> +.\" message says that closing the file descriptor does not affect
> +.\" POSIX locks or dnotify.
> +.\" However, my testing shows that it DOES affect dnotify (and inoti=
fy).
> +.\" Does close() affect POSIX locks?
> +.IP *


IIUC what an O_PATH descritor doesn't do is to flush dnotify markers

	if (likely(!(filp->f_mode & FMODE_PATH))) {
		dnotify_flush(filp, id);
		locks_remove_posix(filp, id);
	}

I don't know much about markers, but as per fsnotify_backend.h

/*
 * a mark is simply an object attached to an in core inode which allows=
 an
 * fsnotify listener to indicate they are either no longer interested i=
n events
 * of a type matching mask or only interested in those events.
 *
 * these are flushed when an inode is evicted from core and may be flus=
hed
 * when the inode is modified (as seen by fsnotify_access).  Some fsnot=
ify users
 * (such as dnotify) will flush these when the open fd is closed and no=
t at
 * inode eviction or modification.
 */
struct fsnotify_mark {

It also doesn't remove posix locks. I tested this with a test prg

    struct flock flock;
    flock.l_type =3D F_WRLCK;
    flock.l_whence =3D SEEK_SET;
    flock.l_start =3D 0;
    flock.l_len =3D 0;
    fd =3D open(argv[1], O_RDWR);
    fcntl(fd, F_SETLKW, &flock);
    fd =3D open(argv[1], O_PATH);
    close(fd);

The close doesn't result in lock release.

> +Duplicating the file descriptor
> +.RB ( dup (2),
> +.BR fcntl (2)
> +.BR F_DUPFD ,
> +etc.).
> +.IP *

-aneesh
