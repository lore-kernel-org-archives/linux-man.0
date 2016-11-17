From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] elf(5): add subsection headers at major points
Date: Thu, 17 Nov 2016 16:44:59 +0100
Message-ID: <CAKgNAkhAOWwgMB9sZ=nPaxjk8=8kQzo1S2iHEkMAZwwAYuyOVw@mail.gmail.com>
References: <20161117143427.26643-1-vapier@gentoo.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161117143427.26643-1-vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Mike,

On 17 November 2016 at 15:34, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org> wrote:
> The current pages dumps all the content into one big DESCRIPTION with
> no real visual break up between logically independent sections.  Add
> some subsection headers to make it easier to read and scan.

Thanks. That's a good change. I applied your patch, and tweaked a
little. The result is already pushed to Git.

Cheers,

Michael

> Signed-off-by: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
> ---
>  man5/elf.5 | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/man5/elf.5 b/man5/elf.5
> index a7bea6a97290..b152ea3c55ac 100644
> --- a/man5/elf.5
> +++ b/man5/elf.5
> @@ -83,7 +83,7 @@ the file.
>  This header file describes the above mentioned headers as C structures
>  and also includes structures for dynamic sections, relocation sections and
>  symbol tables.
> -.PP
> +.SS Basic Types
>  The following types are used for N-bit architectures (N=32,64,
>  .I ElfN
>  stands for
> @@ -131,7 +131,7 @@ size and alignment guidelines for the relevant class.
>  If necessary,
>  data structures contain explicit padding to ensure 4-byte alignment
>  for 4-byte objects, to force structure sizes to a multiple of 4, and so on.
> -.PP
> +.SS ELF Header (Ehdr)
>  The ELF header is described by the type
>  .I Elf32_Ehdr
>  or
> @@ -608,7 +608,7 @@ member of the initial entry in section header table.
>  Otherwise, the
>  .IR sh_link
>  member of the initial entry in section header table contains the value zero.
> -.PP
> +.SS Program Header (Phdr)
>  An executable or shared object file's program header table is an array of
>  structures, each describing a segment or other information the system needs
>  to prepare the program for execution.
> @@ -800,7 +800,7 @@ should equal
>  .IR p_offset ,
>  modulo
>  .IR p_align .
> -.PP
> +.SS Section Header (Shdr)
>  A file's section header table lets one locate all the file's sections.
>  The
>  section header table is an array of
> @@ -1398,7 +1398,7 @@ The attributes used are
>  .BR SHF_ALLOC
>  and
>  .BR SHF_EXECINSTR .
> -.PP
> +.SS String and Symbol Tables
>  String table sections hold null-terminated character sequences, commonly
>  called strings.
>  The object file uses these strings to represent symbol
> @@ -1575,7 +1575,7 @@ Every symbol table entry is
>  in relation to some section.
>  This member holds the relevant section
>  header table index.
> -.PP
> +.SS Relocation Entries (Rel & Rela)
>  Relocation is the process of connecting symbolic references with
>  symbolic definitions.
>  Relocatable files must have information that
> @@ -1652,7 +1652,7 @@ member.
>  .IR r_addend
>  This member specifies a constant addend used to compute the value to be
>  stored into the relocatable field.
> -.PP
> +.SS Dynamic Tags (Dyn)
>  The
>  .I .dynamic
>  section contains a series of structures that hold relevant
> --
> 2.10.2
>



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
