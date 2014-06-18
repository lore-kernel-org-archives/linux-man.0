From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Minor error in open(2) page, "O_PATH" flag descr.
Date: Wed, 18 Jun 2014 12:14:47 +0200
Message-ID: <CAKgNAkgVULvGQPA86kzY=npY7BoOAKKqzp3sc_J2FWsuveTo5g@mail.gmail.com>
References: <CAGofgLsJs0YPUcKmuXPnXhkad5DuJyMTOAoQpw3VrqoM9adkLw@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAGofgLsJs0YPUcKmuXPnXhkad5DuJyMTOAoQpw3VrqoM9adkLw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?B?0JrQuNGA0LjQu9C7?= <kirillnow-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Wed, Jun 18, 2014 at 8:53 AM, =D0=9A=D0=B8=D1=80=D0=B8=D0=BB=D0=BB <=
kirillnow-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>
> "When O_PATH is specified in flags, flag bits other than
>   O_DIRECTORY and O_NOFOLLOW are ignored."
> You forgot O_CLOEXEC bit.

Thanks for the report. I've verfied, and amended the page. A note for
the future: your report would have been more useful (that is, it would
have saved me some time), if you had explained how you determined the
information.

Thanks,

Michael


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
