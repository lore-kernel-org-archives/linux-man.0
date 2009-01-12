From: Simon Oosthoek <simon-Hf+EfML1qzhUecB6AVeNQA@public.gmane.org>
Subject: Re: regex.7 manpage is awful
Date: Mon, 12 Jan 2009 11:29:51 +0100
Message-ID: <200901121129.51690.simon@atcomputing.nl>
References: <20090109102208.GA22747@atcmpg.ATComputing.nl> <20090109113852.GB21648@machine.or.cz>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20090109113852.GB21648-DDGJ70k9y3lX+M3pkMnKjw@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Jan Christiaan van Winkel <jc-I2/4/b2VdYhUecB6AVeNQA@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Friday 09 January 2009 12:38, Petr Baudis wrote:
> I doubt that you will succeed in adding a third regexp mode at this
> point, but the POSIX development process seems very open, so feel free
> to propose this: http://www.opengroup.org/austin/

Thanks for the link, but I'd have to think longer about it before I would 
propose something like this ;-)

[snip - good suggestions!]

>
> (grep(1) has nice, concise and incomplete regex description.)

I guess that would be a good place to start. And to verify all the things 
mentioned there to some common GNU implementations (since these are the 
Linux/GNU manpages).
It might be worthwhile to create a section called PORTABILITY and list 
all known exceptions to the description above it and wether the 
behaviour is POSIX.2 compliant.

Cheers

Simon
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
