From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH RFC] fcntl.2: update manpage with verbiage about
 file-private locks
Date: Tue, 15 Apr 2014 22:08:50 +0200
Message-ID: <CAKgNAkjAdXber8SZ2EPtUSw2vE=EXpWSC2Q2NQ5S3hcF1GfQBQ@mail.gmail.com>
References: <1389277387-18530-1-git-send-email-jlayton@redhat.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1389277387-18530-1-git-send-email-jlayton-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jeff Layton <jlayton-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-fsdevel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-fsdevel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Ganesha NFS List <nfs-ganesha-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>, samba-technical-w/Ol4Ecudpl8XjKLYN78aQ@public.gmane.org, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello Jeff,

On Thu, Jan 9, 2014 at 3:23 PM, Jeff Layton <jlayton-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
> Please don't merge this yet, as the kernel patches are still a work in
> progress...

Now that this has hit mainline, is this man page patch still current?

Cheers,

Michael

> Signed-off-by: Jeff Layton <jlayton-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> ---
>  man2/fcntl.2 | 97 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 94 insertions(+), 3 deletions(-)
>
> diff --git a/man2/fcntl.2 b/man2/fcntl.2
> index 72dcd7b..74c67b6 100644
> --- a/man2/fcntl.2
> +++ b/man2/fcntl.2
> @@ -208,7 +208,7 @@ struct flock {
>      off_t l_start;   /* Starting offset for lock */
>      off_t l_len;     /* Number of bytes to lock */
>      pid_t l_pid;     /* PID of process blocking our lock
> -                        (F_GETLK only) */
> +                        (F_GETLK and F_GETLKP only) */
>      ...
>  };
>  .fi
> @@ -344,9 +344,13 @@ returns details about one of these locks in the
>  .IR l_type ", " l_whence ", " l_start ", and " l_len
>  fields of
>  .I lock
> -and sets
> +.
> +If the conflicting lock is a traditional POSIX lock, then the
>  .I l_pid
> -to be the PID of the process holding that lock.
> +will be set to the PID of the process holding that lock. If the
> +conflicting lock is a file-private lock, then the
> +.I l_pid
> +will be set to -1.
>  .P
>  In order to place a read lock,
>  .I fd
> @@ -386,6 +390,93 @@ should be avoided; use
>  and
>  .BR write (2)
>  instead.
> +.SS File-private locking
> +(Currently non-POSIX, but being proposed)
> +.PP
> +.BR F_GETLKP ", " F_SETLKP " and  " F_SETLKPW
> +are used to acquire, release and test file-private record locks. These
> +are byte-range locks that work identically to the traditional advisory
> +record locks described above, but are associated with the open file on
> +which they were acquired rather than the process, much like locks
> +acquired with
> +.BR flock (2)
> +.
> +.PP
> +Unlike traditional advisory record locks, these locks are inherited
> +across
> +.BR fork (2) ", " dup (2) " and " dup2 (2)
> +and are only released on the last close of the open file instead of being
> +released on any close of the file.
> +.PP
> +File-private locks always conflict with traditional record locks, even
> +when they are acquired by the same process on the same file descriptor.
> +They only conflict with each other when they are acquired on different
> +open file descriptors.
> +.TP
> +.BR F_SETLKP " (\fIstruct flock *\fP)"
> +Acquire a lock (when
> +.I l_type
> +is
> +.B F_RDLCK
> +or
> +.BR F_WRLCK )
> +or release a lock (when
> +.I l_type
> +is
> +.BR F_UNLCK )
> +on the bytes specified by the
> +.IR l_whence ", " l_start ", and " l_len
> +fields of
> +.IR lock .
> +If a conflicting lock is held by another process,
> +this call returns \-1 and sets
> +.I errno
> +to
> +.B EACCES
> +or
> +.BR EAGAIN .
> +.TP
> +.BR F_SETLKPW " (\fIstruct flock *\fP)"
> +As for
> +.BR F_SETLKP ,
> +but if a conflicting lock is held on the file, then wait for that
> +lock to be released.
> +If a signal is caught while waiting, then the call is interrupted
> +and (after the signal handler has returned)
> +returns immediately (with return value \-1 and
> +.I errno
> +set to
> +.BR EINTR ;
> +see
> +.BR signal (7)).
> +.TP
> +.BR F_GETLKP " (\fIstruct flock *\fP)"
> +On input to this call,
> +.I lock
> +describes a lock we would like to place on the file.
> +If the lock could be placed,
> +.BR fcntl ()
> +does not actually place it, but returns
> +.B F_UNLCK
> +in the
> +.I l_type
> +field of
> +.I lock
> +and leaves the other fields of the structure unchanged.
> +If one or more incompatible locks would prevent
> +this lock being placed, then
> +.BR fcntl ()
> +returns details about one of these locks in the
> +.IR l_type ", " l_whence ", " l_start ", and " l_len
> +fields of
> +.I lock
> +.
> +If the conflicting lock is a traditional POSIX lock, then the
> +.I l_pid
> +will be set to the PID of the process holding that lock. If the
> +conflicting lock is a file-private lock, then the
> +.I l_pid
> +will be set to -1.
>  .SS Mandatory locking
>  (Non-POSIX.)
>  The above record locks may be either advisory or mandatory,
> --
> 1.8.4.2
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-man" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
