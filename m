From: Denis Barbier <bouzim-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Doubts with sysfs(2)
Date: Sun, 29 Aug 2010 11:25:34 +0200
Message-ID: <AANLkTi=kh3Tnuh+QZxsa8JpAv-RJ8mC9bYUe8cga-sux@mail.gmail.com>
References: <1277635872.25713.4.camel@cowboy>
	<AANLkTilFc81wcLlG_ELqjDb8xz1RZC_Y3Okh5ncCrOxH@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <AANLkTilFc81wcLlG_ELqjDb8xz1RZC_Y3Okh5ncCrOxH-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 2010/6/27 Michael Kerrisk wrote:
[...]
> --- a/man2/sysfs.2
> +++ b/man2/sysfs.2
> @@ -90,12 +90,12 @@ is invalid.
> =C2=A0.SH "CONFORMING TO"
> =C2=A0SVr4.
> =C2=A0.SH NOTES
> -On Linux with the
> -.I proc
> -file system mounted on
> +This System-V derived system call is obsolete; don't use it.
> +On systems with
> =C2=A0.IR /proc ,
> -the same information can be derived from
> -.IR /proc/filesystems .
> +the the same information can be obtained via

Hello Michael,

There is an extra 'the' just above, found in commit d1d721be.

Denis
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
