From: Jonathan Nieder <jrnieder-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 5/6] ld.so.8: document $PLATFORM and $LIB expansion
Date: Mon, 16 Apr 2012 11:59:45 -0500
Message-ID: <20120416165945.GS5813@burratino>
References: <20111020070037.GA11392@elie.hsd1.il.comcast.net>
 <201110201416.30351.vapier@gentoo.org>
 <20111021052528.GF23372@elie.hsd1.il.comcast.net>
 <201112102216.34565.vapier@gentoo.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <201112102216.34565.vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Aurelien Jarno <aurelien-rXXEIb44qovR7s880joybQ@public.gmane.org>, Reuben Thomas <rrt-0NV8xZLkR+A@public.gmane.org>, Reinhard Tartler <siretart-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Mike Frysinger wrote:
> On Friday 21 October 2011 01:25:28 Jonathan Nieder wrote:

>>    What would a person typically use ${LIB} in an rpath for?
>
> it's useful when you want to preload a library for multiple process types.  
> why this would get used in an RPATH tag, i can't really guess

Ah, that makes sense.  So it's for consistency with LD_LIBRARY_PATH
and LD_PRELOAD.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
