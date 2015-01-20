From: Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH] syscall.2: add arm64 and mips
Date: Tue, 20 Jan 2015 11:02:49 -0800
Message-ID: <CAGXu5jJPYt0z4=UvKoimfju6A0wqxoMnMEXAo6vUEYUX36aHXQ@mail.gmail.com>
References: <20150118072204.GA12237@www.outflux.net>
	<54BB9FF3.5070706@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54BB9FF3.5070706-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Sun, Jan 18, 2015 at 3:58 AM, Michael Kerrisk (man-pages)
<mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On 01/18/2015 08:22 AM, Kees Cook wrote:
>> Added mips to tables. Extra column added for boolean error register, since
>> both ia64 and mips use this convention. Added explicit non-register argument
>> passing note for mips/o32.
>>
>> Added arm64 to tables.
>
> Thanks Kees. I applied, but then tweaked. Because I do not want the tables
> to render wider than 80 columns, I took the 'bool error' piece into a
> paragraph below the table. See my commit eb83484fc.
> Could you double check the result in the Git please.

Ah, perfect, yes, that looks great. Thanks!

-Kees

-- 
Kees Cook
Chrome OS Security
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
