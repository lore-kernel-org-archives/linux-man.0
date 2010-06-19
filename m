From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: should strstr return const char* ?
Date: Sat, 19 Jun 2010 07:49:52 +0200
Message-ID: <AANLkTinbQcpzexZjYa3pG1Ik9FPZUUwexnZBYm4V096P@mail.gmail.com>
References: <4B8AE057.7000000@jguk.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4B8AE057.7000000-hus3n9K41k0@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon <jg-hus3n9K41k0@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Jon,

On Sun, Feb 28, 2010 at 11:29 PM, Jon <jg-hus3n9K41k0@public.gmane.org> wrote:
> Hi there,
>
> A couple of queries. I hope could be considered.
>
> I see this function on Ubuntu 9.10:
>
> =A0 =A0 char *strstr(const char *haystack, const char *needle);
>
> Should it not return as const char * though?

As Mike Frysinger pointed out, man-pages here is documenting things as
they are in glibc. (Also, POSIX does not document a "const" here in
the spec.)

> Also could the description be clarified:
> DESCRIPTION
> =A0 =A0 =A0 The strstr() function finds the first occurrence of the s=
ubstring
> needle in the string haystack. =A0The terminating
> =A0 =A0 =A0 '\0' characters are not compared.
>
>
> Can this be added: "If needle is longer than haystack it will never m=
atch.
> When the search reaches a character position in haystack which does n=
ot
> leave enough characters left to compare, searching will end, the hays=
tack
> buffer will not be overrun.

I regard these points as reasonably self-evident, so I don't think
they really need to be specifically mentioned. (What else could one
reasonably expect to happen in these cases?)

Thanks,

Michael



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface" http://blog.man7.org/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
