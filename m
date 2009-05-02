From: Christoph Bartoschek <bartoschek-eefaeeawk+jFLWzOrOlZPg@public.gmane.org>
Subject: Re: Problem in manpage of uname(2)
Date: Sat, 2 May 2009 11:50:26 +0200
Message-ID: <200905021150.26901.bartoschek@or.uni-bonn.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi,

> Since we only get a utsname structure back from the kernel, I'm not
> sure why we would need to care about initializing it as shown here.
> Can you say some more please.

I guess it is misguided optimization but I have to stick with it. We have a 
file with a variable:

static struct utsname name = {"", "", "", "", "", ""};

And then functions like this one:

char const * utsys_version(void) {
  if (!*(name.version)) uname(&name);

  return name.version;
}

I guess this approach is taken because the original author worried about 
performance and for example utsys_nodename is called very often.

On the other hand I wonder why there is the need to rename domainname to 
__domainname at all? 

Christoph

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
