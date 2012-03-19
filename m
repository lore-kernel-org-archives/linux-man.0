From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: man-pages-3.37 released
Date: Tue, 20 Mar 2012 07:31:54 +1300
Message-ID: <CAKgNAkip9J3w+eu99uy-puK_qK3S1EfRUKVcXOPTa3WF_8-piQ@mail.gmail.com>
References: <CAKgNAkjJSkf68TG2A5Ls9H8XoaaOuh44H4M7xJCWH_yRUgBpEQ@mail.gmail.com>
 <CAMqf4EHcasSC=UXmUxsu9F1_jzPcgx8K0XFYU2tXn=FBMmfVng@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAMqf4EHcasSC=UXmUxsu9F1_jzPcgx8K0XFYU2tXn=FBMmfVng-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "D. Barbier" <bouzim-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Sat, Mar 10, 2012 at 8:03 AM, D. Barbier <bouzim-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Le 9 mars 2012 18:28, Michael Kerrisk (man-pages) a =E9crit :
>> Gidday,
>>
>> The Linux man-pages maintainer proudly announces:
>>
>> =A0 man-pages-3.37.tar.gz - man pages for Linux
> [...]
>
> Hello Michael,
>
> There is an nroff syntax error in man2/ptrace.2:
>
> diff --git a/man2/ptrace.2 b/man2/ptrace.2
> index 37c4dff..775a26d 100644
> --- a/man2/ptrace.2
> +++ b/man2/ptrace.2
> @@ -726,7 +726,7 @@ group-stop, PTRACE_EVENT stops, syscall-stops
> =A0.BR PTRACE_SINGLESTEP ,
> =A0.BR PTRACE_SYSEMU ,
> =A0and
> -.BE PTRACE_SYSEMU_SINGLESTEP .
> +.BR PTRACE_SYSEMU_SINGLESTEP .
> =A0They all are reported by
> =A0.BR waitpid (2)
> =A0with

Thanks Denis. This piece was fixed in a separate patch by Denys Vlasenk=
o.

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
