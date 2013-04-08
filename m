From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] elf(5): add byte positions for all EI_xxx fields
Date: Mon, 8 Apr 2013 11:28:56 +0200
Message-ID: <CAKgNAkjqTupSGiKBRWDM4o7-NDWLELQfN+SgLGaJMh2w=UuLjw@mail.gmail.com>
References: <1365362861-12813-1-git-send-email-vapier@gentoo.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1365362861-12813-1-git-send-email-vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Sun, Apr 7, 2013 at 9:27 PM, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org> wrote:
> When describing e_ident, most of the EI_xxx defines mention the exact
> byte number.  This is useful when manually hacking an ELF with a hex
> editor.  However, the last few fields don't do this which means you
> have to count things up yourself.  Add a single world to each so you
> don't have to do that.

Thanks, Mike. Applied.

Cheers,

Michael



> Signed-off-by: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
> ---
>  man5/elf.5 | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/man5/elf.5 b/man5/elf.5
> index 8427244..e08987d 100644
> --- a/man5/elf.5
> +++ b/man5/elf.5
> @@ -241,7 +241,7 @@ Two's complement, big-endian.
>  .TP
>  .PD 0
>  .BR EI_VERSION
> -The version number of the ELF specification:
> +The seventh byte is the version number of the ELF specification:
>  .\" .Bl -tag -width "EV_CURRENT" -compact
>  .RS 12
>  .TP 14
> @@ -255,7 +255,7 @@ Current version.
>  .\".El
>  .TP
>  .BR EI_OSABI
> -This byte identifies the operating system
> +The eighth byte identifies the operating system
>  and ABI to which the object is targeted.
>  Some fields in other ELF structures have flags
>  and values that have platform-specific meanings;
> @@ -332,7 +332,7 @@ Stand-alone (embedded) ABI.
>  .RE
>  .TP
>  .BR EI_ABIVERSION
> -This byte identifies the version of the ABI
> +The ninth byte identifies the version of the ABI
>  to which the object is targeted.
>  This field is used to distinguish among incompatible versions of an ABI.
>  The interpretation of this version number
> --
> 1.8.1.2
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-man" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



--
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
