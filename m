From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: dlopen man page example fails for x86_64 (release 4.12), OK for
 32-bit target
Date: Wed, 23 Aug 2017 01:11:47 +0200
Message-ID: <CAKgNAkid9StEr3LGhZ6xWMxMKKu+8E_a8n37vLPOUsFq=hv2yw@mail.gmail.com>
References: <c6443ac5-b115-e53f-1a5e-cd3568263f32@suddenlinkmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <c6443ac5-b115-e53f-1a5e-cd3568263f32-hPWwJ4didUaz5mO2DORSKdBPR1lH4CV8@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "David C. Rankin" <drankinatty-hPWwJ4didUaz5mO2DORSKdBPR1lH4CV8@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

David,

On 22 August 2017 at 04:53, David C. Rankin
<drankinatty-hPWwJ4didUaz5mO2DORSKdBPR1lH4CV8@public.gmane.org> wrote:
> All,
>
>   The man 3 dlopen example needs updating to run on x86_64. It will run fine
> as a 32-bit compile (with -m32), but fails without it, e.g.
>
> $ gcc -Wall -Wextra -pedantic -Wshadow -std=gnu11 -Ofast -ldl -o
> bin/dlopen_man_ex dlopen_man_ex.c
>
> $ ./bin/dlopen_man_ex
> /usr/lib/libm.so: invalid ELF header
>
>   While limiting the target to 32-bit works as advertised:
>
> $ gcc -Wall -Wextra -pedantic -Wshadow -m32 -std=gnu11 -Ofast -ldl -o
> bin/dlopen_man_ex dlopen_man_ex.c
>
> $ ./bin/dlopen_man_ex
> -0.416147
>
>   This behavior is confirmed both on openSuSE and Archlinux with
>
> gcc (GCC) 7.1.1 20170630 (on Archlinux with multilib support)
>
>   I'm not exactly sure where in the compile and library search the problem
> with the example is, but explicitly specifying /usr/lib64/libm.so doesn't
> change the error on x86_64. Whether this is a libdl problem? It may be
> something simple I'm just being dense about, but I thought I would pass this
> along for verification and correction, if required.

Can you show the source code of the example that you are using that
doesn't work. I wonder if you may be looking at an old version of the
manual page.

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
