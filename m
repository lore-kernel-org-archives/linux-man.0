From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PING][patch] ld.so.8: outline missed cases of secure run
Date: Sat, 05 Dec 2015 08:33:15 +0100
Message-ID: <5662933B.9000207@gmail.com>
References: <"01f701d0e407$c718f530$554adf90$@guseva"@samsung.com> <55F65D25.1080708@gmail.com> <"00f601d1282e$e3e04ef0$aba0ecd0$@guseva"@samsung.com> <CAKvUva-pDmq7Cuvh0=Ne+Z+tbTdxO=s5YX6KVa1dUeB=uw5YPA@mail.gmail.com> <565C7E09.4030209@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <565C7E09.4030209-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maria Guseva <m.guseva-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Silvan Jegen <s.jegen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Yury Gribov <y.gribov-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, v.garbuzov-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello Maria,

> @@ -313,7 +335,12 @@ prints a help message about which categories can be 
> specified in this
>   environment variable.
>   Since glibc 2.3.4,
>   .B LD_DEBUG
> -is ignored for set-user-ID/set-group-ID binaries.
> +is ignored in secure-execution mode.
> +However, if the file
> +.IR /etc/suid\-debug
> +exists (the content of the file is irrelevant), then
> +.BR LD_DEBUG
> +has an effect in secure-execution mode.

Thanks also for this piece. I added it, but trimmed a little.

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
