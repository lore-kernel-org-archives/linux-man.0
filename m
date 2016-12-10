From: Keno Fischer <keno-9DCaDmOhoh+8M3too/+dENBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] fuse.4: Add new file describing /dev/fuse
Date: Sat, 10 Dec 2016 16:19:52 -0500
Message-ID: <CABV8kRxjrXaHUakGL63_TV6C5rQNRbUf4dQO5+oVj2zrB_5kfA@mail.gmail.com>
References: <20161210072018.GA5267@juliacomputing.com> <87vaurbi7q.fsf@vostro.rath.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <87vaurbi7q.fsf-sKB8Sp2ER+yL2G7IJ6k9tw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nikolaus Rath <Nikolaus-BTH8mxji4b0@public.gmane.org>
Cc: Michael Kerrisk-manpages <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Miklos Szeredi <miklos-sUDqSbJrdHQHWmgEVkV9KA@public.gmane.org>, linux-fsdevel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Sat, Dec 10, 2016 at 4:13 PM, Nikolaus Rath <Nikolaus-BTH8mxji4b0@public.gmane.org> wrote:
>
> Would it make sense to remove everything kernel related from
> mount.fuse(8) and move it into linux-manpages?

I think that's a great idea. While playing with the raw interface, I
was sometimes confused that the kernel rejected my mount options
(because I accidentally used a userspace one).
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
