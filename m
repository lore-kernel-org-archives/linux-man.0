From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] Changes.old: fix encoding issues
Date: Mon, 17 Feb 2014 16:44:19 +0100
Message-ID: <CAKgNAkjNSGA-p0ytpWNkBK84wf8pS3U0oMeFh9aZJjKiK8sDEw@mail.gmail.com>
References: <1392558491-19116-1-git-send-email-spaillard@debian.org>
 <53020B87.5050408@gmail.com> <20140217153345.GU15288@mraw.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140217153345.GU15288-xazfMhTT2R0@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Peter Schiffer <pschiffe-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Mon, Feb 17, 2014 at 4:33 PM, Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org> wrote:
> On Mon, Feb 17, 2014 at 02:15:51PM +0100, Michael Kerrisk (man-pages) wrote:
>> On 02/16/2014 02:48 PM, Simon Paillard wrote:
>> > Introduced in 33972b0b231b9b0ee708f27fe42461dbca6e2968
>>
>> Bother! I still didn't get it right.
>>
>> Thanks for the patch! Applied.
>
> BTW, I check the rendering of the iso 8859 -11 and -13 manpages before/after
> the change and I think there is something to be fixed too.

Oh -- that was automated with some scripts by Peter Schiffer, and the
results looked okay to me, but maybe I did not look closely enough.
What problems do you see?

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
