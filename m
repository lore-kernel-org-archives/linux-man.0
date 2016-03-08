From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: proc(5) fdinfo should mention O_CLOEXEC may be set in file flags
Date: Tue, 8 Mar 2016 20:33:35 +0100
Message-ID: <56DF290F.4070104@gmail.com>
References: <CACh33FqAXhMsJoFszxNkLG+MWoP6eXKjfaDb1XoDGGcXhdgZFA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACh33FqAXhMsJoFszxNkLG+MWoP6eXKjfaDb1XoDGGcXhdgZFA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Patrick Donnelly <batrick-dP08NitdTj1Wk0Htik3J/w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Patrick

On 03/07/2016 08:51 PM, Patrick Donnelly wrote:
> The man page says this
> 
> "The flags field is an octal number that displays the file access mode
> and file  status  flags  (see  open(2))."
> 
> flags may also include the file descriptor flags (F_GETFD). (Although
> there is only the O_CLOEXEC flag and that is explicitly included [1])
> 
> [1] https://github.com/torvalds/linux/blob/master/fs/proc/fd.c#L41-L43

Thanks. I added this detail.

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
