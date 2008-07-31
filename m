From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: Report bugs for variations in error handling in math functions?
Date: Thu, 31 Jul 2008 16:02:50 +0200
Message-ID: <4891C60A.5000103@gmail.com>
References: <cfd18e0f0807250314h5c063754gd672c04b2eeef2f6@mail.gmail.com> <Pine.LNX.4.64.0807251535040.7701@digraph.polyomino.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <Pine.LNX.4.64.0807251535040.7701-9YEB1lltEqivcGRMvF24k2I39yigxGEX@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Joseph S. Myers" <joseph-qD8j1LwMmJjtCj0u4l0SBw@public.gmane.org>
Cc: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org, Andreas Jaeger <aj-Et1tbQHTxzrQT0dZR+AlfA@public.gmane.org>, Andries Brouwer <Andries.Brouwer-rh8NL+sEX9E@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

> I think the correct approach is to consider it a bug if functions do not 
> set errno, or do not raise exceptions - that is, all of (b), (c) and (d) 
> are bugs.  This would allow math_errhandling to be 
> MATH_ERRNO|MATH_ERREXCEPT unless translation units are compiled with 
> options preventing this, and make the error handling options available 
> consistent across the math.h functions supported by glibc.  To conform 
> with C99, at least one approach (errno or exceptions) must be consistently 
> supported across all the functions, in any case.

I've reported bugs for all of the non-conformances I found.

Cheers,

Michael

http://sources.redhat.com/bugzilla/show_bug.cgi?id=6759
http://sources.redhat.com/bugzilla/show_bug.cgi?id=6776
http://sources.redhat.com/bugzilla/show_bug.cgi?id=6777
http://sources.redhat.com/bugzilla/show_bug.cgi?id=6778
http://sources.redhat.com/bugzilla/show_bug.cgi?id=6779
http://sources.redhat.com/bugzilla/show_bug.cgi?id=6780
http://sources.redhat.com/bugzilla/show_bug.cgi?id=6781
http://sources.redhat.com/bugzilla/show_bug.cgi?id=6782
http://sources.redhat.com/bugzilla/show_bug.cgi?id=6783
http://sources.redhat.com/bugzilla/show_bug.cgi?id=6783
http://sources.redhat.com/bugzilla/show_bug.cgi?id=6783
http://sources.redhat.com/bugzilla/show_bug.cgi?id=6785
http://sources.redhat.com/bugzilla/show_bug.cgi?id=6786
http://sources.redhat.com/bugzilla/show_bug.cgi?id=6787
http://sources.redhat.com/bugzilla/show_bug.cgi?id=6788
http://sources.redhat.com/bugzilla/show_bug.cgi?id=6792
http://sources.redhat.com/bugzilla/show_bug.cgi?id=6793
http://sources.redhat.com/bugzilla/show_bug.cgi?id=6794
http://sources.redhat.com/bugzilla/show_bug.cgi?id=6795
http://sources.redhat.com/bugzilla/show_bug.cgi?id=6796
http://sources.redhat.com/bugzilla/show_bug.cgi?id=6797
http://sources.redhat.com/bugzilla/show_bug.cgi?id=6798
http://sources.redhat.com/bugzilla/show_bug.cgi?id=6799
http://sources.redhat.com/bugzilla/show_bug.cgi?id=6801
http://sources.redhat.com/bugzilla/show_bug.cgi?id=6801
http://sources.redhat.com/bugzilla/show_bug.cgi?id=6803
http://sources.redhat.com/bugzilla/show_bug.cgi?id=6803
http://sources.redhat.com/bugzilla/show_bug.cgi?id=6804
http://sources.redhat.com/bugzilla/show_bug.cgi?id=6805
http://sources.redhat.com/bugzilla/show_bug.cgi?id=6806
http://sources.redhat.com/bugzilla/show_bug.cgi?id=6807
http://sources.redhat.com/bugzilla/show_bug.cgi?id=6808
http://sources.redhat.com/bugzilla/show_bug.cgi?id=6809
http://sources.redhat.com/bugzilla/show_bug.cgi?id=6810

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
