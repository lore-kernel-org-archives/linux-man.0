From: Andy Lutomirski <luto-kltTT9wpgjJwATOyAt5JVQ@public.gmane.org>
Subject: Re: [PATCH] open: Document O_TMPFILE
Date: Mon, 20 Jan 2014 16:14:36 -0800
Message-ID: <CALCETrUXKCZi0rPW7jLdH9fZ-cv3L1AaejGB=FmA3TFK3Y+NGA@mail.gmail.com>
References: <3bec865ec3205e23c997ddc2c9bbacf0e53b0d18.1375896634.git.luto@amacapital.net>
 <52DD1BF5.6080502@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <52DD1BF5.6080502-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Mon, Jan 20, 2014 at 4:52 AM, Michael Kerrisk (man-pages)
<mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On 08/07/2013 07:31 PM, Andy Lutomirski wrote:
>> O_TMPFILE is new in Linux 3.11
>
> Thanks, Andy. I've applied your patch. I also added the following
> errors under ERRORS. Do they look okay to you?
>
>        EINVAL O_TMPFILE  was  specified in flags, but neither O_WRONLY
>               nor O_RDWR was specified.
>
>        EISDIR O_TMPFILE  and  one of O_WRONLY or O_RDWR were specified
>               in flags, but this kernel version does not  provide  the
>               O_TMPFILE functionality.

I suspect that EISDIR only happens if the directory exists and is
accessible (matching the flags).  Otherwise EACCES and ENOENT sound
plausible.

Sigh.  Why wasn't this implemented as a brand new syscall?

--Andy
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
