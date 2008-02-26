From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [PATCH] Epoll documentation
Date: Tue, 26 Feb 2008 16:13:19 +0100
Message-ID: <47C42C8F.7000504@gmail.com>
References: <1203689065.3021.79.camel@linux.heathens.co.nz>	 <Pine.LNX.4.64.0802220903530.27173@alien.or.mcafeemobile.com> <cfd18e0f0802221016o2a3f2b83hfd89f4bf8d35fb1c@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cfd18e0f0802221016o2a3f2b83hfd89f4bf8d35fb1c-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Davide Libenzi <davidel-AhlLAIvw+VEjIGhXcJzhZg@public.gmane.org>
Cc: Chris ? Heath <chris-FSXMH2gLahXJKwlM9GxbOw@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Michael Kerrisk wrote:
> On Fri, Feb 22, 2008 at 6:05 PM, Davide Libenzi <davidel@xmailserver.=
org> wrote:
>> On Fri, 22 Feb 2008, Chris "=E3~B=AF" Heath wrote:
>>
>>> A few months ago, Davide Libenzi wrote this message on lkml:
>>>   http://marc.info/?l=3Dlinux-kernel&m=3D119368443105320&w=3D2
>>> but apparently hasn't found time yet to review the man page.
>>>
>>> So I figured it might work better if I propose a patch and get Davi=
de to
>>> ack it or suggest further changes.  My proposed patch to epoll(7) i=
s
>>> below.
>>>
>>> Feedback would be appreciated.  In particular, I removed reference =
to
>>> threads in A1 because I was unable to find a test case where I didn=
't
>>> get EEXIST.  Maybe I'm missing something.
>> I already sent a patch for that to Michael Kerrisk, short after I po=
sted
>> that message.
>=20
> That; true.  It's in my queue!

Davide,

Actually, that was not completely true, as far as I can tell.  You sent=
 me
a patch for Q6/A6 (which I finally responded to just now), but I can't =
find
any patch for Q1/A1...  I'll follow up in the other thread, and CC
linux-man and Chris.

Cheers,

Michael

--=20
Michael Kerrisk
Maintainer of the Linux man-pages project
http://www.kernel.org/doc/man-pages/
Want to report a man-pages bug?  Look here:
http://www.kernel.org/doc/man-pages/reporting_bugs.html
