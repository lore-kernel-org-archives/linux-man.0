From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] recvmmsg.2: correct since fields and correct
 specification of the timeout parameter
Date: Sun, 23 Dec 2012 10:23:31 +0100
Message-ID: <CAKgNAkhz1E8c2jpECcYrKJyMv1RB36qC_HjW9s=i=+bYLfii4w@mail.gmail.com>
References: <1355956627-5676-1-git-send-email-eliedebrauwer@gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1355956627-5676-1-git-send-email-eliedebrauwer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Elie De Brauwer <eliedebrauwer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Elie

On Wed, Dec 19, 2012 at 11:37 PM, Elie De Brauwer
<eliedebrauwer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Hello all,
>
> After playing with and coming up with the example I bumped into some issues
> with the current page.
>
> The trivial ones:
>  * The page states it was added in 2.6.32 but it is only added in 2.6.33
>    (ref: http://kernelnewbies.org/Linux_2_6_33)
>  * The MSG_WAITFORONE flag was in turn only added in 2.6.34
>    (ref: http://kernelnewbies.org/Linux_2_6_34)
>
> The less trivial one, if you read the current manpage it seems like the
> timeout option is like a 'free' select/poll call. When reading the page
> my impression is you call recvmmsg with a timeout set, that it will not
> be able to block indefinitely. However this is not the case. You can
> already see this in my example in my previous patch, bash transmits a UDP
> packet every 250 msecs, but my demo app seems to recieve 5 packets while
> the timeout is only 1 second.
>
> If you look in the code ( http://lxr.linux.no/linux+v3.2/net/socket.c#L2201 )
> of __sys_recvmmsg() you can clearly see that in pseudocode it does something
> like:
> poll_select_set_timeout();
> while(datagrams < vlen) {
>    err = __sys_recvmsg();
>    if (err < 0 ) break
>    datagrams++;
>    if (timeout) {
>      // Update time
>      if (timeout->tv_sec < 0) {
>         break;
>      }
>    }
> }
>
> Hence three conditions result in recvmmsg() to return:
>  - error in recvmmsg()
>  - vlen datagrams received
>  - timeout expiration.
>
> But the timeout is only checked *after* __sys_recvmsg(), which may be
> blocking has returned, hence when working in blocking mode and the flow of
> incoming data stops all of a sudden, recvmmsg() will also block, even if
> a timeout is set. And this is not what I understood from the original
> page.
>
> A second case, in nonblocking mode, you can also specify a timeout,
> if a large amount of data is available, and the timeout is extremely sharp
> it might be that the timeout can also cause an exit from this function
> even if data is available in the socket.
>
> The patch belows tries to reword the existing paragraphs to make it reflect
> the information stated above.
>
> btw, this patch is isolated from the example patch because they deal with
> two separate things actually.

It was god that you split the patch this way, but it would be even
better to split it further. The version stuff should be it's a
separate patch. The timeout stuff is complex, and it looks to me like
a kernel bug. Could you resubmit as two patches please.

Thanks

Michael
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
