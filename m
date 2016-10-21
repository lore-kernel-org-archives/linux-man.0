From: Stephan Mueller <smueller-T9tCv8IpfcWELgA04lAiVw@public.gmane.org>
Subject: Re: [PATCH] Update the random(4) documentation towards a more accurate view on /dev/urandom
Date: Fri, 21 Oct 2016 18:50:58 +0200
Message-ID: <4610047.a51zB7LfZj@tauon.atsec.com>
References: <1461574090.32558.45.camel@redhat.com> <2402524.TIv9Kdt40z@tauon.atsec.com> <20161021163314.cvhjgr4s7lfzdsve@thunk.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161021163314.cvhjgr4s7lfzdsve-AKGzg7BKzIDYtjvyW6yDsg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Theodore Ts'o <tytso-3s7WtUTddSA@public.gmane.org>
Cc: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Nikos Mavrogiannopoulos <nmav-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Laurent Georget <laurent.georget-vbcOdlJ0SulGWvitb5QawA@public.gmane.org>, George Spelvin <linux-gpGsJRJZ3PBBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Am Freitag, 21. Oktober 2016, 12:33:14 CEST schrieb Theodore Ts'o:

Hi Theodore,

> 
> It would certainly be a good idea to suggest the use of getrandom(2),
> and the fact that the only difference between getrandom(2) and
> /dev/urandom is that getrandom(2) will block until it can safely
> generate random numbers.  Unfortunately, there are far too many
> programs (including udev and systemd!) that try to use /dev/urandom at
> boot time, and making a change to /dev/urandom would break users.  If
> any of these use cases are security sensitive, they should really
> change it so that users aren't vulnerable to security attacks.  (The
> use of systemd on IOT devices especially terrifies me in this regard.)

Although I this is not related to the man page, please note that I have tried 
this approach during the development of my LRNG. systemd did not like that at 
all. The system did not come up, even though there was only 0.5 seconds it 
would need to wait until getrandom would unblock during my tests.

Ciao
Stephan
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
