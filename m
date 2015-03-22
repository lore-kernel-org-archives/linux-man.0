From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/2] syscall.2: srcfix
Date: Sun, 22 Mar 2015 19:53:23 +0100
Message-ID: <550F0FA3.1000108@gmail.com>
References: <1426385789-12406-1-git-send-email-saulery@free.fr> <1426385789-12406-2-git-send-email-saulery@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1426385789-12406-2-git-send-email-saulery-GANU6spQydw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?B?U3TDqXBoYW5lIEF1bGVyeQ==?= <saulery-GANU6spQydw@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 03/15/2015 03:16 AM, St=C3=A9phane Aulery wrote:
> Fix a warning of groff: line 192: warning [p 2, 4.7i]: cannot adjust =
line

Thanks, St=C3=A9phane. Applied.

Cheers,

Michael

> Signed-off-by: St=C3=A9phane Aulery <saulery-GANU6spQydw@public.gmane.org>
> ---
>  man2/syscall.2 | 32 ++++++++++++++++----------------
>  1 file changed, 16 insertions(+), 16 deletions(-)
>=20
> diff --git a/man2/syscall.2 b/man2/syscall.2
> index ad2e05e..ef8f3cf 100644
> --- a/man2/syscall.2
> +++ b/man2/syscall.2
> @@ -193,23 +193,23 @@ The second table shows the registers used to pa=
ss the system call arguments.
>  .ft CW
>  \}
>  .TS
> -l l2 l2 l2 l2 l2 l2 l2 l.
> -arch/ABI	arg1	arg2	arg3	arg4	arg5	arg6	arg7	Notes
> +l           l2    l2    l2    l2    l2    l2    l2    l.
> +arch/ABI    arg1  arg2  arg3  arg4  arg5  arg6  arg7  Notes
>  _
> -arm/OABI	a1	a2	a3	a4	v1	v2	v3
> -arm/EABI	r0	r1	r2	r3	r4	r5	r6
> -arm64	x0	x1	x2	x3	x4	x5	-
> -blackfin	R0	R1	R2	R3	R4	R5	-
> -i386	ebx	ecx	edx	esi	edi	ebp	-
> -ia64	out0	out1	out2	out3	out4	out5	-
> -mips/o32	a0	a1	a2	a3	-	-	-	See below
> -mips/n32,64	a0	a1	a2	a3	a4	a5	-
> -parisc	r26	r25	r24	r23	r22	r21	-
> -s390	r2	r3	r4	r5	r6	r7	-
> -s390x	r2	r3	r4	r5	r6	r7	-
> -sparc/32	o0	o1	o2	o3	o4	o5	-
> -sparc/64	o0	o1	o2	o3	o4	o5	-
> -x86_64	rdi	rsi	rdx	r10	r8	r9	-
> +arm/OABI    a1    a2    a3    a4    v1    v2    v3
> +arm/EABI    r0    r1    r2    r3    r4    r5    r6
> +arm64       x0    x1    x2    x3    x4    x5    -
> +blackfin    R0    R1    R2    R3    R4    R5    -
> +i386        ebx   ecx   edx   esi   edi   ebp   -
> +ia64        out0  out1  out2  out3  out4  out5  -
> +mips/o32    a0    a1    a2    a3    -     -     -     See below
> +mips/n32,64 a0    a1    a2    a3    a4    a5    -
> +parisc      r26   r25   r24   r23   r22   r21   -
> +s390        r2    r3    r4    r5    r6    r7    -
> +s390x       r2    r3    r4    r5    r6    r7    -
> +sparc/32    o0    o1    o2    o3    o4    o5    -
> +sparc/64    o0    o1    o2    o3    o4    o5    -
> +x86_64      rdi   rsi   rdx   r10   r8    r9    -
>  .TE
>  .PP
>  The mips/o32 system call convention passes
>=20


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
