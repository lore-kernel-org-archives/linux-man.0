From: Theodore Ts'o <tytso-3s7WtUTddSA@public.gmane.org>
Subject: Re: [PATCH] Update the random(4) documentation towards a more
 accurate view on /dev/urandom
Date: Fri, 21 Oct 2016 13:56:33 -0400
Message-ID: <20161021175633.5x5mp2xv3wq4ejjf@thunk.org>
References: <1461574090.32558.45.camel@redhat.com>
 <2402524.TIv9Kdt40z@tauon.atsec.com>
 <20161021163314.cvhjgr4s7lfzdsve@thunk.org>
 <4610047.a51zB7LfZj@tauon.atsec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4610047.a51zB7LfZj-gNvIQDDl/k7Ia13z/PHSgg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephan Mueller <smueller-T9tCv8IpfcWELgA04lAiVw@public.gmane.org>
Cc: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Nikos Mavrogiannopoulos <nmav-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Laurent Georget <laurent.georget-vbcOdlJ0SulGWvitb5QawA@public.gmane.org>, George Spelvin <linux-gpGsJRJZ3PBBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Fri, Oct 21, 2016 at 06:50:58PM +0200, Stephan Mueller wrote:
> > It would certainly be a good idea to suggest the use of getrandom(2),
> > and the fact that the only difference between getrandom(2) and
> > /dev/urandom is that getrandom(2) will block until it can safely
> > generate random numbers.  Unfortunately, there are far too many
> > programs (including udev and systemd!) that try to use /dev/urandom at
> > boot time, and making a change to /dev/urandom would break users.  If
> > any of these use cases are security sensitive, they should really
> > change it so that users aren't vulnerable to security attacks.  (The
> > use of systemd on IOT devices especially terrifies me in this regard.)
> 
> Although I this is not related to the man page, please note that I have tried 
> this approach during the development of my LRNG. systemd did not like that at 
> all. The system did not come up, even though there was only 0.5 seconds it 
> would need to wait until getrandom would unblock during my tests.

Although I'd argue this is a systemd bug, to be fair to systemd, when
I briefly tried this approach, the zero day kernel testing system, let
me know than an older version of Ubuntu (which wasn't using systemd),
and CeroWrt (which also doesn't use systemd) were also hanging.

I haven't checked to see if that was because Cerowrt was trying to do
something security sensitive such as creating ssh host keys.  I've
been too busy, and I was afriad the result would be too depressing....
Besides, I don't use Cerowrt thes days, since I'm using Google OnHub
now.  :-)

     	       	     	 	    	   - Ted
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
