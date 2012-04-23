From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] resolv.conf.5: Describe single-request option
Date: Tue, 24 Apr 2012 00:14:26 +1200
Message-ID: <CAKgNAkjYnga7Mbv33qk1tue2GNswGNv-RdCq98zQQ7D=2aQEpA@mail.gmail.com>
References: <20090515171713.GG14609@machine.or.cz>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20090515171713.GG14609-DDGJ70k9y3lX+M3pkMnKjw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Petr Baudis <pasky-+ZI9xUNit7I@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Christian Hammers <ch-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>, 607398-61a8vm9lEZVf4u+23C9RwQ@public.gmane.org, control-61a8vm9lEZVf4u+23C9RwQ@public.gmane.org
List-Id: linux-man@vger.kernel.org

tags 607398 fixed-upstream
thanks

Petr,

On Sat, May 16, 2009 at 5:17 AM, Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org> wrote:
> The single-request option was introduced with glibc-2.10.
>
> Also, a note is added to resolver(3) that many of the options
> are actually described in resolv.conf(5).
>
> Signed-off-by: Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org>
>
> ---
>
> Ping, what about the other patches? ;-)
>
> diff --git a/man3/resolver.3 b/man3/resolver.3
> index eabc1a4..181468a 100644
> --- a/man3/resolver.3
> +++ b/man3/resolver.3
> @@ -232,6 +232,9 @@ domain and in parent domains.
> =A0This option is used by
> =A0.BR gethostbyname (3).
> =A0[Enabled by default].
> +.PP
> +This list is not complete. You can find some other flags described i=
n
> +.BR resolv.conf (5).
> =A0.SH "RETURN VALUE"
> =A0The
> =A0.BR res_init ()

I applied these two patches separately.

> diff --git a/man5/resolv.conf.5 b/man5/resolv.conf.5
> index 4d67c75..2a2c694 100644
> --- a/man5/resolv.conf.5
> +++ b/man5/resolv.conf.5
> @@ -231,6 +231,19 @@ sets
> =A0in
> =A0.IR _res.options .
> =A0This enables support for the DNS extensions described in RFC\ 2671=
=2E
> +.TP
> +.BR single-request " (since glibc 2.10)"
> +sets
> +.BR RES_SNGLKUP
> +in
> +.IR _res.options .
> +By default, glibc performs IPv4 and IPv6 lookups in parallel since
> +version 2.9 (though many distribution packages of glibc are known
> +to disable that behavior in this version). Some appliance DNS server=
s
> +cannot handle these queries properly and make the requests time out.
> +This option disables the behavior and makes glibc perform the IPv6
> +and IPv4 requests sequentially (at the cost of some slowdown of the
> +resolving process).
> =A0.RE
> =A0.LP
> =A0The \fIdomain\fP and \fIsearch\fP keywords are mutually exclusive.

I applied a slightly modified version of the above patch that dropped
the details about distros. See below.

These patches will appear in man-pages-3.40.

Cheers,

Michael

--- a/man5/resolv.conf.5
+++ b/man5/resolv.conf.5
@@ -231,6 +231,19 @@ sets
 in
 .IR _res.options .
 This enables support for the DNS extensions described in RFC\ 2671.
+.TP
+.BR single-request " (since glibc 2.10)"
+sets
+.BR RES_SNGLKUP
+in
+.IR _res.options .
+By default, glibc performs IPv4 and IPv6 lookups in parallel since
+version 2.9.
+Some appliance DNS servers
+cannot handle these queries properly and make the requests time out.
+This option disables the behavior and makes glibc perform the IPv6
+and IPv4 requests sequentially (at the cost of some slowdown of the
+resolving process).
 .RE
 .LP
 The \fIdomain\fP and \fIsearch\fP keywords are mutually exclusive.


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
