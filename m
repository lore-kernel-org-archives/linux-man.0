From: "Andries E. Brouwer" <Andries.Brouwer-rh8NL+sEX9E@public.gmane.org>
Subject: Re: random_r.3 man pages
Date: Mon, 3 Mar 2008 20:14:15 +0100
Message-ID: <20080303191415.GA2682@mette>
References: <20080222122651.GA27115@affenbande.org> <cfd18e0f0802260317k7c2119bdg42c6ff3cd7fc4327@mail.gmail.com> <20080226124127.GA24141@mette> <cfd18e0f0802260754y22ee5b8bxeecf652e95267934@mail.gmail.com> <20080226203531.GA24804@mette> <47CC47C5.1030902@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <47CC47C5.1030902-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Cc: "Andries E. Brouwer" <Andries.Brouwer-rh8NL+sEX9E@public.gmane.org>, Tolga Dalman <tdalman-PWUXgD0Mw7jQPojr80n/Gg@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Mon, Mar 03, 2008 at 07:47:33PM +0100, Michael Kerrisk wrote:
> Hi Andries, (and anyone else who cares to comment)
> 
> This is my first pass at a random_r.3 page.  Would you be willing to look
> it over to check if it's okay?

>        int random_r(struct random_data *buf, int32_t result);

Hi Michael,

What about adding a * in front of result?

Andries

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
