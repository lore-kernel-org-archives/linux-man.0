From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [patch] sem_open.3 and sem_overview.7
Date: Fri, 20 Feb 2009 16:14:03 +1300
Message-ID: <cfd18e0f0902191914m3d9fa47cuf78681337452480c@mail.gmail.com>
References: <20090215182437.GA12604@toerring.de>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20090215182437.GA12604-ea6gLeB8pccb1SvskN2V4Q@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: jt-ea6gLeB8pccb1SvskN2V4Q@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Jens,

Thanks for this very thorough report!

On 2/16/09, Jens Thoms Toerring <jt-ea6gLeB8pccb1SvskN2V4Q@public.gmane.org> wrote:
> Dear Michael,
>
>    I have here two small patches for the man pages sem_open(3)
> and sem_overview(7). They result from a recent discussion in
> c.o.l.d.a where someone had problems creating a named semaphore
> using a name of "/tmp/somename". From the man pages it's not
> absolutely clear that this isn't allowed.

Agreed.

> Moreover, one gets an
> errno of ENOENT in this case which doesn't seem to be covered
> in sem_open(3). Thus I made a modification in sem_overview(7)
> so that it now says that slashes embedded into to the name are
> not allowed and to sem_open(3) to say that ENOENT can also be
> the result of having O_CREAT set in oflag but using an invalid
> name.

See my comments below.

>     The actual situation is a bit more complicated as a look at
> the glibc code for sem_open() shows (you can actually use a slash
> in the name, e.g. "/aaa/bbb", but then a directory named sem.aaa
> you have write permissions for must already exist in /dev/shm,
> moreover, the slash at the start isn't needed).

Thanks for filling in that background.  My reading of the glibc
source, plus testing, confirms what you say.

> But I guess that
> isn't of much relevance to the user and probably is better left
> untold since putting it into writing might make it more difficult
> to change the behaviour later on.

Indeed, this is best left untold, since it's non-standard,
non-portable behavior that could change.

> Here's the diff for sem_overview(7):
>
> ----------8<------------------------------------------------------
> --- sem_overview.7	2009-02-09 03:14:25.000000000 +0100
> +++ sem_overview.7.new	2009-02-15 18:40:48.000000000 +0100
> @@ -48,6 +48,9 @@
>  Two processes can operate on the same named semaphore by passing
>  the same name to
>  .BR sem_open (3).
> +Note that
> +.IR /somename
> +may not contain slashes except the required one at the very start.

In fact, I made a bigger fix, stating:

A named semaphore is identified by a name of the form /somename;
that is, a null-terminated string of up to NAME_MAX+1 (i.e., 256)
characters consisting of an initial slash, followed by one or more
characters, none of which are slashes.

>  The
>  .BR sem_open (3)
> @@ -113,7 +116,7 @@
>  normally mounted under
>  .IR /dev/shm ,
>  with names of the form
> -.IR \fBsem.\fPname .
> +.IR \fBsem.\fPsomename .

Yep -- made that change.

>  Since Linux 2.6.19, ACLs can be placed on files under this directory,
>  to control object permissions on a per-user and per-group basis.
> ----------8<------------------------------------------------------
>
> and here's the one for sem_open(3):
>
> ----------8<------------------------------------------------------
> --- sem_open.3	2009-02-09 03:14:20.000000000 +0100
> +++ sem_open.3.new	2009-02-15 18:46:11.000000000 +0100
> @@ -149,10 +149,17 @@
>  The
>  .B O_CREAT
>  flag was not specified in
> -.IR oflag ,
> +.IR oflag
>  and no semaphore with this
>  .I name
> -exists.
> +exists, or the
> +.B O_CREAT
> +flag
> +was set in
> +.IR oflag
> +but
> +.I name
> +wasn't well-formed.

I applied this change, with slight edits.

The changes will be in man-pages-3.19.

In fact, your report also caused me to look at the pages for POSIX
message queues and shared memory, and make analogous changes there
(mq_overview.7, mq_open.3, shm_open.3).

Thanks very much!

Michael


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
git://git.kernel.org/pub/scm/docs/man-pages/man-pages.git
man-pages online: http://www.kernel.org/doc/man-pages/online_pages.html
Found a bug? http://www.kernel.org/doc/man-pages/reporting_bugs.html
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
