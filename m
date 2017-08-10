From: Krzysztof =?UTF-8?Q?B=C5=82aszkowski?= <kb-1uxCHCk6ZAMgbZ1banK5DA@public.gmane.org>
Subject: Re: [PATCH man-pages] open.2: improve O_PATH documentation.
Date: Thu, 10 Aug 2017 16:02:58 +0200
Message-ID: <1502373778.9644.27.camel@sysmikro.com.pl>
References: <873790rtni.fsf@notabene.neil.brown.name>
         <20170810102104.GA16888@gardel-login>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170810102104.GA16888@gardel-login>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lennart Poettering <lennart-mdGvqq1h2p+GdvJs77BJ7Q@public.gmane.org>, NeilBrown <neilb-IBi9RG/b67k@public.gmane.org>
Cc: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-fsdevel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Mr Poettering,


I don't know exactly what is the whole discussion about but Mr
consider (very seriously) this regarding C language, C coding,
compilers and program execution:

claim #1: "==" is compare operator another words result is considered
to be true if both arguments are same binary

claim #2: it is possible to compare different types to each other, e.g.
int to char, long long to short

claim #3: if both arguments are of different sizes then compiler
extends shorter type to the size of larger argument padding with 0s.

claim #4: compiler uses type of variable for immediate constant when
comparing the variable to it. thus even bitfields comparisons work.

claim #5: the compiler is modern gcc

thus your whole thesis is damn crap especially your claim like "Linux
is broken". you could write glibc is broken because it does not
"expose" (which is not strictly true) the fsword_t 

Do you know what the term "Linux" stands for ?
I can give you explanation but there are so many other noble developers
which can do this better and it is disappointing that they haven't done
this yet.


I could ignore your email like others did but once upon I gave you a
proof that because systemd-logging can't do better recovery than
underlying file system then doing so by systemd-logging is utterly
stupid, so if you, Mr Poettering, stop doing more userspace crap then
whole "Linux" will only benefit from this.


And the Red Hat should fire you out.
I reckon that fools are the worst plague in the World and that's why I
stopped tolerating fools.
I am a racist - I hate fools.


On Thu, 2017-08-10 at 12:21 +0200, Lennart Poettering wrote:
> On Do, 10.08.17 13:25, NeilBrown (neilb-IBi9RG/b67k@public.gmane.org) wrote:
> 
> > 
> > +If
> > +.I pathname
> > +refers to an automount point that has not yet been triggered, so
> > no
> > +other filesystem is mounted on it, then the call returns a file
> > +descriptor referring to the automount directory without triggering
> > a mount.
> > +.BR fstatfs (2)
> > +can then be used to determine if it is, in fact, an untriggered
> > +automount point
> > +.RB ( ".f_type == AUTOFS_SUPER_MAGIC" ).
> 
> Because Linux is broken you shouldn't compare f_type just like this,
> and the man page probably shouldn't suggest that either I figure. The
> only safe way is something like this:
> 
>      s.f_type == (typeof(s.f_type)) AUTOFS_SUPER_MAGIC
> 
> That's because f_type is defined with different types (both signed
> and
> unsigned) on different archs, and the magic values tend to use the
> full unsigned 32bit range...
> 
> (Yes, strictly speaking AUTOFS_SUPER_MAGIC isn't one of the unsigned
> 32bit ones, but I think it's better to stick the same rules for all
> magic values comparisons here...)
> 
> (And yes, the statfs() man page only mentions the problem briefly,
> without the typeof way out, but it really should)
> 
> Lennart
> 
-- 
Krzysztof Blaszkowski
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
