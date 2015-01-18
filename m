From: enh <enh-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Subject: utimensat(2) may/must confusion
Date: Sat, 17 Jan 2015 17:54:24 -0800
Message-ID: <CAJgzZooHgi2_kqTDLA42KhHOjH6byPQLap2-11KfpfV3TDb03A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

http://man7.org/linux/man-pages/man2/utimensat.2.html

       If both tv_nsec fields are specified as UTIME_OMIT, then no file
       ownership or permission checks are performed, and the file timestamps
       are not modified, but other error conditions may still be detected.

fs/utimes.c

                /* Nothing to do, we must not even check the path.  */
                if (tstimes[0].tv_nsec == UTIME_OMIT &&
                    tstimes[1].tv_nsec == UTIME_OMIT)
                        return 0;

if you're intending to match POSIX, the current text is correct. they
say "If both tv_nsec fields are set to UTIME_OMIT, no ownership or
permissions check shall be performed for the file, but other error
conditions may still be detected (including [EACCES] errors related to
the path prefix)."
(http://pubs.opengroup.org/onlinepubs/9699919799/functions/futimens.html)

but as the snippet above shows, the kernel doesn't, and so will
silently return success even for a non-existent file if both times are
UTIME_OMIT.

i'm not sure why the kernel says "must", but even if they fix that, it
would be useful for the man page to mention this subtlety. something
like "(Note that at present the kernel performs no checks in this
case, not even that the file exists, and will always return
success.)". (strictly that's not true because the EFAULT check for the
struct timespec* will have happened, but it seems less clear to try to
include that fact.)

 --elliott
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
