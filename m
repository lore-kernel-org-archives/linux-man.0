From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: elf(5): what is the scope?
Date: Thu, 17 Nov 2016 07:58:20 +0100
Message-ID: <CAKgNAkjtZcSXoBbYE7UL-F9j=zLxN+S6=4YW1d7Mb=8Hsm=9gw@mail.gmail.com>
References: <20161116223905.GQ21655@vapier.lan>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161116223905.GQ21655-UgUKS2FnFs9+urZeOPWqwQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 16 November 2016 at 23:39, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org> wrote:
> what is fair game for the elf(5) man page ?
>
> things that i think are missing:
>  - Elf##_Lib entries as found in at least SHT_GNU_LIBLIST (prelink)
>  - the format of SHT_HASH and SHT_GNU_HASH
>  - Elf##_Nhdr notes found in SHT_NOTE
>  - Elf##_Chdr for compressed sections
>  - Elf##_Syminfo
>  - Elf##_Ver{def,need} found in SHT_GNU_ver{def,need}
> -mike

It all sounds fair game to me. Is this an offer to tackle some
of this?

Cheers,

Michael

-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
