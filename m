From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] ld.so.8: typo in LD_USE_LOAD_BIAS description
Date: Sat, 10 Jan 2015 22:17:58 +0100
Message-ID: <54B19706.609@gmail.com>
References: <CAKDZRcgE+6orQFDQm1mVakk4J6yesT5boEZ_-Mr9pT4ir++kyQ@mail.gmail.com> <CAKDZRciw2UshU9WEas+wcveAXa5Je_p_U0PtjbjVJzyPzHJXaA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKDZRciw2UshU9WEas+wcveAXa5Je_p_U0PtjbjVJzyPzHJXaA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jessica McKellar <jessica.mckellar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 05/19/2012 12:23 AM, Jessica McKellar wrote:
> Hi,
> 
> There is a small typo in the ld.so man page on master (which I found
> on http://www.kernel.org/doc/man-pages/online/pages/man8/ld.so.8.html).
> 
> The diff is attached as well as copied below.
> 
> (Michael, sorry for the resend; the original e-mail was bounced as
> spam for containing HTML. If that's by design, it might help to say
> you must send as plaintext only on
> http://www.kernel.org/doc/man-pages/patches.html)
> 
> Best regards,
> -Jessica
> 
> --
> Jessica McKellar
> http://jesstess.com
> 
> 
> diff --git a/man8/ld.so.8 b/man8/ld.so.8
> index 70b6faf..8e059de 100644
> --- a/man8/ld.so.8
> +++ b/man8/ld.so.8
> @@ -350,7 +350,7 @@ and (nonprelinked) position-independent executables (PIEs)
>  and other shared objects will not honor them.
>  If
>  .B LD_USE_LOAD_BIAS
> -is defined wit the value, both executables and PIEs
> +is defined with the value 1, both executables and PIEs
>  will honor the base addresses.
>  If
>  .B LD_USE_LOAD_BIAS

Thanks, Jessica. Applied.

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
