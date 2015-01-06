From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: semop.2: Add section number for external reference
Date: Tue, 06 Jan 2015 08:05:49 +0100
Message-ID: <54AB894D.6060309@gmail.com>
References: <CALhU9t=YPqso=VhvQpoGRn8_ZG9GvVfs4++X+7tLaztHerRP9A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CALhU9t=YPqso=VhvQpoGRn8_ZG9GvVfs4++X+7tLaztHerRP9A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Akihiro Motoki <amotoki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Akihiro Motoki,

Patch applied. Thank you!

Cheers,

Michael

On 01/04/2015 10:29 PM, Akihiro Motoki wrote:
> diff --git a/man2/semop.2 b/man2/semop.2
> index 54078db..357132c 100644
> --- a/man2/semop.2
> +++ b/man2/semop.2
> @@ -439,7 +439,7 @@ the corresponding
>  .I semadj
>  values in all processes are cleared.
>  The
> -.BR clone ()
> +.BR clone (2)
>  .B CLONE_SYSVSEM
>  flag allows more than one process to share a
>  .I semadj
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
