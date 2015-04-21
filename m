From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 2/2] syscall.2: add x32 ABI
Date: Tue, 21 Apr 2015 16:01:11 +0200
Message-ID: <CAKgNAkihLXniE+bgqi_xjVAqKcUr1Gkiq9hKGK7t_a3EPT_fJg@mail.gmail.com>
References: <20150316180154.GA10663@pc.thejh.net> <CAGXu5j+mjC4HQWbJVSDb+gSTud=R1+UCBJBY8ysQuj9NETrSEQ@mail.gmail.com>
 <20150316233457.GA9227@pc.thejh.net> <20150324184043.GC5677@pc.thejh.net>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150324184043.GC5677-J1fxOzX/cBvk1uMJSBkQmQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jann Horn <jann-XZ1E9jl8jIdeoWH0uzbU5w@public.gmane.org>
Cc: Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andy Lutomirski <luto-kltTT9wpgjJwATOyAt5JVQ@public.gmane.org>, Will Drewry <wad-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, "H. Peter Anvin" <hpa-YMNOUZJC4hwAvxtiuMwx3w@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Jann,

On 24 March 2015 at 19:40, Jann Horn <jann-XZ1E9jl8jIdeoWH0uzbU5w@public.gmane.org> wrote:
> [added H. Peter Anvin to CC for this patch because he
> seems to have contributed large parts of the X32 code]

It looks like I did not reply to this mail. But as you'll probably have seen
from the man-pages-3.83 release announcement, I did apply this patch.
Thanks!

Cheers,

Michael


>
> ---
>  man2/syscall.2 | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/man2/syscall.2 b/man2/syscall.2
> index ef8f3cf..1f25255 100644
> --- a/man2/syscall.2
> +++ b/man2/syscall.2
> @@ -170,12 +170,18 @@ s390      svc 0   r1      r2      See below
>  s390x  svc 0   r1      r2      See below
>  sparc/32       t 0x10  g1      o0
>  sparc/64       t 0x6d  g1      o0
> -x86_64 syscall rax     rax
> +x86_64 syscall rax     rax     See below
> +x32    syscall rax     rax     See below
>  .TE
>  .PP
>  For s390 and s390x, NR (the system call number)
>  may be passed directly with "svc NR" if it is less than 256.
>
> +The x32 ABI uses the same instruction as the x86_64 ABI and is used on
> +the same processors. To differentiate between them, the bitmask
> +.I __X32_SYSCALL_BIT
> +is bitwise-ORed into the syscall number for syscalls under the x32 ABI.
> +
>  On a few architectures,
>  a register is used to indicate simple boolean failure of the system call:
>  ia64 uses
> @@ -210,6 +216,7 @@ s390x       r2    r3    r4    r5    r6    r7    -
>  sparc/32    o0    o1    o2    o3    o4    o5    -
>  sparc/64    o0    o1    o2    o3    o4    o5    -
>  x86_64      rdi   rsi   rdx   r10   r8    r9    -
> +x32         rdi   rsi   rdx   r10   r8    r9    -
>  .TE
>  .PP
>  The mips/o32 system call convention passes
> --
> 2.1.4



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
