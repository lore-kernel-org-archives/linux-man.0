From: Eric Dumazet <eric.dumazet-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ip.7: add IP_BIND_ADDRESS_NO_PORT description
Date: Wed, 03 Feb 2016 07:44:37 -0800
Message-ID: <1454514277.7627.232.camel@edumazet-glaptop2.roam.corp.google.com>
References: <1454369722.7627.191.camel@edumazet-glaptop2.roam.corp.google.com>
	 <56B21372.8030001@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56B21372.8030001-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Wed, 2016-02-03 at 15:49 +0100, Michael Kerrisk (man-pages) wrote:
> Hi Eric,
> 
> On 02/02/2016 12:35 AM, Eric Dumazet wrote:
> > From: Eric Dumazet <edumazet-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
> > 
> > Documentation for IP_BIND_ADDRESS_NO_PORT socket option
> > added in linux-4.2
> > http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=90c337da1524863838658078ec34241f45d8394d
> 
> Thanks for the patch. I've applied, and tweaked a little.
> It would be good to add a couple of sentences about
> why this option is useful and what use case it allows.
> Could you come up with something?

Well, port exhaustion is something hard to explain in a few words ;)

https://idea.popcount.org/2014-04-03-bind-before-connect/ is explaining
the problem quite well (but was written before IP_BIND_ADDRESS_NO_PORT
came)

Sure, I will post something about SO_MAX_PACING_RATE

Thanks.


--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
