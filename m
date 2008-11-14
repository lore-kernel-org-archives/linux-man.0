From: "Bert Wesarg" <bert.wesarg-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: For review: pthread_cancel.3
Date: Fri, 14 Nov 2008 19:01:22 +0100
Message-ID: <36ca99e90811141001s4b8eb58fnee18ff3b14f4977e@mail.gmail.com>
References: <cfd18e0f0811140917q5340504akc53d7ffa3eea483@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cfd18e0f0811140917q5340504akc53d7ffa3eea483-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, josv-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, =?UTF-8?Q?Loic_Domaign=C3=A9?= <loic-Z4JMKDdsf89Wk0Htik3J/w@public.gmane.org>, Karsten Weiss <K.Weiss-Pt+Xe7GJXK+P2YhJcF5u+nqWYbMAw+HU@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Michael,

I haven't read all over, but maybe its worth to combine such features
into one man page. I.e. for this particular case put:

 pthread_cancel (3),
 pthread_setcancelstate (3),
 pthread_setcanceltype (3),
 pthread_testcancel (3)

in.

You have done this here to some extent, except no prototypes for the
other functions and the symbolic constants.  It looks like the old
LinuxThread man pages are of this type.  If your are not a friend of
this combining, its ok, but I want it to bring up for discussion.

Bert
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
