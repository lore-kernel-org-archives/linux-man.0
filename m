From: Jonathan Nieder <jrnieder-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/6] ld.so.8: clarify synopsis
Date: Thu, 20 Oct 2011 13:39:38 -0500
Message-ID: <20111020183938.GC5563@elie.hsd1.il.comcast.net>
References: <20111020070037.GA11392@elie.hsd1.il.comcast.net>
 <20111020070412.GA11485@elie.hsd1.il.comcast.net>
 <201110201408.34778.vapier@gentoo.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <201110201408.34778.vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org>, Aurelien Jarno <aurelien-rXXEIb44qovR7s880joybQ@public.gmane.org>, Reuben Thomas <rrt-0NV8xZLkR+A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Mike Frysinger wrote:
> On Thursday 20 October 2011 03:04:12 Jonathan Nieder wrote:

>> +.RB \*(lq /lib/ld-linux.so.*
>> +.RI [ options ]
>> +.I program
>> +.RI [ arguments ]\*(rq.
>
> can we avoid lq/rq ?

Sorry about that.  I couldn't figure out how to get a literal
quotation mark in there, but more to the point, it would have
been better to just say something like

	.B /lib/ld-linux.so.*
	or
	.BR /lib64/ld-linux-x86-64.so.2 .

here.

So, um, yes we can avoid the nonportable quote mark style, and
it even would make the page a little better.

I'll reroll once reviewing v1 stops seeming fruitful.

> the rest looks fine to me.

Thanks for looking it over.  
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
