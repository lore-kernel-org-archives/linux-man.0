From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] Update the random(4) documentation towards a more
 accurate view on /dev/urandom
Date: Wed, 9 Nov 2016 16:23:56 +0100
Message-ID: <b07fb334-149d-cf65-74f3-1d1951e5981b@gmail.com>
References: <1461574090.32558.45.camel@redhat.com>
 <1470052099.2926.6.camel@redhat.com> <1476952646.2522.10.camel@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1476952646.2522.10.camel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nikos Mavrogiannopoulos <nmav-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, tytso-3s7WtUTddSA@public.gmane.org, George Spelvin <linux-gpGsJRJZ3PBBDgjK7y7TUQ@public.gmane.org>, Stephan Mueller <smueller-T9tCv8IpfcWELgA04lAiVw@public.gmane.org>, =?UTF-8?Q?Carl_Winb=c3=a4ck?= <c@tunnel53.net>, Laurent Georget <laurent-AyimVQWTEHzsq35pWSNszA@public.gmane.org>, mpm-VDJrAJ4Gl5ZBDgjK7y7TUQ@public.gmane.org
List-Id: linux-man@vger.kernel.org

[I'm looping a few people into this mail who previously commented
on this page. Nikos, I will also thread you into an earlier mail 
by Laurent Georget.]

Hello Nikos,

Sorry that I have been so slow to follow up on this.
Thanks for your persistence. I have some comments 
that probably require some tweaks to your patch.
I also have some questions about a couple of other 
earlier discussions.

On 10/20/2016 10:37 AM, Nikos Mavrogiannopoulos wrote:
> On Mon, 2016-08-01 at 13:48 +0200, Nikos Mavrogiannopoulos wrote:
>> > This is an updated patch reflecting the recent discussion in linux-
>> > crypto:
>> > http://www.mail-archive.com/linux-crypto-u79uwXL29TY76Z2rM5mHXA@public.gmane.org/msg20400.html
> Hi,
>  I'm resending the patch with few typo fixes, and adding Ted in CC for
> review. Ted would you like to review this patch for the random(4)
> manpage?

Some comments below.

But one question first. You didn't further reply to George 
Spelvin's comments on 26 April. Did you consider those comments
irrelevant or already addressed or something else?

By the way, inline patches are rather easier for me to deal with.

> 0001-Update-the-random-4-documentation-towards-a-more-acc.patch
> 
> 
> From 7952cf6bbabf36a4be50a3ba953278077f7b5157 Mon Sep 17 00:00:00 2001
> From: Nikos Mavrogiannopoulos <nmav-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> Date: Thu, 7 Apr 2016 09:08:14 +0200
> Subject: [PATCH] Update the random(4) documentation towards a more accurate
>  view on /dev/urandom
> 
> This documents the "property" of /dev/urandom of being able to serve numbers
> prior to pool being initialized, and removes any suggested usages of /dev/random
> which are disputable (i.e., one-time pad).
> Document the fact /dev/random is a legacy interface and only suitable for
> applications which can afford indeterminate delays since very few applications
> can do so.
> 
> Signed-off-by: Nikos Mavrogiannopoulos <nmav-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> ---
>  man4/random.4 | 51 ++++++++++++++++++++++++++-------------------------
>  1 file changed, 26 insertions(+), 25 deletions(-)
> 
> diff --git a/man4/random.4 b/man4/random.4
> index b67c46f..c7afaf4 100644
> --- a/man4/random.4
> +++ b/man4/random.4
> @@ -13,8 +13,9 @@
>  .\" 2004-04-08, AEB, Improved description of read from /dev/urandom
>  .\" 2008-06-20, George Spelvin <linux-gpGsJRJZ3PBBDgjK7y7TUQ@public.gmane.org>,
>  .\"             Matt Mackall <mpm-VDJrAJ4Gl5ZBDgjK7y7TUQ@public.gmane.org>
> -.\"     Add a Usage subsection that recommends most users to use
> -.\"     /dev/urandom, and emphasizes parsimonious usage of /dev/random.
> +.\" 2016-10-20, Nikos Mavrogiannopoulos <nmav-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> +.\"     Mention that /dev/random is a legacy interface and removed suggested
> +.\"     uses of /dev/random.

