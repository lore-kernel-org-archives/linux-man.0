From: Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org>
Subject: Re: [PATCH] elf.5: Add description for ELF extension
Date: Tue, 11 May 2010 03:58:54 +0200
Message-ID: <20100511015854.GF16800@machine.or.cz>
References: <20100315.120246.193685481.d.hatayama@jp.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20100315.120246.193685481.d.hatayama-+CUm20s59erQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daisuke HATAYAMA <d.hatayama-+CUm20s59erQFUHtdCDX3A@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

  Hi!

On Mon, Mar 15, 2010 at 12:02:46PM +0900, Daisuke HATAYAMA wrote:
> diff --git a/man5/elf.5 b/man5/elf.5
> index 20ed3d8..e4987b8 100644
> --- a/man5/elf.5
> +++ b/man5/elf.5
> @@ -30,7 +30,7 @@
>  .\" 2007-10-11, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>, various fixes
>  .\" 2007-12-08, mtk, Converted from mdoc to man macros
>  .\"
> -.TH ELF 5 2007-12-28 "Linux" "Linux Programmer's Manual"
> +.TH ELF 5 2010-01-21 "Linux" "Linux Programmer's Manual"
>  .SH NAME
>  elf \- format of Executable and Linking Format (ELF) files
>  .SH SYNOPSIS
> @@ -543,6 +543,28 @@ in bytes.
>  If a file has no program header,
>  .IR e_phnum
>  holds the value zero.
> +.IP
> +If the number of entries in the program header table is larger than or equal to
> +.BR PN_XNUM
> +(0xffff), this member holds
> +.BR PN_XNUM
> +(0xffff). The real number of entries in the program header table is held in

I would join the two sentences with "and" or similarly.

> +.IR sh_info
> +member of the initial entry in section header table. Otherwise, the
> +.IR sh_info
> +member of the initial entry contains the value zero.
> +.\" .Bl -tag -width "PN_XNUM"
> +.RS 12
> +.TP 9
> +.BR PN_XNUM
> +This is defined as 0xffff, the largest number
> +.IR e_phnum
> +can have, specifying where the actual number of program headers is
> +assigned.
> +.PD
> +.RE
> +.\" .El
> +.IP
>  .TP
>  .IR e_shentsize
>  This member holds a sections header's size in bytes.
> @@ -561,6 +583,17 @@ If a file has no section
>  header table,
>  .IR e_shnum
>  holds the value of zero.
> +.IP
> +If the number of entries in the section header table is larger than or equal to
> +.BR SHN_LORESERVE
> +(0xff00),
> +.IR e_shnum
> +holds the value zero. The real number of entries in the section header

  I would join the two sentences with "and" or similarly, again.

  What a strange interface, the other two hold the max value while
e_shnum holds zero in case of overflow.

> +table is held in
> +.IR sh_size
> +of the initial entry in section header table. Otherwise, the
> +.IR sh_size
> +of the initial entry in section header table holds the value zero.
>  .TP
>  .IR e_shstrndx
>  This member holds the section header table index of the entry associated

  I think you should also note this special meaning in sh_size
description.

> @@ -568,6 +601,17 @@ with the section name string table.
>  If the file has no section name string
>  table, this member holds the value
>  .BR SHN_UNDEF .
> +.IP
> +If the index of section name string table section is larger than or equal to
> +.BR SHN_LORESERVE
> +(0xff00), this member holds
> +.BR SHN_XINDEX
> +(0xffff) and the real index of the section name string table section
> +is held in the
> +.IR sh_link
> +member of the initial entry in section header table. Otherwise, the
> +.IR sh_link
> +member of the initial entry in section header table contains the value zero.
>  .RS 12
>  .\" .Bl -tag -width "SHN_LORESERVE"
>  .TP 14

  I think you should describe these as Linux extensions in the NOTES
section.

  Kind regards,

-- 
				Petr "Pasky" Baudis
When I feel like exercising, I just lie down until the feeling
goes away.  -- xed_over
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
