From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] lseek.2, inet_pton.3, tzfile.5: tfix
Date: Fri, 23 Sep 2011 07:04:37 +0200
Message-ID: <CAKgNAkiyH8ho1hjd2y3XHmf_A9x+jH_7g7kf4e8aD=+EeuRUcw@mail.gmail.com>
References: <1316742690-15258-1-git-send-email-taffit@debian.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1316742690-15258-1-git-send-email-taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?David_Pr=E9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi David,

On Fri, Sep 23, 2011 at 3:51 AM, David Pr=E9vot <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org> wro=
te:
>
> Signed-off-by: David Pr=E9vot <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
> ---
>
> Hi Michael,
>
> Please find attach a consistency fix: there were only five =93zeroes=94
> but twenty four =93zeros=94 in those manual pages.

Yes, thanks for that. (See also the 2.80 changelog. Some instances
crept back since that global change.)

Change will be in 3.34.

Cheers

Michael

> =A0man2/lseek.2 =A0 =A0 | =A0 =A06 +++---
> =A0man3/inet_pton.3 | =A0 =A02 +-
> =A0man5/tzfile.5 =A0 =A0| =A0 =A02 +-
> =A03 files changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/man2/lseek.2 b/man2/lseek.2
> index 9e62bc6..a7c435c 100644
> --- a/man2/lseek.2
> +++ b/man2/lseek.2
> @@ -126,12 +126,12 @@ This can be useful for applications such as fil=
e backup tools,
> =A0which can save space when creating backups and preserve holes,
> =A0if they have a mechanism for discovering holes.
>
> -For the purposes of these operations, a hole is a sequence of zeroes=
 that
> +For the purposes of these operations, a hole is a sequence of zeros =
that
> =A0(normally) has not been allocated in the underlying file storage.
> =A0However, a file system is not obliged to report holes,
> =A0so these operations are not a guaranteed mechanism for
> =A0mapping the storage space actually allocated to a file.
> -(Furthermore, a sequence of zeroes that actually has been written
> +(Furthermore, a sequence of zeros that actually has been written
> =A0to the underlying storage may not be reported as a hole.)
> =A0In the simplest implementation,
> =A0a file system can support the operations by making
> @@ -145,7 +145,7 @@ return
> =A0(i.e., even if the location referred to by
> =A0.I offset
> =A0is a hole,
> -it can be considered to consist of data that is a sequence of zeroes=
).
> +it can be considered to consist of data that is a sequence of zeros)=
=2E
> =A0.\" https://lkml.org/lkml/2011/4/22/79
> =A0.\" http://lwn.net/Articles/440255/
> =A0.\" http://blogs.oracle.com/bonwick/entry/seek_hole_and_seek_data
> diff --git a/man3/inet_pton.3 b/man3/inet_pton.3
> index dfc879f..a2054cb 100644
> --- a/man3/inet_pton.3
> +++ b/man3/inet_pton.3
> @@ -93,7 +93,7 @@ For example, the loopback address
> =A0.I 0:0:0:0:0:0:0:1
> =A0can be abbreviated as
> =A0.IR ::1 .
> -The wildcard address, consisting of all zeroes, can be written as
> +The wildcard address, consisting of all zeros, can be written as
> =A0.IR :: .
> =A0.IP 3.
> =A0An alternate format is useful for expressing IPv4-mapped IPv6 addr=
esses.
> diff --git a/man5/tzfile.5 b/man5/tzfile.5
> index 51a1c8e..3b938dd 100644
> --- a/man5/tzfile.5
> +++ b/man5/tzfile.5
> @@ -13,7 +13,7 @@ begin with the magic characters "TZif" to identify =
then as
> =A0timezone information files,
> =A0followed by a character identifying the version of the file's form=
at
> =A0(as of 2005, either an ASCII NUL ('\\0') or a '2')
> -followed by fifteen bytes containing zeroes reserved for future use,
> +followed by fifteen bytes containing zeros reserved for future use,
> =A0followed by six four-byte values of type
> =A0.IR long ,
> =A0written in a "standard" byte order
> --
> 1.7.6.3
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-man" =
in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
