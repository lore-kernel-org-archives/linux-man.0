From: walter harms <wharms-fPG8STNUNVg@public.gmane.org>
Subject: Re: [PATCH v2 man-pages] bpf.2: new page documenting bpf(2)
Date: Thu, 12 Mar 2015 11:09:03 +0100
Message-ID: <550165BF.1010208@bfs.de>
References: <1426048097-14726-1-git-send-email-ast@plumgrid.com>
Reply-To: wharms-fPG8STNUNVg@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1426048097-14726-1-git-send-email-ast-uqk4Ao+rVK5Wk0Htik3J/w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexei Starovoitov <ast-uqk4Ao+rVK5Wk0Htik3J/w@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org



Am 11.03.2015 05:28, schrieb Alexei Starovoitov:
> Signed-off-by: Alexei Starovoitov <ast-uqk4Ao+rVK5Wk0Htik3J/w@public.gmane.org>
> ---
>  man2/bpf.2 |  630 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 630 insertions(+)
>  create mode 100644 man2/bpf.2
> 
> diff --git a/man2/bpf.2 b/man2/bpf.2
> new file mode 100644
> index 0000000..a605489
> --- /dev/null
> +++ b/man2/bpf.2
> @@ -0,0 +1,630 @@
> +.\" Copyright (C) 2015 Alexei Starovoitov <ast-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> +.\"
> +.\" %%%LICENSE_START(VERBATIM)
> +.\" Permission is granted to make and distribute verbatim copies of this
> +.\" manual provided the copyright notice and this permission notice are
> +.\" preserved on all copies.
> +.\"
> +.\" Permission is granted to copy and distribute modified versions of this
> +.\" manual under the conditions for verbatim copying, provided that the
> +.\" entire resulting derived work is distributed under the terms of a
> +.\" permission notice identical to this one.
> +.\"
> +.\" Since the Linux kernel and libraries are constantly changing, this
> +.\" manual page may be incorrect or out-of-date.  The author(s) assume no
> +.\" responsibility for errors or omissions, or for damages resulting from
> +.\" the use of the information contained herein.  The author(s) may not
> +.\" have taken the same level of care in the production of this manual,
> +.\" which is licensed free of charge, as they might when working
> +.\" professionally.
> +.\"
> +.\" Formatted or processed versions of this manual, if unaccompanied by
> +.\" the source, must acknowledge the copyright and authors of this work.
> +.\" %%%LICENSE_END
> +.\"
> +.TH BPF 2 2015-03-10 "Linux" "Linux Programmer's Manual"
> +.SH NAME
> +bpf - perform a command on an extended BPF map or program
> +.SH SYNOPSIS
> +.nf
> +.B #include <linux/bpf.h>
> +.sp
> +.BI "int bpf(int cmd, union bpf_attr *attr, unsigned int size);
> +
> +.SH DESCRIPTION
> +.BR bpf()
> +syscall is a multiplexor for a range of different operations on extended BPF
syscall is a multiplexor for a range of different operations on extended
Berkeley Packet Filter (eBPF).

just introduce the abv. early as possible,

hope that helps,
re
 wh



--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