No need to update this in-page changelog. We use git these days.

>  .\"
>  .TH RANDOM 4 2016-10-08 "Linux" "Linux Programmer's Manual"
>  .SH NAME
> @@ -37,11 +38,22 @@ The generator also keeps an estimate of the
>  number of bits of noise in the entropy pool.
>  From this entropy pool random numbers are created.
>  .LP
> -When read, the \fI/dev/random\fP device will return random bytes
> -only within the estimated number of bits of noise in the entropy
> -pool.
> -\fI/dev/random\fP should be suitable for uses that need very
> -high quality randomness such as one-time pad or key generation.
> +When read, the \fI/dev/urandom\fP device return random bytes using a pseudorandom 
> +number generator seeded from the entropy pool. That operation is
> +non-blocking. When used during early boot time, this device may return
> +data prior to the entropy pool being initialized.
> +If this is of concern in your application, use
> +.BR getrandom(2)
> +or \fI/dev/random\fP instead.
> +
> +.LP
> +The \fI/dev/random\fP device is a legacy interface which dates back to
> +a time where the cryptographic primitives used in the implementation

s%in the implementation%in the implementation of /dev/urandom% ?

If that's not correct, can you please say more precisely
what "implementation" you are referring to.

> +were not widely trusted. It will return random bytes
> +only within the estimated number of bits of fresh noise in the entropy
> +pool, blocking if necessary.
> +\fI/dev/random\fP is suitable for applications that need very
> +high quality randomness, and can afford indeterminate delays.
>  When the entropy pool is empty, reads from \fI/dev/random\fP will block
>  until additional environmental noise is gathered.
>  If
> @@ -60,18 +72,8 @@ will return -1 and
>  .I errno
>  will be set to
>  .BR EAGAIN .
> -.LP
> -A read from the \fI/dev/urandom\fP device will not block
> -waiting for more entropy.
> -If there is not sufficient entropy, a pseudorandom number generator is used
> -to create the requested bytes.
> -As a result, in this case the returned values are theoretically vulnerable to a
> -cryptographic attack on the algorithms used by the driver.
> -Knowledge of how to do this is not available in the current unclassified
> -literature, but it is theoretically possible that such an attack may
> -exist.
> -If this is a concern in your application, use \fI/dev/random\fP
> -instead.
> +
> +The flag
>  .B O_NONBLOCK
>  has no effect when opening
>  .IR /dev/urandom .
> @@ -82,6 +84,8 @@ for the device
>  signals will not be handled until after the requested random bytes
>  have been generated.
>  
> +
> +

Please remove these two blank lines.

>  Since Linux 3.16,
>  .\" commit 79a8468747c5f95ed3d5ce8376a3e82e0c5857fc
>  a
> @@ -104,14 +108,11 @@ This means that it will impact the contents
>  read from both files, but it will not make reads from
>  \fI/dev/random\fP faster.
>  .SS Usage
> -If you are unsure about whether you should use
> +The 
>  .IR /dev/random
> -or
> +interface is considered a legacy interface, and

I'm a little uncomfortable with the term "legacy". To me it implies 
that there is *no* legitimate use of /dev/random these days. I'm
no expert on randomness, but I wonder if that is true. Is it?
If it's not, then I would prefer simply a strong statement that
"/dev/urandom is preferred and sufficient in all use cases".

>  .IR /dev/urandom ,
> -then probably you want to use the latter.
> -As a general rule,
> -.IR /dev/urandom
> -should be used for everything except long-lived GPG/SSL/SSH keys.
> +is recommended for general use.
>  
>  If a seed file is saved across reboots as recommended below (all major
>  Linux distributions have done this since 2000 at least), the output is
> -- 2.7.4

Laurent Georget also commented on this page in a mail last year.
I'm going to thread you (and the other people on this mail) into
that mail discussion in case there's something there that you
might incorporate into a revised patch.

Cheers,

Michael


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
