From: Vasily Kulikov <segoon-cxoSlKxDwOJWk0Htik3J/w@public.gmane.org>
Subject: Re: For review: pid_namespaces(7) man page
Date: Thu, 28 Feb 2013 18:24:40 +0400
Message-ID: <20130228142440.GA6328@cachalot>
References: <CAKgNAki=mUYuu_Ewhe7sjCmo+Dq2Vr+FZCixqNRaadcvAxtpFw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAKgNAki=mUYuu_Ewhe7sjCmo+Dq2Vr+FZCixqNRaadcvAxtpFw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "Eric W. Biederman" <ebiederm-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Containers <containers-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Michael,

On Thu, Feb 28, 2013 at 12:24 +0100, Michael Kerrisk (man-pages) wrote:
>    The namespace init process
>        The first process created in a new namespace (i.e., the process
>        created using clone(2) with the CLONE_NEWPID flag, or the first
>        child created by a process after a call to unshare(2) using the
>        CLONE_NEWPID flag) has the PID 1, and is the "init" process for
>        the namespace (see init(1)).  Children that are orphaned within
>        the namespace will be reparented to this  process  rather  than
>        init(1).

Probably it worth noting here that this is true unless
prctl() with PR_SET_CHILD_SUBREAPER option is called.

Thanks,

-- 
Vasily Kulikov
http://www.openwall.com - bringing security into open computing environments
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
