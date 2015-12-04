From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] document that O_TMPFILE works with shm_open
Date: Fri, 4 Dec 2015 20:40:05 +0100
Message-ID: <CAKgNAkgR3CsE--nGEPCor2X8F_C1KwvbjMwLqhHQE2eB+7+HNg@mail.gmail.com>
References: <562B2CD9.80901@dancol.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <562B2CD9.80901-CpwT7fMy01Ydnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Colascione <dancol-CpwT7fMy01Ydnm+yROfE0A@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Florian Weimer <fweimer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Alexander Viro <viro-RmSDqhL/yNMiFSDQTTA3OLVCufUGDwFn@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello Daniel (and Al),

Al: perhaps you could comment please, as the creator of O_TMPFILE.

On 24 October 2015 at 09:01, Daniel Colascione <dancol-CpwT7fMy01Ydnm+yROfE0A@public.gmane.org> wrote:
> This test program works fine. (Watch it work in strace.) This patch is
> against git master. It's okay to document accidental features, right?
>
> int
> main()
> {
>     int shmfd = shm_open(".", O_TMPFILE | O_RDWR | O_EXCL, 0600);
>     ftruncate(shmfd, 1000);
>     mmap(NULL, 1000, PROT_READ | PROT_WRITE, MAP_SHARED, shmfd, 0);
>
>     return 0;
> }
>
> diff --git a/man3/shm_open.3 b/man3/shm_open.3
> index 6b04f39..7b9b7c3 100644
> --- a/man3/shm_open.3
> +++ b/man3/shm_open.3
> @@ -116,6 +116,32 @@ object can be set using
>  The newly allocated bytes of a shared memory
>  object are automatically initialized to 0.
>  .TP
> +.BR O_TMPFILE " (since Linux 3.11)"
> +.BR shm_open ()
> +can be used to create an anonymous shared memory region by using exactly
> +the string "." as
> +.I name
> +and including both
> +.B O_TMPFILE
> +and
> +.B O_EXCL
> +in
> +.I oflag
> +while omitting
> +.B O_CREAT
> +.
> +Shared memory regions created this way work just like ones created without
> +.B O_TMPFILE
> +and with
> +.B O_CREAT
> +except that they are automatically released and their contents
> discarded when the
> +last reference to the
> +region disappears.  References are either
> +.BR mmap (2)
> +mappings or file descriptors.
> +See also
> +.BR memfd_create (2).
> +.TP
>  .B O_EXCL
>  If
>  .B O_CREAT

So, like Florian, I was a little surprised by this "feature". I'm not
sure whether it should be documented, or perhaps whether it should be
documented as "don't do this".

Al, could you comment? Is this expected behavior/was this planned behavior?

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
