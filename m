From: Alexander Miller <alex.miller-Mmb7MZpHnFY@public.gmane.org>
Subject: Re: [PATCH] getdtablesize.2, attr.5: Move .so directive to first
 line
Date: Fri, 24 Mar 2017 18:45:32 +0100
Message-ID: <20170324184532.7c817c6a.alex.miller@gmx.de>
References: <20170321010835.384cad5c.alex.miller@gmx.de>
        <85d402cd-765d-74e0-6a00-a940d3d679b2@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <85d402cd-765d-74e0-6a00-a940d3d679b2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Fri, 24 Mar 2017 15:40:19 +0100 Michael Kerrisk wrote:

> I've applied this. However, could you say more about the
> problem it fixes? (I did not encounter or get any reports of
> problems before, and at least for me, man(1) seems to have
> no problem with the files as they were.)

Hello Michael,

this is a problem with the older man implementation (man 1.6g)
and compressed man pages (man-db is not affected). 
There is no zsoelim(1) in this implementation. Instead, man(1)
has special code to handle redirections which recognizes .so only
in the very first line. With uncompressed man pages it doesn't
matter because groff finds the target page, but when that file
is compresses groff can't find it and the result is an empty
page.

I know that the older man is mostly irrelevant today (and I have
only one installation left for testing), but the fix is trivial,
so I decided to submit it. There may also be other tools with
similar restrictions, although I don't have any examples.

Cheers,
Alex
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
