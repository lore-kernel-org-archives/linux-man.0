From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: typo fixes in
Date: Tue, 8 May 2012 09:17:19 +1200
Message-ID: <CAKgNAkjg7mW6ZQMSjG755+gkqTZ8QeFUdM0FETtaejyFxNZB-w@mail.gmail.com>
References: <CALhU9tnz7QAnqfCz-Td95wW9kVYFG=Rwgk76ChYcjBcOmKHQFQ@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CALhU9tnz7QAnqfCz-Td95wW9kVYFG=Rwgk76ChYcjBcOmKHQFQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Akihiro MOTOKI <amotoki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Tue, May 8, 2012 at 6:01 AM, Akihiro MOTOKI <amotoki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrot=
e:
> Hello,
>
> Here are minor typo fixes (against man-pages 3.40 release).
>
> Thanks in advance,

Hello Akihiro.

Thanks. I applied the patches.

Cheers,

Michael


> --
> Akihiro MOTOKI <amotoki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>
> diff --git a/man3/posix_memalign.3 b/man3/posix_memalign.3
> index 5d33cba..012860f 100644
> --- a/man3/posix_memalign.3
> +++ b/man3/posix_memalign.3
> @@ -259,7 +259,7 @@ and then align the obtained value).
> =A0.\" but not to
> =A0.\" .IR realloc (3).
> =A0The glibc implementation
> -allows memory obtained from any of these these functions to be
> +allows memory obtained from any of these functions to be
> =A0reclaimed with
> =A0.BR free (3).
>
> diff --git a/man7/capabilities.7 b/man7/capabilities.7
> index 8d69ba4..09dc018 100644
> --- a/man7/capabilities.7
> +++ b/man7/capabilities.7
> @@ -363,7 +363,7 @@ to insert characters into the input queue of a
> terminal other than
> =A0the caller's controlling terminal.
> =A0.IP *
> =A0employ the obsolete
> -.BR nfsservctl (2);
> +.BR nfsservctl (2)
> =A0system call;
> =A0.IP *
> =A0employ the obsolete
> --
> To unsubscribe from this list: send the line "unsubscribe linux-man" =
in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
