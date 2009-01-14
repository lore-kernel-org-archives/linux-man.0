From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [PATCH] getifaddrs.3: New manual page
Date: Wed, 14 Jan 2009 23:24:57 +1300
Message-ID: <496DBD79.3040502@gmail.com>
References: <20081209025634.GD10491@machine.or.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20081209025634.GD10491-DDGJ70k9y3lX+M3pkMnKjw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Petr,

Petr Baudis wrote:
> This patch adds documentation for the getifaddrs() and freeifaddrs()
> functions as they are supported in GNU libc. 

Thanks for this.  I already sent you my revision of this page.
I've committed that page for the upcoming 3.17 release, which
will still be a few days away, which will allow time for you
to send me any fixes you think may be required.

> The manual page is based
> on the original BSD manpage (with licence as it appears on the top
> of the file), but is significantly rewritten for Linux manpages
> standards and containing all the differences.

I made a lot of edits to your page.  Between your work and my
work, I think there is little if any BSD content left in the page,
so:

* I've removed the BSD copyright line
* Added Linux Foundation/Michael Kerrisk to the copyright
* Changed the license to the verbatim license -- but if you 
  would like a different license, let me know.

> A simple example is
> provided.

As noted, I rewrote the example program.

> I'm open to relicensing to any of the standard licences, this one
> should be compatible even with the classic BSD licence.

See above.

> I did not do actually any testing on BSD systems about how exactly
> this call behaves, I have only tried to figure this out from their
> chaotic documentation and it wouldn't surprise me if it would in
> fact behave the same as with glibc now.  I cannot remember hostnames
> of the BSD systems I used to have an account on. ;-)

Okay.

> Few pages are cross-linked to point at getifaddrs(3) now, and
> inet_ntop() got another example pointer.

Some further comments below.

> diff --git a/man2/bind.2 b/man2/bind.2
> index 67a2fcf..7e84e45 100644
> --- a/man2/bind.2
> +++ b/man2/bind.2
> @@ -321,6 +321,7 @@ main(int argc, char *argv[])
>  .BR listen (2),
>  .BR socket (2),
>  .BR getaddrinfo (3),
> +.BR getifaddrs (3),

Applied.

>  .BR ip (7),
>  .BR ipv6 (7),
>  .BR path_resolution (7),
> diff --git a/man2/getsockname.2 b/man2/getsockname.2
> index 0f4ccb3..cab1bbe 100644
> --- a/man2/getsockname.2
> +++ b/man2/getsockname.2
> @@ -110,6 +110,7 @@ See also
>  .SH "SEE ALSO"
>  .BR bind (2),
>  .BR socket (2),
> +.BR getifaddrs (3),

Applied.

>  .BR ip (7),
>  .BR socket (7),
>  .BR unix (7)
> diff --git a/man3/freeifaddrs.3 b/man3/freeifaddrs.3
> new file mode 100644
> index 0000000..a9d5317
> --- /dev/null
> +++ b/man3/freeifaddrs.3
> @@ -0,0 +1 @@
> +man3/getifaddrs.3

I think you meant

.so man3/getifaddrs.3

here.

Applied.

> diff --git a/man3/getifaddrs.3 b/man3/getifaddrs.3
> new file mode 100644
> index 0000000..9e51126

...

Covered in another mail.

> --- a/man3/inet_ntop.3
> +++ b/man3/inet_ntop.3
> @@ -110,8 +110,13 @@ but 2.2 and later have
>  .SH BUGS
>  .B AF_INET6
>  converts IPv4-mapped IPv6 addresses into an IPv6 format.
> +
> +The interface is painful to use since it does not operate on
> +sockaddrs, as apparent from the first example.
>  .SH EXAMPLE
>  See
> +.BR getifaddrs (3)
> +and
>  .BR inet_pton (3).
>  .SH "SEE ALSO"
>  .BR getnameinfo (3),

Not applied, since the example program I added uses getnameinfo() instead.

Thanks for all of this work Petr!

Cheers,

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
