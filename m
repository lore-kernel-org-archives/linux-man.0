From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: man page update (fcntl(2) new set/get write hints)
Date: Thu, 24 Aug 2017 00:41:45 +0200
Message-ID: <feffa54b-d1b4-02e3-5a24-0a8e51f96762@gmail.com>
References: <25b8e025-d49b-e033-5ba3-f6967a6a970f@kernel.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <25b8e025-d49b-e033-5ba3-f6967a6a970f-tSWWG44O7X1aa/9Udqfwiw@public.gmane.org>
Content-Language: en-US
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jens Axboe <axboe-tSWWG44O7X1aa/9Udqfwiw@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello Jens,

On 07/31/2017 05:24 PM, Jens Axboe wrote:
> Hi Michael,
> 
> Not sure what the best way to submit this is, but I wrote an
> update for the fcntl man page to cover the new set/get write
> hints commands that are added in 4.13. Attaching the patch, but
> you can also find it below, in a fork of your github repo:
> 
> https://github.com/axboe/man-pages/commits/fcntl-write-hints

Thanks for the patch. Some questions below.

> From 3eee36f14a650e50f14b42ae1d4fec33e78e6254 Mon Sep 17 00:00:00 2001
> From: Jens Axboe <axboe-tSWWG44O7X1aa/9Udqfwiw@public.gmane.org>
> Date: Mon, 26 Jun 2017 16:58:29 -0600
> Subject: [PATCH] man2/fcntl.2: add description of new read/write hint commands
> 
> This adds a description of the new read/write hint commands:
> 
> F_GET_RW_HINT		Get inode read/write hint
> F_SET_RW_HINT		Set inode read/write hint
> F_GET_FILE_RW_HINT	Get file read/write hint
> F_SET_FILE_RW_HINT	Set file read/write hint
> 
> and the currently available values, as of Linux 4.13.
> 
> Signed-off-by: Jens Axboe <axboe-tSWWG44O7X1aa/9Udqfwiw@public.gmane.org>
> ---
>  man2/fcntl.2 | 58 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 58 insertions(+)
> 
> diff --git a/man2/fcntl.2 b/man2/fcntl.2
> index 70758d2fcd99..07eacc9564fa 100644
> --- a/man2/fcntl.2
> +++ b/man2/fcntl.2
> @@ -5,6 +5,7 @@
>  .\" and Copyright (C) 2002-2010, 2014 Michael Kerrisk;
>  .\" and Copyright (C) 2014 Jeff Layton
>  .\" and Copyright (C) 2014 David Herrmann
> +.\" and Copyright (C) 2017 Jens Axboe
>  .\"
>  .\" %%%LICENSE_START(VERBATIM)
>  .\" Permission is granted to make and distribute verbatim copies of this
> @@ -61,6 +62,8 @@
>  .\"	Document F_SETPIPE_SZ and F_GETPIPE_SZ.
>  .\" 2014-07-08, David Herrmann <dh.herrmann-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>  .\"     Document F_ADD_SEALS and F_GET_SEALS
> +.\" 2017-06-26, Jens Axboe <axboe-tSWWG44O7X1aa/9Udqfwiw@public.gmane.org>
> +.\"     Document F_{GET,SET}_RW_HINT and F_{GET,SET}_FILE_RW_HINT
>  .\"
>  .TH FCNTL 2 2017-05-03 "Linux" "Linux Programmer's Manual"
>  .SH NAME
> @@ -1490,6 +1493,61 @@ Furthermore, if there are any asynchronous I/O operations
>  .RB ( io_submit (2))
>  pending on the file,
>  all outstanding writes will be discarded.
> +.SS File read/write hints
> +Write life time hints can be used to inform the kernel about the relative
> +expected life time of writes on a given inode or file. An application may
> +use this interface for separating writes into different write classes,
> +so that multiple users or applications running on a single storage back-end
> +can aggregate their IO patterns in a consistent manner. However, there are
> +no functional semantics implied by these flags, and different IO classes
> +can use the write life time hints in arbitrary ways so long as they are used
> +consistently.

I read the above, and it is still not clear to me what a "write lifetime" 
is. Can you add some text to explain? (I'm guessing that it means the 
amount of time before the data is overwritten by another write, but I'm
not sure of that, and it needs to be more explicit in the text.)

> +.TP
> +.BR F_GET_RW_HINT " (\fIuint64_t\fP; since Linux 4.13)"
> +Returns the value of the read/write hint associated with the underlying inode
> +for the file descriptor.
> +.TP
> +.BR F_SET_RW_HINT " (\fIuint64_t\fP; since Linux 4.13)"
> +Sets the read/write hint value associated with the underlying inode for the
> +file descriptor.
> +.TP
> +.BR F_GET_FILE_RW_HINT " (\fIuint64_t\fP; since Linux 4.13)"
> +Returns the value of the read/write hint associated with the file descriptor.

Do you mean here "file descriptor" or "file description (i.e., the
open file handle)? Maybe you mean the former, but I want to confirm.

> +.TP
> +.BR F_SET_FILE_RW_HINT " (\fIuint64_t\fP; since Linux 4.13)"
> +Sets the read/write hint value associated with the file descriptor.

Same as above comment.

> +.P
> +If a given file descriptor has not been assigned a read/write hint, then it
> +shall use the value assigned to the inode, if any. The following read/write
> +hints are valid since kernel 4.13:
> +.TP
> +.BR RWH_WRITE_LIFE_NOT_SET
> +No specific hint has been set. This is the default value.
> +.TP
> +.BR RWH_WRITE_LIFE_NONE
> +No specific write life time is associated with this file or inode.
> +.TP
> +.BR RWH_WRITE_LIFE_SHORT
> +Data written to this file or inode is expected to have a short life time.
> +.TP
> +.BR RWH_WRITE_LIFE_MEDIUM
> +Data written to this file or inode is expected to have a life time longer than
> +data written with
> +.BR RWH_WRITE_LIFE_SHORT .
> +.TP
> +.BR RWH_WRITE_LIFE_LONG
> +Data written to this file or inode is expected to have a life time longer than
> +data written with
> +.BR RWH_WRITE_LIFE_MEDIUM .
> +.TP
> +.BR RWH_WRITE_LIFE_EXTREME
> +Data written to this file or inode is expected to have a life time longer than
> +data written with
> +.BR RWH_WRITE_LIFE_LONG .
> +.P
> +All the write specific hints are relative to each other, and no individual
> +absolute meaning should be attributed to them.
> +.P
>  .SH RETURN VALUE
>  For a successful call, the return value depends on the operation:
>  .TP 0.9i

Thanks,

Michael

-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
