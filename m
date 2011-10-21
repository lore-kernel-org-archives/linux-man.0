From: Jonathan Nieder <jrnieder-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 4/6] ld.so.8: document Debian's /etc/ld.so.nohwcap
 extension
Date: Fri, 21 Oct 2011 00:30:47 -0500
Message-ID: <20111021053047.GG23372@elie.hsd1.il.comcast.net>
References: <20111020070037.GA11392@elie.hsd1.il.comcast.net>
 <20111020071424.GD11485@elie.hsd1.il.comcast.net>
 <201110201411.03656.vapier@gentoo.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <201110201411.03656.vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Aurelien Jarno <aurelien-rXXEIb44qovR7s880joybQ@public.gmane.org>, Reuben Thomas <rrt-0NV8xZLkR+A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Mike Frysinger wrote:

> use IFUNC and then there's usually no need for hwcap alternatives

I see.  (I'm not sure that's always true yet for optimizations GCC
knows about, but it's certainly a good direction to go in.)

> On Thursday 20 October 2011 03:14:24 Jonathan Nieder wrote:

>> --- a/man8/ld.so.8
>> +++ b/man8/ld.so.8
>>
>> +.I /etc/ld.so.nohwcap
>> +(Debian only, since glibc 2.2.93-1)
>
> i think this belongs in Debian's man-page patchset

Fair enough.  Let's drop it from this series, and I can ask joey
whether he thinks it's worth documenting when proposing installing
these pages in Debian manpages.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
