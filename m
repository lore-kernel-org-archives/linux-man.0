From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ptrace.2: wfix
Date: Tue, 5 Mar 2013 17:39:57 +0100
Message-ID: <CAKgNAkicPqZdj0UR1UuXo1+X-Ddw3yzZZmorF+W3SYQA4G1H9A@mail.gmail.com>
References: <1362191753-6287-1-git-send-email-taffit@debian.org> <1362192041-7538-1-git-send-email-taffit@debian.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1362192041-7538-1-git-send-email-taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?David_Pr=E9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Denys Vlasenko <vda.linux-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
List-Id: linux-man@vger.kernel.org

[CC+=3DDenys]

On Sat, Mar 2, 2013 at 3:40 AM, David Pr=E9vot <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org> wrot=
e:
> ---
>  man2/ptrace.2 |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/man2/ptrace.2 b/man2/ptrace.2
> index 9d1133c..a685049 100644
> --- a/man2/ptrace.2
> +++ b/man2/ptrace.2
> @@ -214,7 +214,7 @@ some modifications to the USER area are disallowe=
d.
>  .TP
>  .BR PTRACE_GETREGS ", " PTRACE_GETFPREGS
>  Read the tracee's general-purpose or floating-point registers,
> -respectively, to the address
> +respectively, at the address
>  .I data
>  in the tracer.
>  See

David, I think you are right that there is a wording problem in this
sentence -- "Read ... to" is not the right preposition .  But I think
the fix is to change "Read" to "Copy". Thus:

=2ETP
=2EBR PTRACE_GETREGS ", " PTRACE_GETFPREGS
- Read the tracee's general-purpose or floating-point registers,
+ Copy the tracee's general-purpose or floating-point registers,
respectively, to the address
=2EI data
in the tracer.

Denys can confirm, since he wrote the original text.

Cheers,

Michael



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
