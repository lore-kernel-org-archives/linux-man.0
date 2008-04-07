From: Justin Pryzby <justinpryzby-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
Subject: Re: manpages: explicit set SIGCHLD to SIG_IGN is distinct from
	SIG_DFL
Date: Mon, 7 Apr 2008 17:20:10 -0400
Message-ID: <20080407212010.GA23866@cetus>
References: <20080407161651.GA22034@cetus> <cfd18e0f0804071404j630a631ev6991dfff67fc406e@mail.gmail.com> <cfd18e0f0804071408k6a559321xd80a792f62879d81@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <cfd18e0f0804071408k6a559321xd80a792f62879d81-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Mon, Apr 07, 2008 at 11:08:02PM +0200, Michael Kerrisk wrote:
> On Mon, Apr 7, 2008 at 11:04 PM, Michael Kerrisk
> <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org> wrote:
> >
> > On Mon, Apr 7, 2008 at 6:16 PM, Justin Pryzby
> > <justinpryzby-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org> wrote:
> > > Version: 2.79-2
> > > File: /usr/share/man/man2/wait.2.gz
> > >
> > > the SIGCHLD action to SIG_IGN inhibits the creation of zombie
> > > processes, even though kill(1) gives the "ignore" as the default
> > > disposition.

>     Note that even though the default disposition of SIGCHLD is
>     "ignore", explicitly setting the disposition to SIG_IGN results
>     in different treatement of zombie children.
> 
> Seem okay?
Yup.

Thanks,
Justin
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
