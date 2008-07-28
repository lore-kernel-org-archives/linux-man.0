From: "Joseph S. Myers" <joseph-qD8j1LwMmJjtCj0u4l0SBw@public.gmane.org>
Subject: Re: Report bugs for variations in error handling in math functions?
Date: Mon, 28 Jul 2008 17:05:49 +0000 (UTC)
Message-ID: <Pine.LNX.4.64.0807281700520.16015@digraph.polyomino.org.uk>
References: <cfd18e0f0807250314h5c063754gd672c04b2eeef2f6@mail.gmail.com>
 <Pine.LNX.4.64.0807251535040.7701@digraph.polyomino.org.uk>
 <cfd18e0f0807272254k54343bc3pdddde9afca423eec@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cfd18e0f0807272254k54343bc3pdddde9afca423eec-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Cc: libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org, Andreas Jaeger <aj-Et1tbQHTxzrQT0dZR+AlfA@public.gmane.org>, Andries Brouwer <Andries.Brouwer-rh8NL+sEX9E@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Mon, 28 Jul 2008, Michael Kerrisk wrote:

> > I've run third-party C conformance tests on glibc that have shown similar
> > issues.
> 
> By the way, Joseph, which particular conformance test suite(s) were
> you using?  Are these freely available test suite(s)?

No, proprietary (Plum Hall).  I'm not aware of free C library conformance 
testsuites, although such tests may be available in particular areas (e.g. 
I used ucbtest to test soft-fp changes).

-- 
Joseph S. Myers
joseph-qD8j1LwMmJjtCj0u4l0SBw@public.gmane.org
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
