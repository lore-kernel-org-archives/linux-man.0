From: "Michael Kerrisk" <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: random_r.3 man pages
Date: Tue, 4 Mar 2008 10:54:18 +0100
Message-ID: <cfd18e0f0803040154v3021e693i11232ac1740461c3@mail.gmail.com>
References: <20080222122651.GA27115@affenbande.org>
	 <cfd18e0f0802260317k7c2119bdg42c6ff3cd7fc4327@mail.gmail.com>
	 <20080226124127.GA24141@mette>
	 <cfd18e0f0802260754y22ee5b8bxeecf652e95267934@mail.gmail.com>
	 <20080226203531.GA24804@mette> <47CC47C5.1030902@gmail.com>
	 <20080303191415.GA2682@mette>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20080303191415.GA2682@mette>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Andries E. Brouwer" <Andries.Brouwer-rh8NL+sEX9E@public.gmane.org>
Cc: Tolga Dalman <tdalman-PWUXgD0Mw7jQPojr80n/Gg@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Mon, Mar 3, 2008 at 8:14 PM, Andries E. Brouwer
<Andries.Brouwer-rh8NL+sEX9E@public.gmane.org> wrote:
> On Mon, Mar 03, 2008 at 07:47:33PM +0100, Michael Kerrisk wrote:
> > Hi Andries, (and anyone else who cares to comment)
> >
> > This is my first pass at a random_r.3 page.  Would you be willing to look
> > it over to check if it's okay?
>
> >        int random_r(struct random_data *buf, int32_t result);
>
> Hi Michael,
>
> What about adding a * in front of result?

Thanks for spotting that.  Otherwise, the page looked okay?

Cheers,

Michael

-- 
Michael Kerrisk
Maintainer of the Linux man-pages project
http://www.kernel.org/doc/man-pages/
Want to report a man-pages bug?  Look here:
http://www.kernel.org/doc/man-pages/reporting_bugs.html
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
