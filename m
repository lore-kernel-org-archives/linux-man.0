From: "Michael Kerrisk" <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: signal(7) and restartable syscalls
Date: Thu, 16 Oct 2008 20:38:05 +0200
Message-ID: <cfd18e0f0810161138l4f5f7167g714c1deac56a2f65@mail.gmail.com>
References: <eba800c90810130810y237bed5dkdc108bce094529ab@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <eba800c90810130810y237bed5dkdc108bce094529ab-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: didier <did447-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Didier,

On Mon, Oct 13, 2008 at 5:10 PM, didier <did447-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Hi
>
> In current man page (version 3.11) there's no mention that  with
> timeout set on sockets (SO_RCVTIMEO, SO_SNDTIMEO)
> read, write,send,... aren't restartable.
>
> from include/net/sock.h
> /* Alas, with timeout socket operations are not restartable.
>  * Compare this to poll().
>  */

Yes, you are of course correct.  I'd verified this a while back, but
just had not got around to writing it up.  An analogous behavior
occurs with respect to stop signals (see lower in the signal(7) page),
if timeouts have been set.

Basically, a SO_SNDTIMEO timeout will affect connect() and send*(),
and a SO_RCVTIMEO timeout will affect accept() and recv*().  For
man-pages-3.12, I've updated the page to note these points.

Thanks for your report!

Cheers,

Michael
-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
git://git.kernel.org/pub/scm/docs/man-pages/man-pages.git
man-pages online: http://www.kernel.org/doc/man-pages/online_pages.html
Found a bug? http://www.kernel.org/doc/man-pages/reporting_bugs.html
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
