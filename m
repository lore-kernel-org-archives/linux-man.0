From: Matt Zimmerman <mdz-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: Re: clearenv(3): implies that it's a security tool
Date: Fri, 19 Feb 2016 08:22:23 -0800
Message-ID: <20160219162222.GB14410@alcor.net>
References: <2022845728.87847295.1455816499626.JavaMail.root@zimbra51-e8.priv.proxad.net>
 <20160218203447.GF3560@alcor.net>
 <CAKgNAkh0qR-5Kj0-bc6QtAM7j44s41YfNMUOfi_BAiFHYVOO5g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAKgNAkh0qR-5Kj0-bc6QtAM7j44s41YfNMUOfi_BAiFHYVOO5g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: =?iso-8859-1?Q?St=E9phane?= Aulery <saulery-GANU6spQydw@public.gmane.org>, 679323-61a8vm9lEZVf4u+23C9RwQ@public.gmane.org, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Fri, Feb 19, 2016 at 12:59:05PM +0100, Michael Kerrisk (man-pages) wrote:
> On 18 February 2016 at 21:34, Matt Zimmerman <mdz-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org> wrote:
> > Thanks for following up.  My recommendation is to say something like:
> >
> > This function DOES NOT securely erase the contents of the environment.
> > Security-conscious applications which need to do this should use ....
> > instead.
> 
> So, I think this report is a little confused, but mainly because of
> the poor description in the man page.
> 
> The security-conscious applications in this context are those that
> want to precisely control the environment passed to an exec()ed
> program. clearenv() cannot, indeed must not, try to erase the buffers
> containing the environment definitions. (See putenv(3) to understand
> why.) I've adjusted the man page in away that I hope explains things
> better:
> 
>        The  clearenv()  function  may  be  useful  in security-conscious
>        applications that want to precisely control the environment  that
>        is  passed  to  programs executed using exec(3).  The application
>        would do this by first clearing the environment and  then  adding
>        select environment variables.
> 
>        Note that the main effect of clearenv() is to adjust the value of
>        the pointer environ(7); this function does not erase the contents
>        of the buffers containing the environment definitions.

Yes, that's much clearer, thank you!

-- 
 - mdz
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
