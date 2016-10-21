From: Stephan Mueller <smueller-T9tCv8IpfcWELgA04lAiVw@public.gmane.org>
Subject: Re: [PATCH] Update the random(4) documentation towards a more accurate view on /dev/urandom
Date: Fri, 21 Oct 2016 20:00:34 +0200
Message-ID: <1726851.hdjQplLLFm@tauon.atsec.com>
References: <1461574090.32558.45.camel@redhat.com> <4610047.a51zB7LfZj@tauon.atsec.com> <20161021175633.5x5mp2xv3wq4ejjf@thunk.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161021175633.5x5mp2xv3wq4ejjf-AKGzg7BKzIDYtjvyW6yDsg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Theodore Ts'o <tytso-3s7WtUTddSA@public.gmane.org>
Cc: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Nikos Mavrogiannopoulos <nmav-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Laurent Georget <laurent.georget-vbcOdlJ0SulGWvitb5QawA@public.gmane.org>, George Spelvin <linux-gpGsJRJZ3PBBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Am Freitag, 21. Oktober 2016, 13:56:33 CEST schrieb Theodore Ts'o:

Hi Theodore,

> > Although I this is not related to the man page, please note that I have
> > tried this approach during the development of my LRNG. systemd did not
> > like that at all. The system did not come up, even though there was only
> > 0.5 seconds it would need to wait until getrandom would unblock during my
> > tests.
> 
> Although I'd argue this is a systemd bug, to be fair to systemd, when
> I briefly tried this approach, the zero day kernel testing system, let
> me know than an older version of Ubuntu (which wasn't using systemd),
> and CeroWrt (which also doesn't use systemd) were also hanging.
> 
> I haven't checked to see if that was because Cerowrt was trying to do
> something security sensitive such as creating ssh host keys.  I've
> been too busy, and I was afriad the result would be too depressing....
> Besides, I don't use Cerowrt thes days, since I'm using Google OnHub
> now.  :-)

I will dig into that matter a bit further as I need an answer for this 
behavior for other purposes.

When I find the cause, I will report it.

Ciao
Stephan
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
