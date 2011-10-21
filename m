From: Jonathan Nieder <jrnieder-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 5/6] ld.so.8: document $PLATFORM and $LIB expansion
Date: Fri, 21 Oct 2011 00:25:28 -0500
Message-ID: <20111021052528.GF23372@elie.hsd1.il.comcast.net>
References: <20111020070037.GA11392@elie.hsd1.il.comcast.net>
 <20111020071538.GE11485@elie.hsd1.il.comcast.net>
 <201110201416.30351.vapier@gentoo.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <201110201416.30351.vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Aurelien Jarno <aurelien-rXXEIb44qovR7s880joybQ@public.gmane.org>, Reuben Thomas <rrt-0NV8xZLkR+A@public.gmane.org>, Reinhard Tartler <siretart-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

(-cc: pasky, since I had his address wrong.  Goodbye, suse addresses.)
Mike Frysinger wrote:
> On Thursday 20 October 2011 03:15:38 Jonathan Nieder wrote:

>> +.B LIB
>> +The string \fB$LIB\fR (or equivalently \fB${LIB}\fR) represents
>> +the system libraries directory, which is /lib for the native architecture
>> +on FHS compliant GNU/Linux systems.
>
> a better description might be something like "$LIB expands to the short libdir 
> name that glibc was configured to install into". and then refer to it usually 
> being "/lib" for the native ABI (not architecture) on FHS compliant Linux 
> systems.  man-pages does not use the "GNU/" noise qualification.

Right, it's $(slibdir), which goes in configparms since autoconf is
not wired to handle the /usr/lib vs /lib distinction.  The FHS
describes the contents of /lib as "Essential shared libraries and
kernel modules".

I guess it should say:

	$LIB expands to the path to the "essential shared libraries"
	directory, which is /lib for the native ABI on FHS compliant
	systems.

The FHS is supposed to apply to non-Linux Unix systems too, anyway.

But that leaves me with questions:

 - what is $LIB for a non-native ABI?

 - does anyone customize this to point somewhere else and make their
   machine non-FHS-compliant?  Maybe NixOS and Gentoo Prefix do.
   What would a person typically use ${LIB} in an rpath for?
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
