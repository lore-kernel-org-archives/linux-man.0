From: Davide Libenzi <davidel-AhlLAIvw+VEjIGhXcJzhZg@public.gmane.org>
Subject: Re: [PATCH] Epoll documentation
Date: Fri, 22 Feb 2008 09:05:22 -0800 (PST)
Message-ID: <Pine.LNX.4.64.0802220903530.27173@alien.or.mcafeemobile.com>
References: <1203689065.3021.79.camel@linux.heathens.co.nz>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="1795850513-1369508709-1203699922=:27173"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1203689065.3021.79.camel-DBi1IKlRe8YXiSwHZUBl+UgmxNRb6L7S@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chris =?UTF-8?Q?=22=E3=82=AF=22?= Heath <chris-FSXMH2gLahXJKwlM9GxbOw@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--1795850513-1369508709-1203699922=:27173
Content-Type: TEXT/PLAIN; charset=X-UNKNOWN
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Fri, 22 Feb 2008, Chris "=E3~B=AF" Heath wrote:

> A few months ago, Davide Libenzi wrote this message on lkml:
>   http://marc.info/?l=3Dlinux-kernel&m=3D119368443105320&w=3D2
> but apparently hasn't found time yet to review the man page.
>=20
> So I figured it might work better if I propose a patch and get Davide to
> ack it or suggest further changes.  My proposed patch to epoll(7) is
> below.
>=20
> Feedback would be appreciated.  In particular, I removed reference to
> threads in A1 because I was unable to find a test case where I didn't
> get EEXIST.  Maybe I'm missing something.

I already sent a patch for that to Michael Kerrisk, short after I posted=20
that message.


- Davide


--1795850513-1369508709-1203699922=:27173--
