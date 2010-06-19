From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2] elf.5: Add description for ELF extension
Date: Sat, 19 Jun 2010 15:53:00 +0200
Message-ID: <AANLkTinto_PzCcEWLs2l6VQ3axuetLtGSoXwZqaNy2NQ@mail.gmail.com>
References: <20100315.120246.193685481.d.hatayama@jp.fujitsu.com>
	<20100511015854.GF16800@machine.or.cz> <20100513.145504.71089765.d.hatayama@jp.fujitsu.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20100513.145504.71089765.d.hatayama-+CUm20s59erQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daisuke HATAYAMA <d.hatayama-+CUm20s59erQFUHtdCDX3A@public.gmane.org>
Cc: pasky-AlSwsSmVLrQ@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Daisuke, Petr

On Thu, May 13, 2010 at 7:55 AM, Daisuke HATAYAMA
<d.hatayama-+CUm20s59erQFUHtdCDX3A@public.gmane.org> wrote:
> Hi. Petr.
>
> Thank you for your comments.
>
> I reflected your comments to the previous patch.
> Could you check it?
>
> # =A0 What a strange interface, the other two hold the max value whil=
e
> # e_shnum holds zero in case of overflow.
>
> I considered one answer to the question based on the difference of
> compatibility policy for each object format.
>
> For core object format, it is better for ordinary tools to understand
> as many program headers as possible, even if it is incomplete. On the
> other hand, for relocatable object format, it is meaningless if it is
> incomplete. This is why e_phnum is set to PN_XNUM(0xffff) and e_shnum
> is set to 0, respectively: in the latter case, any ordinary linker
> cannot recognize the relocatable object correctly.
>
> But I don't know why e_shstrndx is set to 0xffff. We could choose it
> from the reserved range of section header table indices, i.e. 0 and
> [0xff00, ..., 0xffff].
>
> At any rate, to see accurately why it's so, we need to look at the
> discussion when the ELF extension was specified. I will post it here
> if I can find it.
>
> Thanks
> HATAYAMA, Daisuke
> ---
> linux-2.6.34-rc1 added an ELF core extension, which user-land tools,
> such as gdb and binutils, have already supported. Therefore, elf.5
> needs to be modified accordingly.
>
> You can follow information on the ELF extension via the LKML post:
> http://lkml.org/lkml/2010/1/3/103
>
> Signed-off-by: Daisuke HATAYAMA <d.hatayama-+CUm20s59erQFUHtdCDX3A@public.gmane.org>

Daisuke, thanks for your patch.

Petr, thanks for the review comments.

I made some small language and formatting fixes, but otherwise applied
the patch as you gave it. Thanks for supplying this.

Cheers,

Michael

> ---
> =A0man5/elf.5 | =A0 62 ++++++++++++++++++++++++++++++++++++++++++++++=
++++++++++++-
> =A01 files changed, 60 insertions(+), 2 deletions(-)
>
> diff --git a/man5/elf.5 b/man5/elf.5
> index 20ed3d8..e5270e7 100644
> --- a/man5/elf.5
> +++ b/man5/elf.5
> @@ -30,7 +30,7 @@
> =A0.\" 2007-10-11, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>, various fixes
> =A0.\" 2007-12-08, mtk, Converted from mdoc to man macros
> =A0.\"
> -.TH ELF 5 2007-12-28 "Linux" "Linux Programmer's Manual"
> +.TH ELF 5 2010-05-13 "Linux" "Linux Programmer's Manual"
> =A0.SH NAME
> =A0elf \- format of Executable and Linking Format (ELF) files
> =A0.SH SYNOPSIS
> @@ -543,6 +543,28 @@ in bytes.
> =A0If a file has no program header,
> =A0.IR e_phnum
> =A0holds the value zero.
> +.IP
> +If the number of entries in the program header table is larger than =
or equal to
> +.BR PN_XNUM
> +(0xffff), this member holds
> +.BR PN_XNUM
> +(0xffff) and the real number of entries in the program header table =
is held in
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
> =A0.TP
> =A0.IR e_shentsize
> =A0This member holds a sections header's size in bytes.
> @@ -561,6 +583,17 @@ If a file has no section
> =A0header table,
> =A0.IR e_shnum
> =A0holds the value of zero.
> +.IP
> +If the number of entries in the section header table is larger than =
or equal to
> +.BR SHN_LORESERVE
> +(0xff00),
> +.IR e_shnum
> +holds the value zero and the real number of entries in the section h=
eader
> +table is held in
> +.IR sh_size
> +of the initial entry in section header table. Otherwise, the
> +.IR sh_size
> +of the initial entry in section header table holds the value zero.
> =A0.TP
> =A0.IR e_shstrndx
> =A0This member holds the section header table index of the entry asso=
ciated
> @@ -568,6 +601,17 @@ with the section name string table.
> =A0If the file has no section name string
> =A0table, this member holds the value
> =A0.BR SHN_UNDEF .
> +.IP
> +If the index of section name string table section is larger than or =
equal to
> +.BR SHN_LORESERVE
> +(0xff00), this member holds
> +.BR SHN_XINDEX
> +(0xffff) and the real index of the section name string table section
> +is held in the
> +.IR sh_link
> +member of the initial entry in section header table. Otherwise, the
> +.IR sh_link
> +member of the initial entry in section header table contains the val=
ue zero.
> =A0.RS 12
> =A0.\" .Bl -tag -width "SHN_LORESERVE"
> =A0.TP 14
> @@ -841,7 +885,10 @@ holds the size in bytes of each entry.
> =A0.PP
> =A0A section header table index is a subscript into this array.
> =A0Some section
> -header table indices are reserved.
> +header table indices are reserved:
> +the initial entry and the indices between SHN_LORESERVE and SHN_HIRE=
SERVE.
> +The initial entry is used in ELF extensions for e_phnum, e_shnum and=
 e_strndx;
> +in other cases, each field in the initial entry is set to zero.
> =A0An object file does not have sections for
> =A0these special indices:
> =A0.\" .Bl -tag -width "SHN_LORESERVE"
> @@ -1851,6 +1898,10 @@ This is automatically populated by the linker.
> =A0ELF first appeared in
> =A0System V.
> =A0The ELF format is an adopted standard.
> +.PP
> +The extensions for e_phnum, e_shnum and e_strndx respectively are
> +Linux extensions. Sun, BSD and AMD64 also support them, whose
> +specifications are listed in SEE ALSO.
> =A0.\" .SH AUTHORS
> =A0.\" The original version of this manual page was written by
> =A0.\" .An Jeroen Ruigrok van der Werven
> @@ -1876,3 +1927,10 @@ Santa Cruz Operation,
> =A0Unix System Laboratories,
> =A0"Object Files",
> =A0.IR "Executable and Linking Format (ELF)" .
> +.PP
> +Sun microsystems,
> +.IR "Linker and Libraries Guide" .
> +.PP
> +AMD64 ABI Draft,
> +.IR "System V Application Binary Interface AMD64 Architecture Proces=
sor Supplement" .
> +.PP
> --
> 1.6.5.1
> --
> To unsubscribe from this list: send the line "unsubscribe linux-man" =
in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface" http://blog.man7.org/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
