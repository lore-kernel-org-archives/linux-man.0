From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [PATCH] pthread_attr_setdetachstate.3, pthread_attr_setschedparam.3,
	pthread_attr_setschedpolicy.3: Argument name is 'attr', not 'thread'
Date: Wed, 3 Feb 2010 05:51:30 +0100
Message-ID: <cfd18e0f1002022051p7273a0eo455a67d448dc595f@mail.gmail.com>
References: <7b3bdec71002011255h2cc49a05kee38dd611e0732e9@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <7b3bdec71002011255h2cc49a05kee38dd611e0732e9-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Denis Barbier <bouzim-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Denis,

On Mon, Feb 1, 2010 at 9:55 PM, Denis Barbier <bouzim-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Hi,
>
> Subject says it all; in those 3 pages, function argument is 'attr' bu=
t
> it has been misnamed as 'thread' in description.

Thanks. Applied for 3.24.

Cheers,

Michael


> From 63154fb092db324e2a50912b31a92b87b54c665b Mon Sep 17 00:00:00 200=
1
> From: Denis Barbier <bouzim-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Date: Sun, 31 Jan 2010 21:53:31 +0100
> Subject: [PATCH] pthread_attr_setdetachstate.3,
> pthread_attr_setschedparam.3, pthread_attr_setschedpolicy.3: Argument
> name is 'attr', not 'thread'
>
> ---
> =A0man3/pthread_attr_setdetachstate.3 | =A0 =A02 +-
> =A0man3/pthread_attr_setschedparam.3 =A0| =A0 =A02 +-
> =A0man3/pthread_attr_setschedpolicy.3 | =A0 =A02 +-
> =A03 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/man3/pthread_attr_setdetachstate.3
> b/man3/pthread_attr_setdetachstate.3
> index cf130da..31908c3 100644
> --- a/man3/pthread_attr_setdetachstate.3
> +++ b/man3/pthread_attr_setdetachstate.3
> @@ -40,7 +40,7 @@ The
> =A0.BR pthread_attr_setdetachstate ()
> =A0function sets the detach state attribute of the
> =A0thread attributes object referred to by
> -.IR thread
> +.IR attr
> =A0to the value specified in
> =A0.IR detachstate .
> =A0The detach state attribute determines whether a thread created usi=
ng
> diff --git a/man3/pthread_attr_setschedparam.3
> b/man3/pthread_attr_setschedparam.3
> index df36e84..ad10fbd 100644
> --- a/man3/pthread_attr_setschedparam.3
> +++ b/man3/pthread_attr_setschedparam.3
> @@ -40,7 +40,7 @@ The
> =A0.BR pthread_attr_setschedparam ()
> =A0function sets the scheduling parameter attributes of the
> =A0thread attributes object referred to by
> -.IR thread
> +.IR attr
> =A0to the values specified in the buffer pointed to by
> =A0.IR param .
> =A0These attributes determine the scheduling parameters of
> diff --git a/man3/pthread_attr_setschedpolicy.3
> b/man3/pthread_attr_setschedpolicy.3
> index 478d576..69a3458 100644
> --- a/man3/pthread_attr_setschedpolicy.3
> +++ b/man3/pthread_attr_setschedpolicy.3
> @@ -40,7 +40,7 @@ The
> =A0.BR pthread_attr_setschedpolicy ()
> =A0function sets the scheduling policy attribute of the
> =A0thread attributes object referred to by
> -.IR thread
> +.IR attr
> =A0to the value specified in
> =A0.IR policy .
> =A0This attribute determines the scheduling policy of
> --
> 1.7.0.rc1.7.gc0da5
>



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface" http://blog.man7.org/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
