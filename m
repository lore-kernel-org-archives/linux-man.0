From: "Michael Kerrisk" <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: For review: pthread_cancel.3
Date: Fri, 14 Nov 2008 13:37:59 -0500
Message-ID: <cfd18e0f0811141037h6f9df3b7r888e5d0f7453baff@mail.gmail.com>
References: <cfd18e0f0811140917q5340504akc53d7ffa3eea483@mail.gmail.com>
	 <36ca99e90811141001s4b8eb58fnee18ff3b14f4977e@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <36ca99e90811141001s4b8eb58fnee18ff3b14f4977e-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bert Wesarg <bert.wesarg-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, josv-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, =?ISO-8859-1?Q?Loic_Domaign=E9?= <loic-Z4JMKDdsf89Wk0Htik3J/w@public.gmane.org>, Karsten Weiss <K.Weiss-Pt+Xe7GJXK+P2YhJcF5u+nqWYbMAw+HU@public.gmane.org>
List-Id: linux-man@vger.kernel.org

HI Bert,

On Fri, Nov 14, 2008 at 1:01 PM, Bert Wesarg <bert.wesarg-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org> wrote:
> Michael,
>
> I haven't read all over, but maybe its worth to combine such features
> into one man page. I.e. for this particular case put:
>
>  pthread_cancel (3),
>  pthread_setcancelstate (3),
>  pthread_setcanceltype (3),
>  pthread_testcancel (3)
>
> in.
>
> You have done this here to some extent, except no prototypes for the
> other functions and the symbolic constants.  It looks like the old
> LinuxThread man pages are of this type.  If your are not a friend of
> this combining, its ok, but I want it to bring up for discussion.

I did consider this.  In particular, I noticed that the POSIX.1 spec combines:

  pthread_setcancelstate (3),
  pthread_setcanceltype (3),
  pthread_testcancel (3)

But, in the end, I decide there was (just) enough orthogonality
between the first pair and the last one that I preferred to do them on
separate pages.  As for combining pthread_cancel(3) with some/all of
the above, pthread_setcancel*.3 the case was more clear cut:
pthread_testcancel(3) is big enough that combining it with say
pthread_setcancel*.3 would IMO have created a page that was too long
and unwieldy.  (Yes, I appreciate there is a little redundancy between
my pthead_cance.3 and pthread_setcancelstate.3 pages, but I don't
think it is really a problem.)

Cheers,

Michael
-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
git://git.kernel.org/pub/scm/docs/man-pages/man-pages.git
man-pages online: http://www.kernel.org/doc/man-pages/online_pages.html
Found a bug? http://www.kernel.org/doc/man-pages/reporting_bugs.html
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
