From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] Replace Latin abbreviation "cf.".
Date: Fri, 27 Oct 2017 17:43:00 +0200
Message-ID: <ab49f0f9-0c6c-b1c0-4169-07645f95bbe4@gmail.com>
References: <20171027020542.s6gipah6bodf6wsp@crack.deadbeast.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171027020542.s6gipah6bodf6wsp-Z0uaYDh/Ni4SozaZsD9aTtHuzzzSOjJt@public.gmane.org>
Content-Language: en-US
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "G. Branden Robinson" <g.branden.robinson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Branden,

On 10/27/2017 04:05 AM, G. Branden Robinson wrote:
> People seem to be using "cf." ("confere"), which means "compare", to
> mean "see" instead, for which the Latin abbreviation would be "q.v."
> ("quod vide" -> "which see").
> 
> In some cases "cf." might actually be the correct term but it's still
> not clear what specific aspects of a function/system call one is
> supposed to be comparing.
> 
> I left one use in place in hope of obtaining clarification, because it
> looks like it might be useful there, if contextualized.
> 
> Migrate these uses to English and add them to the list of abbreviations
> to be avoided.
> 
> If the patch to vfork(2) is not accepted, then the cf. still needs an \&
> after it because it is at the end of the line but not the end of a
> sentence.

I agree. I applied all of your patch. Also, I fixed mq_overview(7)
to say just "see" rather than "cf.".

Cheers,

Michael

> Signed-off-by: G. Branden Robinson <g.branden.robinson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  man2/vfork.2           | 4 ++--
>  man3/clearenv.3        | 2 +-
>  man3/nl_langinfo.3     | 4 ++--
>  man3/setlocale.3       | 4 ++--
>  man7/man-pages.7       | 7 ++++---
>  man7/mq_overview.7     | 6 +++++-
>  man7/path_resolution.7 | 2 +-
>  7 files changed, 17 insertions(+), 12 deletions(-)
> 
> diff --git a/man2/vfork.2 b/man2/vfork.2
> index c8c3141d8..eddce6a5a 100644
> --- a/man2/vfork.2
> +++ b/man2/vfork.2
> @@ -297,8 +297,8 @@ system call appeared in 3.0BSD.
>  .\" present, but definitely on its way out'.
>  In 4.4BSD it was made synonymous to
>  .BR fork (2)
> -but NetBSD introduced it again,
> -cf.
> +but NetBSD introduced it again;
> +see
>  .UR http://www.netbsd.org\:/Documentation\:/kernel\:/vfork.html
>  .UE .
>  In Linux, it has been equivalent to
> diff --git a/man3/clearenv.3 b/man3/clearenv.3
> index 314092cb6..9ae051959 100644
> --- a/man3/clearenv.3
> +++ b/man3/clearenv.3
> @@ -82,7 +82,7 @@ POSIX.1-1996 did not accept
>  and
>  .BR putenv (3),
>  but changed its mind and scheduled these functions for some
> -later issue of this standard (cf. B.4.6.1).
> +later issue of this standard (see \[sc]B.4.6.1).
>  However, POSIX.1-2001
>  adds only
>  .BR putenv (3),
> diff --git a/man3/nl_langinfo.3 b/man3/nl_langinfo.3
> index 23bcc5dc0..d8b24d233 100644
> --- a/man3/nl_langinfo.3
> +++ b/man3/nl_langinfo.3
> @@ -72,8 +72,8 @@ selected locale, such as "UTF-8", "ISO-8859-1", or "ANSI_X3.4-1968"
>  This is the same string that you get with
>  "locale charmap".
>  For a list of character encoding names,
> -try "locale \-m", cf.\&
> -.BR locale (1).
> +try "locale \-m" (see
> +.BR locale (1)).
>  .TP
>  .BR D_T_FMT \ (LC_TIME)
>  Return a string that can be used as a format string for
> diff --git a/man3/setlocale.3 b/man3/setlocale.3
> index 1bf7b501b..fdfb21202 100644
> --- a/man3/setlocale.3
> +++ b/man3/setlocale.3
> @@ -132,8 +132,8 @@ is a character set or encoding identifier like
>  .B "ISO-8859-1"
>  or
>  .BR "UTF-8" .
> -For a list of all supported locales, try "locale \-a", cf.\&
> -.BR locale (1).
> +For a list of all supported locales, try "locale \-a" (see
> +.BR locale (1)).
>  .PP
>  If
>  .I locale
> diff --git a/man7/man-pages.7 b/man7/man-pages.7
> index 0b4647a79..cf6727af9 100644
> --- a/man7/man-pages.7
> +++ b/man7/man-pages.7
> @@ -799,9 +799,10 @@ when rendering a page with, say:
>  .PP
>       BROWSER=firefox man -H pagename
>  .SS Use of e.g., i.e., etc., a.k.a., and similar
> -In general, the use of abbreviations such as "e.g.", "i.e.", "etc.", "a.k.a."
> -should be avoided, in favor of suitable full wordings
> -("for example", "that is", "and so on", "also known as").
> +In general, the use of abbreviations such as "e.g.", "i.e.", "etc.",
> +"cf.", and "a.k.a." should be avoided,
> +in favor of suitable full wordings
> +("for example", "that is", "compare to", "and so on", "also known as").
>  .PP
>  The only place where such abbreviations may be acceptable is in
>  .I short
> diff --git a/man7/mq_overview.7 b/man7/mq_overview.7
> index 2c3ebbc1d..3f9267d2a 100644
> --- a/man7/mq_overview.7
> +++ b/man7/mq_overview.7
> @@ -68,7 +68,11 @@ of the arrival of a message on a previously empty queue using
>  .PP
>  A message queue descriptor is a reference to an
>  .I "open message queue description"
> -(cf.
> +.\" FIXME: "cf." means "compare".  What is we're supposed to be
> +.\" comparing?  open(2) is a big page and nowhere mentions message
> +.\" queues.  Aren't the relevant differences between messages queues
> +.\" and files already described here, and isn't that the place for them?
> +(cf.\&
>  .BR open (2)).
>  After a
>  .BR fork (2),
> diff --git a/man7/path_resolution.7 b/man7/path_resolution.7
> index 9edcc2b97..50fae5467 100644
> --- a/man7/path_resolution.7
> +++ b/man7/path_resolution.7
> @@ -184,7 +184,7 @@ Linux returns
>  .B ENOENT
>  in this case.
>  .SS Permissions
> -The permission bits of a file consist of three groups of three bits, cf.\&
> +The permission bits of a file consist of three groups of three bits; see
>  .BR chmod (1)
>  and
>  .BR stat (2).
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
