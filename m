From: "Michael Kerrisk" <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [PATCH] Epoll documentation
Date: Fri, 22 Feb 2008 19:16:56 +0100
Message-ID: <cfd18e0f0802221016o2a3f2b83hfd89f4bf8d35fb1c@mail.gmail.com>
References: <1203689065.3021.79.camel@linux.heathens.co.nz>
	 <Pine.LNX.4.64.0802220903530.27173@alien.or.mcafeemobile.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <Pine.LNX.4.64.0802220903530.27173-GPJ85BhbkB8RepQJljzAVbITYcZ0+W3JAL8bYrjMMd8@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Davide Libenzi <davidel-AhlLAIvw+VEjIGhXcJzhZg@public.gmane.org>
Cc: =?ISO-2022-JP?B?Q2hyaXMgIhskQiUvGyhCIiBIZWF0aA==?= <chris-FSXMH2gLahXJKwlM9GxbOw@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Fri, Feb 22, 2008 at 6:05 PM, Davide Libenzi <davidel-AhlLAIvw+VFwn5V/fVEdqA@public.gmane.org=
g> wrote:
> On Fri, 22 Feb 2008, Chris "=E3~B=AF" Heath wrote:
>
> > A few months ago, Davide Libenzi wrote this message on lkml:
> >   http://marc.info/?l=3Dlinux-kernel&m=3D119368443105320&w=3D2
> > but apparently hasn't found time yet to review the man page.
> >
> > So I figured it might work better if I propose a patch and get Davi=
de to
> > ack it or suggest further changes.  My proposed patch to epoll(7) i=
s
> > below.
> >
> > Feedback would be appreciated.  In particular, I removed reference =
to
> > threads in A1 because I was unable to find a test case where I didn=
't
> > get EEXIST.  Maybe I'm missing something.
>
> I already sent a patch for that to Michael Kerrisk, short after I pos=
ted
> that message.

That; true.  It's in my queue!

Cheers,

Michael

--=20
Michael Kerrisk
Maintainer of the Linux man-pages project
http://www.kernel.org/doc/man-pages/
Want to report a man-pages bug?  Look here:
http://www.kernel.org/doc/man-pages/reporting_bugs.html
