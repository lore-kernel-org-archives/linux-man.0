From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2] elf(5): document notes
Date: Mon, 28 Nov 2016 22:20:16 +0100
Message-ID: <c6f11b7e-6066-c4d0-985a-8cadb5f0f3cd@gmail.com>
References: <20161117205939.2295-1-vapier@gentoo.org>
 <20161127033137.31756-1-vapier@gentoo.org>
 <2645467f-09b8-d2c1-b89f-7b5e52d0b233@gmail.com>
 <20161127181502.GD20966@vapier.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161127181502.GD20966-UgUKS2FnFs9+urZeOPWqwQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 11/27/2016 07:15 PM, Mike Frysinger wrote:
> here's some updates.  i thought i'd done the core parts already, but i
> guess i forgot in the interim.
> -mike

Thanks, Mike. Applied!

Cheers,

Michael


> --- a/man5/elf.5
> +++ b/man5/elf.5
> @@ -1846,11 +1846,11 @@ This is automatically populated by the linker.
>  ELF notes allow for appending arbitrary information for the system to use.
>  They are largely used by core files
>  .RI ( e_type
> -o f
> +of
>  .BR ET_CORE ),
>  but many projects define their own set of extensions.
>  For example,
> -the GNU tool chain uses ELF notes to information from
> +the GNU tool chain uses ELF notes to pass information from
>  the linker to the C library.
>  
>  Note sections contain a series of notes (see the
> @@ -1893,7 +1893,12 @@ Keep in mind that the interpretation of
>  depends on the namespace defined by the
>  .I n_namesz
>  field.
> -After, of course, having determined whether the ELF image is a core file.
> +If the
> +.I n_namesz
> +field is not set (e.g., is 0), then there are two sets of notes:
> +one for core files and one for all other ELF types.
> +If the namespace is unknown, then tools will usually fallback to these sets
> +of notes as well.
>  .in +4n
>  .nf
>  
> @@ -1936,6 +1941,9 @@ following values:
>  Notes used by all core files.
>  These are highly operating system or architecture specific and often require
>  close coordination with kernels, C libraries, and debuggers.
> +These are used when the namespace is the default (i.e.,
> +.B n_namesz
> +will be set to 0), or a fallback when the namespace is unknown.
>  .RS
>  .TP 21
>  .PD 0
> @@ -2109,11 +2117,10 @@ The desc consists of any nonzero number of bytes.
>  The desc contains the GNU Gold linker version used.
>  .RE
>  .TP
> -.B Unknown system
> -The fallback set of note types when the namespace is unknown.
> -Usually the name field will be omitted (i.e.,
> +.B Default/unknown namespace (e_type != ET_CORE)
> +These are used when the namespace is the default (i.e.,
>  .B n_namesz
> -will be set to 0).
> +will be set to 0), or a fallback when the namespace is unknown.
>  .RS
>  .TP 21
>  .PD 0
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
